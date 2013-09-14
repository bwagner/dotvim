call pathogen#incubate()
call pathogen#helptags()
execute pathogen#infect()
if has("autocmd")
	filetype plugin indent on
endif

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set background=dark
set nocursorline

set ic
set smartcase

:autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | sil! lcd %:p:h | endif
autocmd BufNewFile,BufRead *.json set ft=javascript
map ,jt :%!json_xs -f json -t json-pretty

" Uncomment the following to have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif 

set langmenu=none

if has("mac")
	:language message en_US
else
	:language message en_US.UTF8
endif

:filetype plugin on

:let $VIM = "/Users/bwagner/vim/"
if has("dos16") || has("dos32") || has("win16") || has("win32")
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim

	source $VIMRUNTIME/../a.vim
	source $VIMRUNTIME/../aExtNexus.vim
	source $VIMRUNTIME/../FeralToggleCommentify.vim
else
"	source $VIM/a.vim
"	source $VIM/aExtNexus.vim
"	source $VIM/FeralToggleCommentify.vim
endif

if has("gui_running")
  colorscheme desert
endif



set scrolloff=2
set incsearch
set notextmode
set nota
"set autoindent
set hidden
"set expandtab (et)
set viminfo='1000,f1,n~/vim/viminfo

:version 4.0
 set nocompatible
 syntax on
" set digraph
 set noerrorbells
 set laststatus=1
 set report=0
 set ruler
 set showcmd
" set notitle
 set sw=2
 set ts=2
 ab vd Vielen DankMit freundlichen GrüssenB. Wagner
 ab mfg Mit freundlichen GrüssenB. Wagner
map <F12> :set ar0i#!/usr/bin/env perlAuse strict;use warnings;use File::Basename;my $gProgName=basename $0;my $gPID=$$;print STDERR "$gProgName:$gPID\n"; :w:!chmod +x %L:set ar<
"map <F12> 1Gi#!/Users/bwagner/perl5/perlbrew/perls/local/bin/perluse strict;use warnings;use File::Basename;my $gProgName=basename $0;my $gPID=$$;print STDERR "$gProgName:$gPID\n"; :w:!chmod +x %:set ar
map <F11> 1GDi#!/Users/bwagner/perl5/perlbrew/perls/local/bin/perl:w
"map  :e #
map [11~ :%s/	/  /g:wq
map <F2> :TC<CR>j 
map c :TC<CR>j 
imap c :TC<CR>j 
map  :cnext
map  :cprevious
"map  f{iconst :w
"map  f)a const :w
"map  :wq
map  :q
map  f(%f;i const :w
map <F6> :e#

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff
augroup encrypted
  au!

  " First make sure nothing is written to ~/.viminfo while editing
  " an encrypted file.
  autocmd BufReadPre,FileReadPre *.gpg set viminfo=
  " We don't want a various options which write unencrypted data to disk
  autocmd BufReadPre,FileReadPre *.gpg set noswapfile noundofile nobackup

  " Switch to binary mode to read the encrypted file
  autocmd BufReadPre,FileReadPre *.gpg set bin
  autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null

  " Switch to normal mode for editing
  autocmd BufReadPost,FileReadPost *.gpg set nobin
  autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
  autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")

  " Convert all text to encrypted text before writing
  " (If you use tcsh, you may need to alter this line.)
  autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
  " Undo the encryption so we are back in the normal text, directly
  " after the file has been written.
  autocmd BufWritePost,FileWritePost *.gpg u
augroup END

