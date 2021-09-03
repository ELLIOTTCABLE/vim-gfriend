function! gfriend#goto_cfile(theremotion, heremotion = "e")
  let cfile = expand("<cfile>")

  let starting_window = nvim_win_get_number(0)

  " If there's no previous window, create a new one
  wincmd p
  if nvim_win_get_number(0) ==# starting_window
    execute(a:theremotion." ".cfile)
  else
    execute(a:heremotion." ".cfile)
  endif
endfunction


function! gfriend#goto_cWORD(theremotion, heremotion = "e")
  let cword = expand("<cWORD>")
  let st = match(cword, '\v\f+:\d+')
  let end = matchend(cword, '\v\f+:\d+')

  if end !=# -1
    let cword = cword[st:end - 1]
  endif

  let bits = split(cword, ':')

  let starting_window = nvim_win_get_number(0)

  " If there's no previous window, create a new one
  wincmd p
  if nvim_win_get_number(0) ==# starting_window
    execute(a:theremotion." ".bits[0])
  else
    execute(a:heremotion." ".bits[0])
  endif

  if len(bits) >=# 1
    execute(bits[1])
  endif
endfunction
