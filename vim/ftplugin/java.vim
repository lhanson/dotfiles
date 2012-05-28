" Java specific settings

imap sout<TAB> System.out.println("");<LEFT><LEFT><LEFT>

" Set completion for the javacomplete plugin
setlocal omnifunc=javacomplete#Complete

" Runs the tests for the current Java file, assuming the name is the same
" but with 'Test' on the end, and the same src/ and test/ directory structures
function! RunTest()
  """ TODO: would be nice to get this to actually work
  let expand = expand("%:p")
  let cla = matchstr(expand("%:p"), '^.*[/\\]src[/\\]\(test\|java\)[/\\]\zs.*')
  let $CLASSPATH = "/Users/ldhanson2/.m2/repository/junit/junit/4.8.1/junit-4.8.1.jar"
  "still need to replace /s with .s
  let class = "java org.junit.runner.JUnitCore " .  strpart(substitute(cla, "/", "\.", "g"), 0, strlen(cla) -5)
  echo "Class is " . class.", cla is " . cla.", expand is " . expand

  if match(class, "Test") == -1
    let class = class . "Test"
  endif

  echo class
  echo system(class)
endfunction
map <F6> <Esc>:echo RunTest()<CR>
