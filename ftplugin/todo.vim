if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal expandtab
setlocal shiftwidth=4
setlocal softtabstop=4

let b:undo_ftplugin = "setlocal expandtab< shiftwidth< softtabstop<"
