" CONFIGURATION GÉNÉRAL
" ----------------------------------------------------------------------------
" n'est pas compatible avec vi set nocompatible
if !has('nvim')
  set nocompatible
endif
" option requise pour vundle
filetype off
" caractère de la variable <leader>
let mapleader = ","

" VUNDLE
" ----------------------------------------------------------------------------
" installation de vundle (vundle est le gestionnaire de plugin)
let win_path='$HOME/VIM/\.vim'
let unix_path='$HOME/.vim'
let win_shell = (has('win32') || has('win64')) && &shellcmdflag =~ '/'
let vimDir = win_shell ? win_path : unix_path
if has('nvim')
  "En general $XDG_CONFIG_HOME=$HOME/.config
  "si XDG_CONFIG_HOME est vide alors faire la commande suivante :
  "export XDG_CONFIG_HOME="$HOME/.config"
  let vimdir='$XDG_CONFIG_HOME/.nvim'
endif

let &runtimepath .= ',' . expand(vimDir . '/bundle/Vundle.vim')
call vundle#begin(expand(vimDir . '/bundle'))
Plugin 'VundleVim/Vundle.vim'
" installation de plugin
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'vim-scripts/highlight.vim'
if v:version > 702
  Plugin 'Shougo/unite.vim'
  Plugin 'Shougo/vimfiler.vim'
endif
" color
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'nanotech/jellybeans.vim'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'cocopon/iceberg.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'sjl/badwolf'
Plugin 'jpo/vim-railscasts-theme'
call vundle#end()

" GVIM
" configuration de gvim
if has('gui_running')
  if has('win32') || has ('win64')
    set guifont=DejaVu_Sans_Mono:h10:cANSI,Consolas:h10:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar

  set guicursor+=a:blinkon0 "disable all blinking
  set guicursor+=a:block "only block cursor

  set lines=60 "nombre de ligne au démarage de gvim
  set columns=120 "nombre de colone au démarage de gvim
  winpos 430 20 "position de la fenêtre au démarage de gvim
endif

" BASIC
" ----------------------------------------------------------------------------
" Detection de l'OS
if has("unix")
  let g:uname = substitute(system("uname -s"), "\n", "", "")
endif
" détection du type de fichier
filetype plugin on
" activation d'une indentation
filetype plugin indent on
" affichage du mode courant dans la barre de status
set showmode
" affiche les commande taper en bas droite dans la barre de status
set showcmd
" desactive le beep
set noeb vb t_vb=
" affichage de la barre de status
set laststatus=2
" barre de status de 2 lignes de haut
set ch=2
" style de la barre de status
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]
"coupe le texte lorsqu'il est trop long
set wrap
" passe à la ligne suivante lors de déplacement en debut ou fin de ligne
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
" affichage d'une ligne
set cursorline
" affiche les numéros de lignes
" relativenumber ralentit vim
if has('relativenumber')
  set norelativenumber
endif
set nonumber
set numberwidth=4
" ne ferme pas le(s) buffer(s) (permet d'ouvrir un autre fichier sans avoir
"   besoin de sauvegarder le buffer en cours si il a déjà été modifié)
" set hidden
" système d'encodage de caractère dans vim, si les caractères affiché sont
" étrange, il est fort probable que le terminal ou gui ne soit pas configuré
" pour de l'utf8
set encoding=utf-8
" pour convertir un fichier dans un encodage connu different d'utf8 vers utf8
" faire la commande suivante :
":e!++enc=utf8
" paramétrage de la langue pour la correction orthographique
set spelllang=fr
" ajout de path des includes pour pouvoir naviguer facilement avec les noms de
" fichier avec des commandes tel que gf
set path+=**
if uname == "Darwin"
  " chemin vers les includes de mac quand Xcode est installé
  set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift-migrator/sdks/MacOSX.sdk/usr/include/
endif
" affiche les espaces, tabulation, fin de ligne et caractère inconnu (qui
" peuvent générer des erreurs lors des compilations/exécution)
set list
set listchars=trail:·,tab:>-,eol:¬,nbsp:×,precedes:<,extends:>
" ignore la case lors de recherche
set ignorecase
" si ignorecase et smartcase sont à ON, la case est active si le pattern
" contient une majuscule
set smartcase
" affiche le pattern de recherche lorsqu'il est écrit
set incsearch
" ignore certains type de fichier
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.exe,*.a,*.out,*.svn
" relecture du fichier si il a été changer à l'extérieur de vim
set autoread
" sauvegarde de l'historique des commandes
set history=1000
" nombre de retour en arrière possible
set undolevels=1000
" surligne toutes les recherches
set hlsearch
" lors d'un appuie sur <tab> insertion d'une tabulation de la taille de
" shiftwidth et softtabstop
set smarttab
" au moins 3 lignes visible autour du curseur
set scrolloff=3
"  suppression de la fenêtre de pré visualisation de complétion (scratch
" window)
set completeopt-=preview
" activation d'une complétion complète dans la ligne de commande
set wildmode=list:longest
set nowildmenu
" affiche lors d'une complétion le tag name et la recherche
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
set titleold=""
set titlestring=VIM:\ %F
" active l'utilisation de la souris
set mouse=a
" visual sélection en carré
set virtualedit=block
" parfois vim lag quand on scroll
if has('gui_running')
  set lazyredraw
elseif !has('win32unix')
  set lazyredraw
endif
if !has('nvim')
  set ttyfast
endif
" pour pouvoir avoir des accents sur windows
if has('win32') || has('win64')
  lang mess en
else
  lang mess C
endif
if has('gui_running')
  " plus d'espace entre chaque ligne (améliore la lisibilité)
  set linespace=1
endif
" emplacement des tags
set tags=tags.prj
set tags+=~/.tags.clib
" affiche le menu de complétion meme si il n'y a qu'une seul possibilité
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
" lors d'un horizontal split (sp) la nouvelle fenêtre se placera en dessous de
" celle courante
set splitbelow
" lors d'un vertical split (vp) la nouvelle fenêtre se placera à droite de
" celle courante
set splitright
" taille minimal de la fenêtre courante
set winwidth=30
" hauteur minimal de la fenêtre courante
set winheight=1
" nombre de ligne maximum dans la command line
set cmdwinheight=5
" lors d'un split les fenêtre font la même taille si equalalways = on
" sinon lors d'un split la taille de la fenêtre courante sera réduite
set noequalalways
" taille des fenêtres de preview et d'aide
set previewheight=8
set helpheight=12
" Quand une ligne est trop longue affhcé @
set display=lastline
"set display+=uhex
" Round indent by shiftwidth.
set shiftround
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
" desactivation du folding
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
" aligne les arguments d'une fonction lorsque l'on saute une ligne
"set cinoptions={0,>1s,e0,^0,n0,:1s,p2s,i1s,(0,u0,W2s
"set cinoptions={0,>1s,e0,^0,n0,:1s,p2s,i1s,(0,u0,W2s,Ls,l1,b1
set cinoptions={0,}0,>1s,e0,^0,n0,:1s,p2s,i1s,(0,u0,W2s,Ls,l1,b1,t0,=0
" backspace disponible en mode insertion
set backspace=indent,eol,start
" pas de vrai tabulation (\t) par default (<F7> pour activer)
set expandtab
" permet d'utiliser les alias configurer dans le shell
"set shell=/bin/bash\ -i
" clipboard + yand avec avec le register * ne fonctionne pas sans
if $TMUX == ''
  set clipboard+=unnamed
endif
" paramétrage de tabulation/indentation par default
set tabstop=4 shiftwidth=4 softtabstop=4

" COLOR
" ----------------------------------------------------------------------------
" activation de la coloration syntaxique
syntax on
" activation des 256 couleurs (d'un bon terminal) pour la coloration
" syntaxique
if !has('nvim')
  set t_Co=256
endif
if !has('gui_running')
  if has('win32')
    set term=xterm
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
  endif
endif

"" ---------------------
"" Système de notation des couleurs pour savoir si elles sont utilisables dans
"" tout les cas. (diff - spell - search - colorcolumn)
"" TEMPLATE :
"" NOM_DE_LA_COULEUR DIFF SPELL SEARCH COLORCOLUMN (X -> NOK - O -> OK)
"" EXEMPLE : (couleur github diff => NOK Spell => NOK Search => OK CC => OK)
"" GITHUB XXOO
"" ---------------------

"" Couleurs LIGHT/DARK
"" ===================
""---------------------
"" Lucius OOOO
""light
"let g:lucius_style='light'
"let g:lucius_use_bold=0
"let g:lucius_contrast_bg='high'
"let g:lucius_contrast='normal'
"colorscheme lucius
"" OU
""dark
"let g:lucius_style='dark'
"let g:lucius_use_bold=0
"let g:lucius_contrast_bg='high'
"let g:lucius_contrast='normal'
"colorscheme lucius

""---------------------
"" Seoul256 OOOO
""light
"let g:seoul256_background=255
"colorscheme seoul256
"" OU
""dark
"let g:seoul256_background=230
"colorscheme seoul256

""---------------------
"" gruvbox OOOO
"" besoin de lancer le script ~./vim/bundle/gruvbox/gruvbox_256palette.sh
"" pour ne pas avoir de problème de mauvais affichage des couleurs
"" A AJOUTER DANS LE .BASHRC POUR AVOIR LES COULEURS DÉFINIT DIRECTEMENT AU
"" LANCEMENT DU SHELL :
""     GRUVBOX_SHELL="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
""     [[ -s $GRUVBOX_SHELL ]] && source $GRUVBOX_SHELL
"
""set background=light
"" OU
"set background=dark
"" Si le characteres en italic sont supportés
"if !has('gui_running')
" \ && &term != 'rxvt-unicode-256color'
" \ && &term != 'screen-256color-italic'
"  let g:gruvbox_italic=0
"endif
"" Suppression des characteres en gras pour une meilleur lisibilité
"let g:gruvbox_bold=0
"colorscheme gruvbox
"---------------------

"" Couleurs DARK
"" =============
""---------------------
"" TOMOROW-NIGHT 00OO
"set background=dark
"colorscheme Tomorrow-Night
"" OU
""colorscheme Tomorrow-Night-Eighties

""---------------------
"" Hybrid OOOO
"set background=dark
"colorscheme hybrid

""---------------------
"" molokai OOOO
"let g:molokai_original=1
"if !has('gui_running')
"  let g:rehash256=1
"endif
"colorscheme molokai

""---------------------
"" jellybeans OOOO
"colorscheme jellybeans

""---------------------
" neodark OOOO
set background=dark
colorscheme neodark

"---------------------
" quantum OOOO
"set background=dark
"colorscheme quantum

"---------------------
" onedark OOOO
" set background=dark
" let g:onedark_termcolors=256
" colorscheme onedark

"---------------------
" railscasts OOOO
" set background=dark
" colorscheme railscasts

""---------------------
"" jellybeans OOOO
""colorscheme iceberg
""---------------------

" La coloration syntaxique pour les documents complexe est légèrement lente.
" Ajout de cette configuration pour réduire le chargement)
set synmaxcol=400
syn sync minlines=70
syn sync maxlines=200

" Si on peut on highlight on fait une bande a 80 lignes et on fait une grosse
" bande large à 120
if exists('+colorcolumn')
  nnoremap <F10>  :call ToggleHighlight_c2(80,120)<cr>
  nnoremap <F9>   :call ToggleHighlight_c1(80,120)<cr>
endif

" NETRW
" ----------------------------------------------------------------------------
let g:netrw_liststyle   = 0
let g:netrw_alto        = 1
let g:netrw_altv        = 1
let g:netrw_banner      = 0
let g:netrw_fast_browse = 2
if has('win32') || has('win64')
  let g:netrw_localrmdir="rd /s /q"
else
  let g:netrw_localrmdir="rm -r"
endif


" FILETYPE/AUTOCMD
" ----------------------------------------------------------------------------
autocmd BufNewFile,BufRead Gemfile, [rR]akefile, Vagrantfile, Thorfile, config.ru
      \ setf ruby
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead *.txt set filetype=txt
autocmd FileType txt setlocal wrapmargin=2 tabstop=2 shiftwidth=2 textwidth=78
autocmd FileType markdown setlocal wrapmargin=2 tabstop=2 shiftwidth=2 textwidth=78
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType lua setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=
autocmd FileType handlebars setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2
autocmd FileType eco setlocal shiftwidth=2 tabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType c setlocal ts=4 sts=4 sw=4
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal ts=4 sts=4 sw=4
autocmd FileType cpp set omnifunc=ccomplete#Complete
autocmd FileType vim setlocal shiftwidth=2 tabstop=2
autocmd FileType bash,sh setlocal shiftwidth=2 tabstop=2

autocmd FileType qf nnoremap <buffer> p <CR>:call <SID>preview()<CR>
if exists('+colorcolumn')
  autocmd BufReadPost quickfix setlocal colorcolumn=0
  autocmd Filetype netrw setlocal colorcolumn=0
endif
autocmd BufReadPost quickfix set modifiable

" enlève le sur lignage de la ligne et colonne dans la fenêtre tagbar
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
" enlève le commentaire automatique après qu'une ligne commenté soit écrite
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" pas de flash
autocmd GUIEnter * set visualbell t_vb=

" PLUGINS
" ----------------------------------------------------------------------------
" TagBar
nmap <leader>t :Tagbar<cr>

" MAPPING
" ----------------------------------------------------------------------------
" annulation du sur lignage après une recherche
nmap <space> :set hls!<Bar>:set hls?<CR>
" compilation du projet
nmap <F5> :Make FSP_SPU_LOG_pikeos; cp -vf MODS/FSP_SPU_LOG/bin/FSP_SPU_LOG.hbi /tftpboot/posix.hbi
nmap <F6> :Make clean_mdc_FSP_SPU_LOG_pikeos mdc_FSP_SPU_LOG_pikeos FSP_SPU_LOG_pikeos; cp -vf MODS/FSP_SPU_LOG/bin/FSP_SPU_LOG.hbi /tftpboot/posix.hbi
" activation de diffèrent type d'indentation
nmap <F4> :set tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <F2> :set tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <F3> :set tabstop=3 shiftwidth=3 softtabstop=3<CR>
" réduction du timeout
set timeoutlen=650
" activation de la correction orthographique
nmap <F8> :set spell!<bar>set spell?<CR>
" raccourcis pour faciliter la substitution de texte
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>
" ajoute au clipboard commun chaque chose copier avec y
if has('clipboard')
  xnoremap <silent> y "*y:let [@+,@"]=[@*,@*]<CR>
endif
" surlignage avec effet : mot centré
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" cherche l'élément sous le curseur mais ne saute pas à la première occurrence
" trouvée
nnoremap <silent>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>
      \:set hls hls?<cr>
nnoremap <silent># :let @/='<C-R>=expand("<cword>")<CR>'<CR>
      \ :set hls hls?<cr>
" force l'écriture en tant que root
ab w!! %!sudo tee > /dev/null %
" recherche avec des regex normal
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" toggle sur l'affichage des numeros de ligne
nnoremap <f1> :set number! number?<cr>
" insertion de caractère tabulation
inoremap <s-tab> <c-v><tab>
" activation ou non des tabulation
nmap <f7> :set noet!<Bar>:set noet?<CR>

" supprime le raccourcis sort (s) dans netrw pour pouvoir utiliser ctrl-p à la
" place
augroup netrw_fixmaps
  if !has('win32unix')
    autocmd!
    autocmd filetype netrw :call Fix_netrw_fixmaps()
  endif
augroup END

if !has('win32') || !has('win64')
  augroup dirdiff_maps
  autocmd!
  autocmd filetype dirdiff :call Dirdiff_map()
  augroup END
endif

" abreviation tabc -> tc pour M. P364Y13
cnoreabbrev tc tabc

" maximize window
nmap <F11> <Nop>
nnoremap <F11> <Nop>
xnoremap <F11> <Nop>
inoremap <F11> <Nop>
nmap <S-F11> <Nop>
nnoremap <S-F11> <Nop>
xnoremap <S-F11> <Nop>
inoremap <S-F11> <Nop>
nmap <C-F11> <Nop>
nnoremap <C-F11> <Nop>
xnoremap <C-F11> <Nop>
inoremap <C-F11> <Nop>

if has('gui_running')
  nnoremap <F11> :call ToggleWindowSize(0)<CR>
  nnoremap <S-F11> :call ToggleWindowSize(1)<CR>
  nnoremap <C-F11> :call ToggleWindowSize(2)<CR>
  imap <F11> <C-O><F11>
  imap <S-F11> <C-O><S-F11>
  imap <C-F11> <C-O><C-F11>
endif

nnoremap Q <Nop>

if has('nvim')
  tnoremap <Esc> <c-\><c-n>
endif

" VERSION CONTROL
" ----------------------------------------------------------------------------
let g:VCSCommandMapPrefix = "!"
"" ne pas decommenter cette partie
"" liste des raccourcis pour vcscommand
""!a VCSAdd
""!n VCSAnnotate
""!N VCSAnnotate!
""!c VCSCommit
""!D VCSDelete
""!d VCSDiff
""!g VCSGotoOriginal
""!G VCSGotoOriginal!
""!i VCSInfo
""!l VCSLog
""!L VCSLock
""!r VCSReview
""!s VCSStatus
""!u VCSUpdate
""!U VCSUnlock
""!v VCSVimDiff
if !has('win32') || !has('win64')
  nnoremap <silent> !V :call VCSDiffFileVimDiff()<cr>
  nnoremap <silent> !S :call VCSStatusWorkspace()<cr>
endif
""
"" pour les buffer CVS
""
""!e CVSEdit
""!E CVSEditors
""!t CVSUnedit
""!wv CVSWatchers
""!wa CVSWatchAdd
""!wn CVSWatchOn
""!wf CVSWatchOff
""!wf CVSWatchRemove

" AG/GREP/SEARCH
" ----------------------------------------------------------------------------
nmap  s  [Search]
xmap  s  [Search]
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
" grep
nnoremap [Search]g :<C-u>silent vimgrep //gj **/*.<left><left><left>
\<left><left><left><left><left><left>
nnoremap [Search]j :<C-u>silent grep!  \| copen \| redraw!
      \<left><left><left><left><left><left><left><left><left><left><left><left>
      \<left><left><left><left><left><left>
" grep c/cpp file
nnoremap [Search]c :<C-u>silent vimgrep //gj **/*.[ch] **/*.[ch]pp **/*.[ch]xx **/*.cc
      \<left><left><left><left><left><left><left><left><left><left><left><left>
      \<left><left><left><left><left><left><left><left><left><left><left><left>
      \<left><left><left><left><left><left><left><left><left><left><left><left>
      \<left><left><left><left><left><left><left><left><left>
" search trailing space
nnoremap [Search]<space> /\s\+$/<cr>

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
" ignore dossier et fichier dans ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|tar|pdf|xls|zip)$',
  \ }

" suis les lien symbolique
let g:ctrlp_follow_symlinks=1
" ne pas utiliser ctrl_map pour changer le mapping de ctrl-p
let g:ctrlp_map = '<Nop>'
" option du local workspace directory dans ctrl-p
let g:ctrlp_working_path_mode = 'a'
" Ouvre un nouveau fichier dans la fenêtre courante
let g:ctrlp_open_new_file = 'r'
" extentions utilisées dans ctrl-p
let g:ctrlp_extensions = ['tag', 'quickfix', 'dir', 'line', 'mixed']
" option d'affichage des resultats dans crtl-p
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:18'

" type de recherche réalisé avec ctrl-p en fonction des diffèrent système de
" recherche installé sur le système courant (pour crtl-p)
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
elseif executable('ack')
  let g:ctrlp_user_command = 'ack %s --nocolor -g ""'
endif

" option de recherche quand grep est utilisé dans vim
if executable('ag')
  set grepprg=ag\ --ignore\ tags.prj\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c:%m
else
  set grepprg=grep\ --exclude=tags.prj\ -Hnd\ skip\ -r
  set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
endif

" quickfix toujours en bas de la fenêtre
autocmd FileType qf wincmd J
" fenêtre quickfix pour cwindow
autocmd QuickFixCmdPost *grep* cwindow

" Unite: configuration minimal
" Configuration similaire a ctrl-p.
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_winheight = 10
let g:unite_enable_split_vertically = 0
let g:unite_source_file_rec_ignore_pattern = '\%(.*\.chef/checksums/.*\)|\%(^\|/\)\.$\|\~$\|\.\%(o|exe|dll|bak|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'

nmap  U  [Unite]
xmap  U  [Unite]
nnoremap [Unite]   <Nop>
xnoremap [Unite]   <Nop>

nnoremap [Unite]U :<C-u>Unite<CR>

"FONCTIONS
" ----------------------------------------------------------------------------
" Preview
" permet de faire un surlignage d'un pattern dans une preview
function! s:preview()
  normal! zv
  normal! zz
  normal! V
  redraw
  sleep 400m
  wincmd p
endfunction

"ToggleHighlight_c1
let s:enabled1 = 0
let s:enabled2 = 0
function! ToggleHighlight_c1(column1, column2)
  if exists('+colorcolumn')
    if s:enabled1
      if s:enabled2
        let &colorcolumn=a:column2.",".join(range(a:column2,320),",")
      else
        let &colorcolumn=0
      endif
      let s:enabled1 = 0
    else
      if s:enabled2
        let &colorcolumn=a:column1.",".join(range(a:column2,320),",")
      else
        let &colorcolumn=a:column1
      endif
      let s:enabled1 = 1
    endif
  endif
endfunction
function! ToggleHighlight_c2(column1, column2)
  if exists('+colorcolumn')
    if s:enabled2
      if s:enabled1
        let &colorcolumn=a:column1
      else
        let &colorcolumn=0
      endif
      let s:enabled2 = 0
    else
      if s:enabled1
        let &colorcolumn=a:column1.",".join(range(a:column2,320),",")
      else
        let &colorcolumn=a:column2.",".join(range(a:column2,320),",")
      endif
      let s:enabled2 = 1
    endif
  endif
endfunction

" Fix_netrw_fixmaps
" Supprime le raccourcis s
function! Fix_netrw_fixmaps()
  unmap <buffer> s
  unmap! <buffer> s
  unmap <buffer> S
  unmap! <buffer> S
  unmap <buffer> U
  unmap! <buffer> U
  unmap <buffer> U
  unmap! <buffer> U
endfunction

function! VCSDiffFileVimDiff()
  execute "tab split " . expand('<cWORD>')
  VCSVimDiff
  normal gg
endfunction

function! VCSStatusWorkspace()
  tabe
  set bt=nofile
  r ! svn status .
  normal gg dd
endfunction

function! JGUDiffDir(dir1, dir2)
  tabe
  set bt=nofile
  set ft=dirdiff
  execute "r ! LANG=C diff -rq ".a:dir1." ".a:dir2. " | grep differ | awk '{print $2\" \"$4}' | grep -v '\.svn'"
  normal gg dd
endfunction
command! -nargs=* -complete=dir DirDiff silent call JGUDiffDir (<f-args>)

" Création du diff pour dirdiff
function! Dirdiff_map()
  nnoremap <silent> ²V :call JGUDirDiff_vim()<cr>
endfunction

function! JGUDirDiff_vim()
  let line=getline('.')
  execute "tab split " . expand('<cWORD>')
  execute ":args ". l:line ." | vertical all | windo diffthis"
  normal gg
endfunction

function! ToggleWindowSize(act)
  if a:act < 0 || a:act > 2 | return | endif
  let posX = getwinposx()
  let posY = getwinposy()
  let actTab = "XXX__X_XR__XX_X__RRRR__R"
  let idx = ((exists("g:twsWM") + exists("g:twsHM") * 2) * 3 + a:act) * 2
  let actW = strpart(actTab, idx, 1)
  let actH = strpart(actTab, idx + 1, 1)
  " note. g:tws + [Width,Height,X,Y] + [Maximized,Saved]
  if actW == "X"
    let g:twsWS = &columns | let g:twsXS = posX
    set columns=999
    let posX = getwinposx()
    let g:twsWM = &columns | let g:twsXM = posX
  elseif actW == "R"
    if g:twsWM == &columns
      let &columns = g:twsWS
      if g:twsXM == posX | let posX = g:twsXS | endif
    endif
    unlet g:twsWM g:twsWS g:twsXM g:twsXS
  endif
  if actH == "X"
    let g:twsHS = &lines | let g:twsYS = posY
    set lines=999
    let posY = getwinposy()
    let g:twsHM = &lines | let g:twsYM = posY
  elseif actH == "R"
    if g:twsHM == &lines
      let &lines = g:twsHS
      if g:twsYM == posY | let posY = g:twsYS | endif
    endif
    unlet g:twsHM g:twsHS g:twsYM g:twsYS
  endif
  execute "winpos " . posX . " " . posY
endfunction

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

function! JGUSvnStatus(...)
  tabe
  set bt=nofile
  if (a:0 >= 1)
    execute "r ! LANG=C svnvdfst " . a:1
  else
    execute "r ! LANG=C svnvdfst"
  endif
 normal gg dd
endfunction
command! -nargs=? -complete=file SvnStatus silent call JGUSvnStatus(<f-args>)

function! JGUCtags(...)
  if a:0 >= 1
    let type = a:1
    if type == "lib"
      if g:uname == "linux"
        execute ":!ctags -n -o ~/.tags.clib -R --c-kinds=+p --fields=+iaS --extra=+q /usr/include"
      elseif g:uname == "Darwin"
        execute ":!ctags -n -o ~/.tags.clib -R --c-kinds=+p --fields=+iaS --extra=+q /usr/local/include"
      else
        execute ":echom \"Clib tag not supported (yet?) in this OS.\""
      endif
    else
      execute ":echom \"Usage: :Ctags lib<cr> or :Ctags<cr>\""
    endif
  else
    execute ":!ctags -n -o tags.prj -R --exclude=*.js --exclude=*.html --exclude=*.vim --c-kinds=+p --fields=+iaS --extra=+q ."
  endif
endfunction
command! -nargs=? Ctags call JGUCtags(<f-args>)

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.compiling = {
      \     'description' : 'Makefile',
      \ }
let g:unite_source_menu_menus.compiling.command_candidates = [
      \   [ '1 - Compilation: Make fast spu pikeos',  ':Make fast_FSP_SPU_LOG_pikeos' ] ,
      \   [ '2 - Compilation: Make clean spu pikeos', ':Make clean_FSP_SPU_LOG_pikeos' ] ,
      \   [ '3 - Compilation: Make spu mdc',          ':Make mdc_FSP_SPU_LOG_pikeos' ] ,
      \   [ '4 - Compilation: Make spu pikeos',       ':Make FSP_SPU_LOG_pikeos' ] ,
      \ ]

nmap [Unite]c :Unite menu:compiling<cr>
