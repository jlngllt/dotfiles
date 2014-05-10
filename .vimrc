" vim: set sw=2 sts=2
" CONFIGURATION GÉNÉRAL
" ----------------------------------------------------------------------------
" n est pas compatible avec vi set nocompatible
set nocompatible
" option requise pour vundle
filetype off
" caractère de la variable <leader>
let mapleader = ","

" VUNDLE
" ----------------------------------------------------------------------------
" installation de vundle (vundle est le gestionnaire de plugin)
if has('win32') || has('win64')
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc('$HOME/.vim/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif
Bundle 'gmarik/vundle'
" installation de plugin
Bundle 'godlygeek/csapprox'
Bundle 'majutsushi/tagbar'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rsi'
Bundle 'flazz/vim-colorschemes'

" GVIM
" configuration de gvim
if has("gui_running")
  if has('win32') || has ('win64')
    set guifont=DejaVu_Sans_Mono:h8:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 8
  endif
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

" BASIC
" ----------------------------------------------------------------------------
" détection du type de fichier
filetype plugin on
" activation d une indentation
filetype plugin indent on
" affichage du mode courant dans la barre de status
set showmode
" affiche les commande taper en bas droite dans la barre de status
set showcmd
" affichage de la barre de status
set laststatus=2
" barre de status de 2 lignes de haut
set ch=2
" style de la barre de status
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
" ne coupe pas le texte lorsqu il est trop long
set nowrap
" passe à la ligne suivante lors de déplacement en début ou fin de ligne
" char   key
" b      <BS>
" s      <Space>
" h      h
" l      l
" <      <Left>
" >      <Right>
" ~      ~
" [      <Left>
" ]      <Right>
set whichwrap=b,s
" coupe les lignes avec les valeurs de breakat
set linebreak
set showbreak=>\
set breakat=\ \	;:,!?
" affiche les numéros de lignes
set relativenumber
set number
set numberwidth=4
" ne ferme pas le(s) buffer(s) (permet d ouvrir un autre fichier sans avoir
"   besoin de sauvegarder le buffer en cours si il a déjà été modifié)
" set hidden
" système d encodage de caractère dans vim
set encoding=utf-8
" paramétrage de la langue pour la correction orthographique
set spelllang=fr
" affiche les espaces et tabulation
set list
set listchars=trail:·,tab:>-,eol:¬
" ignore la case lors de recherche
set ignorecase
" si ignorecase et smartcase sont à ON, la case est active si le pattern
" contient une majuscule
set smartcase
" affiche le pattern de recherche lorsqu il est écrit
set incsearch
" ignore certains type de fichier
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.exe,*.a,*.out
" relecture du fichier si il a été changer à l extérieur de vim
set autoread
" sauvegarde de l historique des commandes
set history=1000
" nombre de retour en arrière possible
set undolevels=1000
" surligne toutes les recherches
set hlsearch
" lors d un appuie sur <tab> insertion d une tabulation de la taille de
" shiftwidth et softtabstop
set smarttab
" utilise des espaces en lieu et place de tabulation
set expandtab
" au moins 3 lignes visible autour du curseur
set scrolloff=3
"  suppression de la fenêtre de pré visualisation de complétion (scratch 
" window)
set completeopt-=preview
" activation d une complétion complète dans la ligne de commande
set wildmode=list:longest
set nowildmenu
" affiche lors d une complétion le tag name et la recherche
set showfulltag
" Meilleur affichage lors de la complétion de tag : :tag<tab>
set wildoptions=tagfile
" non création de fichier de backup .~
set nobackup
set nowritebackup
" non création de fichier swap .swp
set noswapfile
" swap répertoire
set directory-=.
" affiche un titre à la fenêtre
set title
" active l utilisation de la souris
set mouse=a
" visual sélection en carré
set virtualedit=block
" parfois vim lag quand on scroll
set lazyredraw
set ttyfast
" pour pouvoir avoir des accents sur windows
if has('win32') || has('win64')
  lang mess en
else
  lang mess C
endif
if has("gui_running")
  " plus d espace entre chaque ligne (améliore la lisibilité)
  set linespace=1
endif
" emplacement des tags
set tags=./tags;
" affiche le menu de complétion meme si il n y a qu une seul possibilité
set completeopt=menuone
" complétion basée uniquement sur le buffer courant
" . The current buffer
" w Buffers in other windows
" b Other loaded buffers
" u Unloaded buffers
" t Tags
" i Included files
set complete=.
"set complete=.,w,b,i,t "par default
" taille du menu de complétion
set pumheight=20
" indique combien de lignes on été modifiées pour les commandes :
set report=0
" lors des commandes suivante  CTRL-D, CTRL-U, CTRL-B, CTRL-F, G, H, M, L, gg,
" on tente de maintenir la position du curseur (au lieu de la mettre en début
" de ligne )
set nostartofline
" lors d un horizontal split (sp) la nouvelle fenêtre se placera en dessous de
" celle courante
set splitbelow
" lors d un vertical split (vp) la nouvelle fenêtre se placera à droite de
" celle courante
set splitright
" taille minimal de la fenêtre courante
set winwidth=30
" hauteur minimal de la fenêtre courante
set winheight=1
" nombre de ligne maximum dans la command line
set cmdwinheight=5
" lors d un split les fenêtre font la même taille si equalalways = on
" sinon lors d un split la taille de la fenêtre courante sera réduite
set noequalalways
" taille des fenêtres de preview et d aide
set previewheight=8
set helpheight=12
" Quand une ligne est trop longue affhcé @
set display=lastline
"set display+=uhex
" Round indent by shiftwidth.
set shiftround
" activé le modeline
set modeline
" utiliser le clipboard register
if has('unnamedplus')
  set clipboard& clipboard+=unnamedplus
else
  set clipboard& clipboard+=unnamed
endif
" Highlight parenthèses
set showmatch
" Highlight avec mouvement du curseur
set cpoptions-=m
set matchtime=3
" Highlight <>.
set matchpairs+=<:>
" ignore la case lors de la complétion
set infercase
" activation du folding
set nofoldenable
set foldmethod=marker
" affiche le niveau de folding
if (&foldenable)
  set foldcolumn=3
else
  set foldcolumn=0
endif
set fillchars=vert:\|
" short message
set shortmess=atToOI
" Timeout
set timeout timeoutlen=3000 ttimeoutlen=100
" programme utiliser lors la commande K
set keywordprg=:help

" COLOR 
" ----------------------------------------------------------------------------
syntax on
set t_Co=256
"" Couleurs LIGHT
" --- GITHUB ---
"colorscheme github
"" Couleurs DARK
" --- TOMOROW-NIGHT ---
colorscheme Tomorrow-Night
" Highlight la colonne 80 et tout ce qu il y a derrière la ligne 120
let &colorcolumn="80,".join(range(120,999),",")

" La coloration syntaxique pour les documents complexe est légèrement lente.
" Ajout de cette configuration pour réduire le chargement)
set synmaxcol=400
syn sync minlines=200
syn sync maxlines=500

" NETRW
" ----------------------------------------------------------------------------
let g:netrw_liststyle = 0
let g:netrw_alto      = 1
let g:netrw_altv      = 1
let g:netrw_banner    = 0

" FILETYPE/AUTOCMD
" ----------------------------------------------------------------------------
au BufRead, BufNewFile {Gemfile, Rakefile, Vagrantfile, Thorfile, config.ru}
      \ set ft=ruby
au BufRead, BufNewFile {*.md} set ft=markdown
autocmd BufNewFile,BufRead *.txt set filetype=txt
autocmd FileType text setlocal textwidth=78 wrapmargin=2 tabstop=8 shiftwidth=8
autocmd FileType markdown setlocal wrap expandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType scss setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eco setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType bash setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType qf nnoremap <buffer> p <CR>:call <SID>preview()<CR>
autocmd BufReadPost quickfix set modifiable

"augroup cursoline
"  autocmd!
"  " enlève le sur lignage de la ligne et colonne dans la fenêtre tagbar
"  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"  autocmd WinLeave * setlocal nocursorline
"augroup END
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
" enlève le commentaire automatique après qu une ligne commenté soit écrite
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" PLUGINS
" ----------------------------------------------------------------------------
" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

" TagBar
nmap <leader>t :Tagbar<cr>

" MAPPING
" ----------------------------------------------------------------------------
" annulation du sur lignage après une recherche
nmap <space> :set hls!<Bar>:set hls?<CR>
" activation de diffèrent type d indentation
nmap <F4> :set expandtab   tabstop=4 shiftwidth=4  softtabstop=4<CR>
nmap <F2> :set expandtab   tabstop=2 shiftwidth=2  softtabstop=2<CR>
nmap <F3> :set expandtab   tabstop=3 shiftwidth=3  softtabstop=3<CR>
" activation de la correction orthographique
nmap <F6> :set spell!<bar>set spell?<CR>
" ctags
nmap <F5> :!ctags -R --extra=+q --filed=+iaS --c-kinds=+px
" raccourcis pour faciliter la substitution de texte
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>
if has('clipboard')
  xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
endif
" surlignage avec effet blink
"nnoremap <silent> n   n:call HLNext(0.2)<cr>
"nnoremap <silent> N   N:call HLNext(0.2)<cr>
" surlignage avec effet mot centré
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" cherche l élément sous le curseur mais ne saute pas à la première occurrence
" trouvée
nnoremap <silent>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>
nnoremap <silent># :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>
" force l écriture en tant que root
cmap w!! %!sudo tee > /dev/null %
" recherche avec des regex normal
nnoremap / /\v
vnoremap / /\v
nnoremap ? /\v
vnoremap ? /\v

" AG/GREP/SEARCH
" ----------------------------------------------------------------------------
nmap  s   [Search]
xmap  s   [Search]
nnoremap [Search]   <Nop>
xnoremap [Search]   <Nop>

nnoremap [Search]b :<C-u>CtrlPBuffer<CR>
nnoremap [Search]d :<C-u>CtrlPDir<CR>
nnoremap [Search]f :<C-u>CtrlP<CR>
nnoremap [Search]l :<C-u>CtrlPLine<CR>
nnoremap [Search]m :<C-u>CtrlPMRUFiles<CR>
nnoremap [Search]q :<C-u>CtrlPQuickfix<CR>
nnoremap [Search]s :<C-u>CtrlPMixed<CR>
nnoremap [Search]t :<C-u>CtrlPTag<CR>
nnoremap [Search]g :<C-u>vimgrep //gj **/*.<left><left><left>
\<left><left><left><left><left><left>

let g:ctrlp_map = '<Nop>'
let g:ctrlp_working_path_mode = 'a'
" Ouvre nouveau fichier dans la fenêtre courante
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'

if executable('ag')
  "set grepprg=ag\ --nogroup\ -iS
  "set grepformat=%f:%l:%m
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
elseif executable('ack')
  "set grepprg=ack\ --nogroup
  "set grepformat=%f:%l:%m
  let g:ctrlp_user_command = 'ack %s --nocolor -g ""'
else
  "set grepprg=grep\ -Hnd\ skip\ -r
  "set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
endif
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

set grepprg=grep\ -Hnd\ skip\ -r
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
" quickfix toujours en bas de la fenêtre
autocmd FileType qf wincmd J
" fenêtre quickfix pour cwindow
autocmd QuickFixCmdPost *grep* cwindow


"FONCTIONS
" ----------------------------------------------------------------------------
" HLNext
" permet de faire clignoter un pattern
function! HLNext (blinktime)
  highlight whiteonred ctermfg=white ctermbg=red guifg=#fff8dc guibg=#a52a2a
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#'.@/
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Preview
" permet de faire un surlignage d un pattern dans une preview
function! s:preview()
  normal! zv
  normal! zz
  normal! V
  redraw
  sleep 400m
  wincmd p
endfunction

"GrepQuixFix
" Permet de filter les resultats dans le quickfix
function! GrepQuickFix(pat)
  let all = getqflist()
  for d in all
    if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
        call remove(all, index(all,d))
    endif
  endfor
  call setqflist(all)
endfunction
command! -nargs=* SVNdiff call GrepQuickFix(<q-args>)

"JGU_svn_diff
" Permet de faire un diff svn a partir du path
" TODO BUG à Corriger : 
"   1. Dans un netrw à l ouverture il ouvre une fenetre vide sans nom
"      meme si il n y a qu une seul ligne
"   2. Trouver le moyen de ne pas avoir a sauvegarder le fichier et de
"      ne pas avoir a faire de q! pour quitter le buffer
"   3. Si le buffer est déjà ouvert il faut tout effacer et recoller
"      ensuite
function! JGU_svn_diff(path)
  let path = a:path
  vertical new __SVN_DIFF__
  setlocal syn=diff ft=diff
  execute ":read ! svn diff " . a:path
  go
  "nombre de ligne dans la fenetre
  let nmatches = line("w$")
  if nmatches == 1
    bdelete!
  endif
endfunction
command! -nargs=1 -complete=dir SVNdiff call JGU_svn_diff(<f-args>)

"LS
" Permet de faire un LS puis de changer les buffers
function! LS_buffer()
  ls
endfunction
command! -nargs=0 LS call LS_buffer()
