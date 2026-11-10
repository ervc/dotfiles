" Show only LSP *errors* as virtual text at the end of the line.
" Warnings, info and hints stay out of the way: they appear in the popup when
" the cursor rests on the line (g:lsp_diagnostics_float_cursor in vimrc).
"
" vim-lsp's own virtual text can't filter by severity, so it is disabled in
" vimrc (g:lsp_diagnostics_virtual_text_enabled = 0) and this replaces it.
"
" Options:
"   g:lsp_error_text_align   'after' (default), 'right', 'below' or 'above'

if exists('g:loaded_lsp_error_text') || !has('textprop') || !has('patch-9.0.0178')
    finish
endif
let g:loaded_lsp_error_text = 1

let s:type = 'lsp_error_text'
let s:timer = -1

" fallback if the colorscheme doesn't style vim-lsp's virtual text
highlight default link LspErrorVirtualText ErrorMsg
call prop_type_add(s:type, {'highlight': 'LspErrorVirtualText'})

function! s:Clear(bufnr) abort
    if bufloaded(a:bufnr)
        call prop_remove({'type': s:type, 'bufnr': a:bufnr, 'all': v:true})
    endif
endfunction

function! s:Update(bufnr) abort
    call s:Clear(a:bufnr)
    if !bufloaded(a:bufnr) || !exists('*lsp#internal#diagnostics#state#_get_all_diagnostics_grouped_by_server_for_uri')
        return
    endif
    " don't redraw errors while typing in this buffer
    if a:bufnr == bufnr('%') && mode() =~# '^[iR]'
        return
    endif

    let l:uri = lsp#utils#get_buffer_uri(a:bufnr)
    let l:by_server = lsp#internal#diagnostics#state#_get_all_diagnostics_grouped_by_server_for_uri(l:uri)
    let l:last = getbufinfo(a:bufnr)[0].linecount
    let l:shown = {}

    for l:response in values(l:by_server)
        for l:d in lsp#utils#iterable(get(get(l:response, 'params', {}), 'diagnostics', []))
            " LSP severity: 1 error, 2 warning, 3 info, 4 hint
            if get(l:d, 'severity', 3) != 1
                continue
            endif
            let l:lnum = min([l:d.range.start.line + 1, l:last])
            if l:lnum < 1 || has_key(l:shown, l:lnum)
                continue " one message per line; the popup shows the rest
            endif
            let l:shown[l:lnum] = 1
            call prop_add(l:lnum, 0, {
                \ 'type': s:type,
                \ 'bufnr': a:bufnr,
                \ 'text': split(l:d.message, "\n")[0],
                \ 'text_align': get(g:, 'lsp_error_text_align', 'after'),
                \ 'text_padding_left': 2,
                \ 'text_wrap': 'truncate',
                \ })
        endfor
    endfor
endfunction

function! s:UpdateVisible(...) abort
    for l:bufnr in uniq(sort(map(getwininfo(), 'v:val.bufnr')))
        call s:Update(l:bufnr)
    endfor
endfunction

" diagnostics can arrive in bursts; redraw once they settle
function! s:Schedule() abort
    call timer_stop(s:timer)
    let s:timer = timer_start(200, function('s:UpdateVisible'))
endfunction

augroup lsp_error_text
    autocmd!
    autocmd User lsp_diagnostics_updated call s:Schedule()
    autocmd InsertEnter * call s:Clear(bufnr('%'))
    autocmd InsertLeave,BufWinEnter * call s:Schedule()
augroup END
