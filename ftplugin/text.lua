vim.cmd([[
  setl shiftwidth=8 tabstop=8
  syn match specWord     "\c\<dom\>\|\<så\>\|, och\|^\<men\>\|^\<och\>"
  syn match txtNumber    "\d\(\.\d\+\)\?"
  syn match txtOperator  "[~\-_+*=|#@$%&\\/:&\^\.,!?]"
  syn match txtLink      "\(http\|https\|ftp\)\(\w\|[\-&=,?\:\.\/]\)*"
  syn match txtLink      "\v([a-z0-9_\.\+-]+)\@([\da-z\.-]+)\.([a-z\.]{2,6})"
  syn cluster txtContains add=txtNumber,txtOperator,txtLink,specWord
  syn region txtCite      start="\"" end="\"" oneline contains=@txtContains
  syn region txtComments  start="^#" end="$"  oneline contains=@txtAlwaysContains
  syn region txtDelims    start="("  end=")"  oneline contains=@txtContains,txtCite
  syn region txtDelims    start="<"  end=">"  oneline contains=@txtContains,txtCite
  syn region txtDelims    start="{"  end="}"  oneline contains=@txtContains,txtCite
  syn region txtDelims    start="\[" end="\]" oneline contains=@txtContains,txtCite
  syn case ignore
  syn keyword noWord      är och eller om till i av det den med från som en ett de dem att in
  syn case match
  hi link txtNumber   Number
  hi link txtOperator Operator
  hi link txtCite     String
  hi link txtComments NonText
  hi link txtDelims   Delimiter
  hi link txtLink     Special
  hi link noWord      Function
  hi link specWord    Todo
  ]]) --TODO --TODO
