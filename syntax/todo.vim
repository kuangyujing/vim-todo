if exists("b:current_syntax")
    finish
endif

" Done task block: [-] marker, title, and indented content lines
syn region todoDoneBlock start=/^\[-\]/ end=/\n\ze\(\[.\]\|\S\|\s*$\)/me=s-1 contains=todoDoneMarker,todoDoneTitle,todoDoneContent
syn match todoDoneMarker /^\[-\]/ contained
syn match todoDoneTitle /^\[-\]\s\+.\+/ contained contains=todoDoneMarker
syn match todoDoneContent /^    .\+/ contained

" Active task block: [N] marker, title, and indented content lines
syn region todoActiveBlock start=/^\[\d\+\]/ end=/\n\ze\(\[.\]\|\S\|\s*$\)/me=s-1 contains=todoIndex,todoTitle,todoContent
syn match todoIndex /^\[\d\+\]/ contained
syn match todoTitle /^\[\d\+\]\s\+.\+/ contained contains=todoIndex
syn match todoContent /^    .\+/ contained

hi def link todoIndex Identifier
hi def link todoTitle Statement
hi def link todoContent Normal
hi def link todoDoneMarker Comment
hi def link todoDoneTitle Comment
hi def link todoDoneContent Comment

let b:current_syntax = "todo"
