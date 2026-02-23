if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal indentexpr=GetTodoIndent(v:lnum)
setlocal indentkeys=!^F,o,O

let b:undo_indent = "setlocal indentexpr< indentkeys<"

function! GetTodoIndent(lnum) abort
    " Task lines start at column 0
    if getline(a:lnum) =~ '^\[.\+\]'
        return 0
    endif

    " Two or more blank lines above -> reset indent
    let prev = a:lnum - 1
    let blank_count = 0
    while prev > 0 && getline(prev) =~ '^\s*$'
        let blank_count += 1
        let prev -= 1
    endwhile
    if blank_count >= 2
        return 0
    endif

    " Previous non-blank line is a task title -> indent
    let prev_nonblank = prevnonblank(a:lnum - 1)
    if prev_nonblank == 0
        return 0
    endif
    let prev_line = getline(prev_nonblank)
    if prev_line =~ '^\[[^\]]\+\]'
        return &shiftwidth
    endif

    " Otherwise maintain previous indent
    return indent(prev_nonblank)
endfunction
