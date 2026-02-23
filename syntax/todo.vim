if exists("b:current_syntax")
    finish
endif

" Planned task block: any marker that isn't [-] or [N]
" Defined first so that done and active blocks take precedence
syn region todoPlannedBlock start=/^\[[^\]]\+\]/ end=/\n\ze\(\[.\]\|\S\|\s*$\)/me=s-1 contains=todoPlannedMarker,todoPlannedTitle,todoPlannedContent
syn match todoPlannedMarker /^\[[^\]]\+\]/ contained
syn match todoPlannedTitle /^\[[^\]]\+\]\s\+.\+/ contained contains=todoPlannedMarker
syn match todoPlannedContent /^    .\+/ contained contains=todoListMarker

" Done task block: [-] marker, title, and indented content lines
syn region todoDoneBlock start=/^\[-\]/ end=/\n\ze\(\[.\]\|\S\|\s*$\)/me=s-1 contains=todoDoneMarker,todoDoneTitle,todoDoneContent
syn match todoDoneMarker /^\[-\]/ contained
syn match todoDoneTitle /^\[-\]\s\+.\+/ contained contains=todoDoneMarker
syn match todoDoneContent /^    .\+/ contained contains=todoListMarker

" Active task block: [N] marker, title, and indented content lines
syn region todoActiveBlock start=/^\[\d\+\]/ end=/\n\ze\(\[.\]\|\S\|\s*$\)/me=s-1 contains=todoIndex,todoTitle,todoContent
syn match todoIndex /^\[\d\+\]/ contained
syn match todoTitle /^\[\d\+\]\s\+.\+/ contained contains=todoIndex
syn match todoContent /^    .\+/ contained contains=todoListMarker

" List markers (* and -) inside content lines
syn match todoListMarker /^    \zs[*-]/ contained

hi def link todoIndex Identifier
hi def link todoTitle Identifier
hi def link todoContent Normal
hi def link todoPlannedMarker Normal
hi def link todoPlannedTitle Normal
hi def link todoPlannedContent Normal
hi def link todoDoneMarker Comment
hi def link todoDoneTitle Comment
hi def link todoDoneContent Comment
hi def todoListMarker ctermfg=Green guifg=Green

let b:current_syntax = "todo"
