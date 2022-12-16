setl shiftwidth=8 tabstop=8
syn case ignore
syn keyword noWord      är eller om till i av det den från som en ett de dem att in var inte alla på ha
syn keyword noWord      the is of to
syn match noWord       "\v\c<och>|<men>"
syn case match
syn match txtNumber    "\d\(\.\d\+\)\?"
syn match txtOperator  "[~\-_+*=|#@$%&\\/:&\^\.,!?]"
syn match txtLink      "\(http\|https\|ftp\)\(\w\|[\-&=,?\:\.\/]\)*"
syn match txtEmail      "\v([a-z0-9_\.\+-]+)\@([\da-z\.-]+)\.([a-z\.]{2,6})"
syn match specWord     "\v\c<dom>|<så>|, och|^<men>|^<och>"
syn match specWord     "\v\cdid not|could not"
syn cluster txtContains add=txtNumber,txtOperator,txtLink,specWord,txtEmail
syn region txtCite      start="\"" end="\"" oneline contains=@txtContains
syn region txtComments  start="^\s*#" end="$"  oneline contains=@txtContains,txtCite
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
hi link txtEmail    Special
hi link noWord      Function
hi link specWord    Todo
