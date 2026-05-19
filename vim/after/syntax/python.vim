" Disable pythonEllipses, which breaks ".."
"
if exists('b:current_syntax') && b:current_syntax ==# 'python'
    syntax clear pythonEllipsis
endif
