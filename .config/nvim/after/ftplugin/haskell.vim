function! QuickFixHaskell()
  let l:cabalFilePresent = filereadable(glob('*.cabal'))
  if l:cabalFilePresent
    setl makeprg=cabal\ build
  else
    let l:currentFile = expand('%')
    if !exists('b:qfOutputdir')
      let b:qfOutputdir = tempname()
      call mkdir(b:qfOutputdir)
    endif
    let &l:makeprg = 'ghc --make % -outputdir ' . b:qfOutputdir
  endif
  setl errorformat=
                   \%-Z\ %#,
                   \%W%f:%l:%c:\ Warning:\ %m,
                   \%E%f:%l:%c:\ %m,
                   \%E%>%f:%l:%c:,
                   \%+C\ \ %#%m,
                   \%W%>%f:%l:%c:,
                   \%+C\ \ %#%tarning:\ %m,
endfunction
call QuickFixHaskell()
