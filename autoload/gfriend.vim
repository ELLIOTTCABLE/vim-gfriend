function! gfriend#goto_cfile(winmotion)
  let cfile = expand("<cfile>")

  let starting_window = nvim_win_get_number(0)

  " If there's no previous window, create a new one
  wincmd p
  if nvim_win_get_number(0) ==# starting_window
    wincmd p
    execute(a:winmotion." ".cfile)
  else
    execute("e ".cfile)
  endif
endfunction


function! gfriend#goto_cWORD(winmotion)
  let cword = expand("<cWORD>")
  let span = matchend(cword, '\v[^:]+:\d+')

  if span !=# -1
    let cword = cword[:span - 1]
  endif

  let bits = split(cword, ':')

  let starting_window = nvim_win_get_number(0)

  " If there's no previous window, create a new one
  wincmd p
  if nvim_win_get_number(0) ==# starting_window
    wincmd p
    execute(a:winmotion." ".bits[0])
  else
    execute("e ".bits[0])
  endif

  if bits[1]
    execute(bits[1])
  endif
endfunction