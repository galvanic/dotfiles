
" color logging statements as comments
syntax match logStatement '\c.*log\w*\.\(info\|debug\|warn\|warning\|error\|exception\|critical\)(.*$'

" highlight function arguments
" some_function_call(simple_value, keyword=value)

" from https://vi.stackexchange.com/questions/6731/vim-syntax-pattern-to-highlight-python-keyword-argument/6963#6963
syntax region FCall matchgroup=FName start='[[:alpha:]_]\i*\s*(' end=')' contains=FCall,FCallKeyword
syntax match FCallKeyword '\i*\s*=\ze[^=]' contained
highlight FCallKeyword ctermfg=blue
"highlight FName ctermfg=blue

"syntax match PythonArg '(\s*\zs\w\+\ze\s*=.*)'
"highlight PythonArg ctermfg=blue
