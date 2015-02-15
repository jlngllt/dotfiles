" CONFIGURATION GÉNÉRAL
" ----------------------------------------------------------------------------
" n'est pas compatible avec vi set nocompatible
set nocompatible
" option requise pour vundle
filetype off
" caractère de la variable <leader>
let mapleader = ","

" VUNDLE
" ----------------------------------------------------------------------------
" installation de vundle (vundle est le gestionnaire de plugin)
if has('win32') || has('win64')
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin('$HOME/.vim/bundle/')
else
  " Usual quickstart instructions
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
endif
Plugin 'gmarik/Vundle.vim'
" installation de plugin
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/vcscommand.vim'
" color
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'w0ng/vim-hybrid'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'shougo/vimshell'
Plugin 'shougo/vimproc'
call vundle#end()

" GVIM
" configuration de gvim
if has("gui_running")
  if has('win32') || has ('win64')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
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
" activation d'une indentation
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
" ne coupe pas le texte lorsqu'il est trop long
set nowrap
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
set norelativenumber
set nonumber
set numberwidth=4
" ne ferme pas le(s) buffer(s) (permet d'ouvrir un autre fichier sans avoir
"   besoin de sauvegarder le buffer en cours si il a déjà été modifié)
" set hidden
" système d'encodage de caractère dans vim
set encoding=utf-8
" paramétrage de la langue pour la correction orthographique
set spelllang=fr
" ajout de path des includes pour pouvoir naviguer facilement avec les noms de
" fichier avec des commandes tel que gf
set path+=**
" affiche les espaces et tabulation
set list
set listchars=trail:·,tab:>-,eol:¬
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
" utilise des espaces en lieu et place de tabulation
set expandtab
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
set lazyredraw
set ttyfast
" pour pouvoir avoir des accents sur windows
if has('win32') || has('win64')
  lang mess en
else
  lang mess C
endif
if has("gui_running")
  " plus d'espace entre chaque ligne (améliore la lisibilité)
  set linespace=1
endif
" emplacement des tags
set tags=./tags;
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
set cino=b1,t0,(0,W8
" backspace disponible en mode insertion
set backspace=indent,eol,start

" COLOR
" ----------------------------------------------------------------------------
" activation de la coloration syntaxique
syntax on
" activation des 256 couleurs (d'un bon terminal) pour la coloration 
" syntaxique
set t_Co=256

" ---------------------
" Système de notation des couleurs pour savoir si elles sont utilisables dans
" tout les cas. (diff - spell - search - colorcolumn)
" TEMPLATE :
" NOM_DE_LA_COULEUR DIFF SPELL SEARCH COLORCOLUMN (X -> NOK - O -> OK)
" EXEMPLE : (couleur github diff => NOK Spell => NOK Search => OK CC => OK)
" GITHUB XXOO
" ---------------------

" Couleurs LIGHT/DARK
"---------------------
" lucius OOOO
"light
"let g:lucius_style='light'
"let g:lucius_use_bold=0
"let g:lucius_contrast_bg='high'
"let g:lucius_contrast='normal'
"dark
"let g:lucius_style='dark'

"colorscheme lucius
"---------------------
" seoul256 OOOO
"light
"let g:seoul256_background=255
"dark
"let g:seoul256_background=230
"colorscheme seoul256
"---------------------
" gruvbox OOOO
" besoin de lancer le script ~./vim/bundle/gruvbox/gruvbox_256palette.sh
" pour ne pas avoir de problème de mauvais affichage des couleurs
" A AJOUTER DANS LE .BASHRC POUR AVOIR LES COULEURS DÉFINIT DIRECTEMENT AU
" LANCEMENT DU SHELL :
"     GRUVBOX_SHELL="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
"     [[ -s $GRUVBOX_SHELL ]] && source $GRUVBOX_SHELL

"set background=light
""set background=dark
"" Si le characteres en italic sont supportés
"if    !has("gui_running") 
" \ && &term != 'rxvt-unicode-256color'
" \ && &term != 'screen-256color-italic'
"  let g:gruvbox_italic=0
"endif
"" Suppression des characteres en gras pour une meilleur lisibilité
"let g:gruvbox_bold=0
"colorscheme gruvbox
"---------------------

"" Couleurs DARK
"---------------------
" TOMOROW-NIGHT 00OO
set background=dark
colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"---------------------
" Hybrid OOOO
"colorscheme hybrid
"---------------------
" Molokai OOOO
"let g:rehash256=1
"colorscheme molokai

" La coloration syntaxique pour les documents complexe est légèrement lente.
" Ajout de cette configuration pour réduire le chargement)
set synmaxcol=400
syn sync minlines=200
syn sync maxlines=500

" Si on peut on highlight on fait une bande a 80 lignes et on fait une grosse
" bande large à 120
nnoremap <F10>  :call ToggleHighlight_c2(80,120)<cr>
nnoremap <F9>   :call ToggleHighlight_c1(80,120)<cr>

" NETRW
" ----------------------------------------------------------------------------
let g:netrw_liststyle = 0
let g:netrw_alto      = 1
let g:netrw_altv      = 1
let g:netrw_banner    = 0
if has('win32') || has('win64')
  let g:netrw_localrmdir="rd /s /q"
else
  let g:netrw_localrmdir="rm -r"
endif


" FILETYPE/AUTOCMD
" ----------------------------------------------------------------------------
au BufRead, BufNewFile {Gemfile, Rakefile, Vagrantfile, Thorfile, config.ru}
      \ set ft=ruby
au BufRead, BufNewFile {*.md} set ft=markdown
autocmd BufNewFile,BufRead *.txt set filetype=txt
autocmd FileType txt setlocal textwidth=78 wrapmargin=2 tabstop=8 shiftwidth=8
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
" Merci olivier pour ces indentations :D
autocmd FileType c setlocal ts=3 sts=3 sw=3 expandtab
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType bash setlocal shiftwidth=2 tabstop=2 expandtab

autocmd FileType qf nnoremap <buffer> p <CR>:call <SID>preview()<CR>
autocmd BufReadPost quickfix setlocal colorcolumn=0
autocmd Filetype netrw setlocal colorcolumn=0
autocmd BufReadPost quickfix set modifiable

" enlève le sur lignage de la ligne et colonne dans la fenêtre tagbar
autocmd FileType tagbar setlocal nocursorline nocursorcolumn
" enlève le commentaire automatique après qu'une ligne commenté soit écrite
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" PLUGINS
" ----------------------------------------------------------------------------
" TagBar
nmap <leader>t :Tagbar<cr>

" MAPPING
" ----------------------------------------------------------------------------
" annulation du sur lignage après une recherche
nmap <space> :set hls!<Bar>:set hls?<CR>
" activation de diffèrent type d'indentation
nmap <F4> :set expandtab   tabstop=4 shiftwidth=4  softtabstop=4<CR>
nmap <F2> :set expandtab   tabstop=2 shiftwidth=2  softtabstop=2<CR>
nmap <F3> :set expandtab   tabstop=3 shiftwidth=3  softtabstop=3<CR>
" activation de la correction orthographique
nmap <F5> :!ctags -R . --c-kinds=+p --fields=+iaS --extra=+q
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
nnoremap <silent># :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>
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

" supprime le raccourcis sort (s) dans netrw pour pouvoir utiliser ctrl-p à la
" place
augroup netrw_fixmaps
  autocmd!
  autocmd filetype netrw call Fix_netrw_fixmaps()
augroup END

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
nnoremap <silent> !V :call VCSDiffFileVimDiff()<cr>
nnoremap <silent> !w :call VCSDiffWorkspace()<cr>
nnoremap <silent> !S :call VCSStatusWorkspace()<cr>
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
nnoremap [Search]g :<C-u>vimgrep //gj **/*.<left><left><left>
\<left><left><left><left><left><left>
nnoremap [Search]G :<C-u>vimgrep /<c-r><c-w>/gj **/*.
" search trailing space
nnoremap [Search]<space> /\s\+$/<cr>

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
" ignore dossier et fichier dans ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a)$',
  \ }

" pas de lien symbolique
let g:ctrlp_follow_symlinks=0
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
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden --nogroup --hidden
                                     \ --ignore .git
                                     \ --ignore **/*.a
                                     \ --ignore **/*.o
                                     \ --ignore **/*.bin
                                     \ --ignore **/*.dia
                                     \ --ignore .svn
                                     \ --ignore .hg
                                     \ --ignore .DS_Store
                                     \ --ignore "**/*.pyc"
                                     \ -g ""'
elseif executable('ack')
  let g:ctrlp_user_command = 'ack %s --nocolor -g ""'
endif

" option de recherche quand grep est utilisé dans vim
set grepprg=grep\ -Hnd\ skip\ -r
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m
" quickfix toujours en bas de la fenêtre
autocmd FileType qf wincmd J
" fenêtre quickfix pour cwindow
autocmd QuickFixCmdPost *grep* cwindow


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
endfunction

function! VCSDiffWorkspace()
  vert new
  set bt=nofile
  set ft=diff
  r ! svn diff */
  normal gg dd
endfunction

function! VCSDiffFileVimDiff()
  execute "tab split " . expand('<cWORD>')
  VCSVimDiff
endfunction

function! VCSStatusWorkspace()
  vert new
  set bt=nofile
  r ! svn status */
  normal gg dd
endfunction
