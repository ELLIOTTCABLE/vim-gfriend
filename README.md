# vim-gfriend
Like vim's built-in `gf` and `gF`; with the simple addition of trying to open in a recent nearby
split.

## Usage
Install using your favorite plugin manager. Using [vim-plug](https://github.com/junegunn/vim-plug), for example:

    Plug 'ELLIOTTCABLE/vim-gfriend'

Map your keybindings of choice to `gfriend#goto_cfile` (go to the `fileame.bleh` under the cursor,
as with the built-in `gf`) and `gfriend#goto_cWORD` (go to the `filename.bleh:LINE` under the
cursor, as with the built-in `gF`.)

My personal configuration, for example:

```vim
nmap <silent> <Leader>gf :<C-u>call gfriend#goto_cfile(winwidth(0) >=# 180 ? 'vsp' : 'sp')<CR>
nmap <silent> <Leader>gF :<C-u>call gfriend#goto_cWORD(winwidth(0) >=# 180 ? 'vsp' : 'sp')<CR>
```

You can also provide a second argument, to configure the 'edit-in-place' behaviour; this
is useful, for example, when using with [Fugitive][] - I use the following mapping to
"goto commit", editing whatever's under the cursor using `:Gedit`:

```vim
nmap <silent> <Leader>gc :<C-u>call
 \ gfriend#goto_cfile(winwidth(0) >=# 180 ? 'Gvsp' : 'Gsp', 'Ged')<CR>
```

   [Fugitive]: <https://github.com/tpope/vim-fugitive> "Tim Pope's powerful Git-wrapper for Vim"
