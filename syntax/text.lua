vim.cmd([[
    setl shiftwidth=8 tabstop=8
    ino jk <esc>
    syn case ignore
    syn keyword noWord      är eller om till i av det den från som en ett de dem att in var inte
    "TODO: och,men
    syn case match
    syn match txtNumber    "\d\(\.\d\+\)\?"
    syn match txtOperator  "[~\-_+*=|#@$%&\\/:&\^\.,!?]"
    syn match txtLink      "\(http\|https\|ftp\)\(\w\|[\-&=,?\:\.\/]\)*"
    syn match txtLink      "\v([a-z0-9_\.\+-]+)\@([\da-z\.-]+)\.([a-z\.]{2,6})"
    syn match specWord     "\v\c<dom>|<så>|, och|^<men>|^<och>"
    syn cluster txtContains add=txtNumber,txtOperator,txtLink,specWord
    syn region txtCite      start="\"" end="\"" oneline contains=@txtContains
    syn region txtComments  start="^#" end="$"  oneline contains=@txtAlwaysContains
    syn region txtDelims    start="("  end=")"  oneline contains=@txtContains,txtCite
    syn region txtDelims    start="<"  end=">"  oneline contains=@txtContains,txtCite
    syn region txtDelims    start="{"  end="}"  oneline contains=@txtContains,txtCite
    syn region txtDelims    start="\[" end="\]" oneline contains=@txtContains,txtCite
    hi link txtNumber   Number
    hi link txtOperator Operator
    hi link txtCite     String
    hi link txtComments NonText
    hi link txtDelims   Delimiter
    hi link txtLink     Special
    hi link noWord      Function
    hi link specWord    Todo
    "-TODO --TODO --TODO
]])
