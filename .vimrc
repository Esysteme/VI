""""""""""""""""""""""""""""""""""""""""""""""""""
" Fichier .vimrc
" Créé le 11 mai 2006
" Nicolas Gressier (Yoshidu62@gmail.com)
" Mise à jour : 18/06/2013 (par Aurélien LEQUOY)
" Version 3.0
""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on


""""""""""""""""""""""""""""""""""""""""""""""""""
"Diverses options
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                  " désactivation de la compatibilité avec vi
set background=dark                               " fond sombre
colorscheme desert                                " couleur
syntax enable                                     " activation de la coloration syntaxique
set number                                        " numérotation des lignes
set autoindent                                    " indentation automatique avancée
set smartindent                                   " indentation plus intelligente
set laststatus=2                                  " ajoute une barre de status
set backspace=indent,eol,start                    " autorisation du retour arrière
set history=50                                    " historique de 50 commandes
set ruler                                         " affiche la position courante au sein du fichier
set showcmd                                       " affiche la commande en cours
set shiftwidth=4                                  " nombre de tabulation pour l'indentation
set tabstop=4  				  				  " nombre d'espace pour une tabulation
set showmatch                                     " vérification présence ([ ou { à la frappe de )] ou }
filetype plugin indent on                         " détection automatique du type de fichier
autocmd FileType text setlocal textwidth=72       " les fichiers de type .txt sont limites à 72 caractères par ligne
set fileformats=unix,mac,dos                      " gestion des retours chariot en fonction du type de fichier
set viewdir=/home/ngressier/.vim/saveview/        " répertoire pour sauvegarder les vues, utiles pour les replis manuels
set foldcolumn=2                                  " repère visuel pour les folds
let Tlist_Ctags_Cmd = '/usr/bin/ctags'		  	  " implémentation de ctags, nécessaire pour le plugin 'taglist'
set incsearch                                     " recherche incrémentale
set hlsearch                                      " surligne les résultats de la recherche
set ignorecase                                    " ne pas prendre en compte la casse pour les recherches
set nolist					  					  " on n'affiche pas les caractères non imprimables
set listchars=eol:¶,tab:..,trail:~		  		  " paramétrage des caractères non imprimables au cas où l'on souhaiterait les afficher


""""""""""""""""""""""""""""""""""""""""""""""""""
"tester le code PHP contre les erreurs de syntaxe
""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :!php -l %<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour désactiver le surlignage des
"résultats d'une recherche
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-N> :noh<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour naviguer dans les lignes coupées
""""""""""""""""""""""""""""""""""""""""""""""""""
map <A-DOWN> gj
map <A-UP> gk
imap <A-UP> <ESC>gki
imap <A-DOWN> <ESC>gkj



""""""""""""""""""""""""""""""""""""""""""""""""""
"Repositionner le curseur à l'emplacement de la
"dernière édition
""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
 
 
 
""""""""""""""""""""""""""""""""""""""""""""""""""
"Chargement des types de fichiers
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufEnter *.txt set filetype=text             " chargement du type de fichier pour le format txt



""""""""""""""""""""""""""""""""""""""""""""""""""
"Omni-completion par CTRL-X_CTRL-O
""""""""""""""""""""""""""""""""""""""""""""""""""
au filetype html        set omnifunc=htmlcomplete#CompleteTags
au filetype css         set omnifunc=csscomplete#CompleteCSS
au filetype javascript  set omnifunc=javascriptcomplete#CompleteJS
au filetype c           set omnifunc=ccomplete#Complete
au filetype php         set omnifunc=phpcomplete#CompletePHP
au filetype prn         set omnifunc=phpcomplete#CompletePHP
au filetype ruby        set omnifunc=rubycomplete#Complete
au filetype sql         set omnifunc=sqlcomplete#Complete
au filetype python      set omnifunc=pythoncomplete#Complete
au filetype xml         set omnifunc=xmlcomplete#CompleteTags



""""""""""""""""""""""""""""""""""""""""""""""""""
"Personnalisation de la barre de statut
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%t%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [FENC=%{&fileencoding}]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]\ [TAG=%{Tlist_Get_Tagname_By_Line()}]



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour l'activation de l'explorateur
"système
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :NERDTree /home/ngressier/<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping et configuration pour la liste des tags
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1		" vim se ferme si il reste uniquement la fenêtre des tags
let Tlist_Process_File_Always = 1	" activation permanente du plugin pour la barre de statut
let Tlist_Use_Right_Window = 1		" affiche les tags sur le côté droit de l'écran



""""""""""""""""""""""""""""""""""""""""""""""""""
"Sauvegarde automatique des vues, utiles pour les
"replis manuels
""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview



""""""""""""""""""""""""""""""""""""""""""""""""""
"Map pour se déplacer dans les onglets
""""""""""""""""""""""""""""""""""""""""""""""""""
map <tab> gt



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour insérer la date du jour
""""""""""""""""""""""""""""""""""""""""""""""""""
imap \date  <C-R>=strftime("%d/%m/%Y")<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Mapping pour copier, couper, coller
"et sélectionner
""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-x> "+x
map <C-c> "+y
map <C-p> "+gP
map <C-a> ggVG



""""""""""""""""""""""""""""""""""""""""""""""""""
"Dictionnaire français
"Liste des propositions par CTRL-X_CTRL-K
""""""""""""""""""""""""""""""""""""""""""""""""""
set dictionary+=/usr/share/dict/french



""""""""""""""""""""""""""""""""""""""""""""""""""
"Correction orthographique
"Liste des propositions par CTRL-X_s
""""""""""""""""""""""""""""""""""""""""""""""""""
set spellsuggest=5                                   " on affiche uniquement les 5 premières propositions 
autocmd BufEnter *.txt set spell                     " correction orthographique dans les fichiers textes
autocmd BufEnter *.txt set spelllang=fr              " correction orthographique dans les fichiers textes



""""""""""""""""""""""""""""""""""""""""""""""""""
"Infos-Bulles
""""""""""""""""""""""""""""""""""""""""""""""""""
"function! FoldSpellBalloon()
"    let foldStart = foldclosed(v:beval_lnum)
"    let foldEnd = foldclosedend(v:beval_lnum)
"    let lines = []
"    "Detect if we are in a fold
"    if foldStart < 0
"	"Detect if we are on a misspelled word
"	let lines = spellsuggest(spellbadword(v:beval_text)[0], 5, 0)
"    else
"	"We are in a fold
"	let numLines = foldEnd - foldStart + 1
"	"If we have too many lines in fold, show only the first 14
"	"and the last 14 lines
"	if(numLines > 31)
"	    let lines = getline(foldStart, foldStart + 14)
"	    let lines += ['-- Snipped ' . (numLines - 30) . ' lines --']
"	    let lines += getline(foldEnd - 14, foldEnd)
"	else
"	    "Less than 30 lines, lets show all of them
"	    let lines = getline(foldStart, foldEnd)
"	endif
"    endif
"    "Return result
"    return join(lines, has("balloon_multiline") ? "\n" : " ")
"endfunction

"set balloonexpr=FoldSpellBalloon()
"set ballooneval



""""""""""""""""""""""""""""""""""""""""""""""""""
"Nom du fichier en cours dans l'onglet pour Vim
""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShortTabLine()
    let ret = ''
    for i in range(tabpagenr('$'))
	"Select the color group for highlighting active tab
	if i + 1 == tabpagenr()
	    let ret .= '%#errorMsg#'
	else
	    let ret .= '%#TabLine#'
	endif

	"Find the buffername for the tablabel
	let buflist = tabpagebuflist(i+1)
	let winnr = tabpagewinnr(i+1)
	let buffername = bufname(buflist[winnr - 1])
	let filename = fnamemodify(buffername, ':t')
	"Check if there is no name
	if filename == ''
	    let filename = 'noname'
	endif
	"Only show the first 18 letters of the name and
	".. if the filename is more than 20 letters long
	if strlen(filename) >= 8
	    let ret .= '['.filename[0:17].'..]'
	else
	    let ret .= '['.filename.']'
	endif
    endfor

    "After the last tab fill with TabLineFill and reset tab page #
    let ret .= '%#TabLineFill#%T'
    return ret
endfunction

set tabline=%!ShortTabLine()



""""""""""""""""""""""""""""""""""""""""""""""""""
"Modification de l'affichage des replis
""""""""""""""""""""""""""""""""""""""""""""""""""
function! MyFoldFunction()
    let line = getline(v:foldstart)
    "Cleanup unwanted things in first line
    let sub = substitute(line, '/\*\|\*/\|^\s+', '', 'g')
    "Calculate lines in folded text
    let lines = v:foldend - v:foldstart + 1
    return v:folddashes.sub.' {...'.lines.' Lines...}'
endfunction

set foldtext=MyFoldFunction()



""""""""""""""""""""""""""""""""""""""""""""""""""
"Poser une marque visible avec F7
""""""""""""""""""""""""""""""""""""""""""""""""""
hi Mark guibg=indianred guifg=white gui=bold cterm=bold ctermfg=7 ctermbg=1
sign define mark text=!> texthl=Mark
map <F7> :exe 'sign place 001 name=mark line='.line(".").' buffer='.winbufnr(0)<CR>
map <C-F7> :sign unplace<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""
"Couleur pour les templates
""""""""""""""""""""""""""""""""""""""""""""""""""
hi def link Todo TODO
syn keyword Todo TODO FIXME XXX DEBUG


""""""""""""""""""""""""""""""""""""""""""""""""""
"special PHP
""""""""""""""""""""""""""""""""""""""""""""""""""


"J'utilise le theme desert, que je trouve bien adapté
colors desert 


"LA police pour les programmeurs qui se respectent
set gfn=ProggySquareTT:h12:cANSI


"Met les fins de ligne du type UNIX.
set fileformat=unix 

"L'UTF-8 dominera le monde !
set encoding=utf-8 


"Met des x à la place des espaces qui trainent à la fin des lignes, radicales pour les voir et les supprimer 
set listchars=trail:x 


"Active la complétion automatique, complète dès que vous taper un mot, une fonction, sans avoir à appuyer sur TAB. 
set complete=.,w,b,u,t,i,k~/.vim/doc/php.api 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP 
source ~/.vim/plugin/word_complete.vim 
call DoWordComplete() 


let php_sql_query=1 
let php_htmlInStrings=1 




function! Find(name) 
    let l:_name = substitute(a:name, "\\s", "*", "g" ) 
    let l:list  = system("find . -iname '*".l:_name."*' -type f -not -name \"*.swp\" | perl -ne 'print \"$.\\t$_\"'" ) 
    let l:num   = strlen(substitute(l:list, "[^\n]", "", "g" )) 
    if l:num < 1 
        echo "'".a:name."' not found" 
        return 
    endif 
 
    if l:num != 1 
        echo l:list 
        let l:input = input("Which ? (<enter> = nothing)\n" ) 
 
        if strlen(l:input) == 0 
            return 
        endif 
 
        if strlen(substitute(l:input, "[0-9]", "", "g" )) > 0 
            echo "Not a number" 
            return 
        endif 
 
        if l:input < 1 || l:input > l:num 
            echo "Out of range" 
            return 
        endif 
 
        let l:line = matchstr("\n".l:list, "\n".l:input."\t[^\n]*" ) 
    else 
        let l:line = l:list 
    endif 
 
    let l:line = substitute(l:line, "^[^\t]*\t./", "", "" ) 
    execute ":bad ".l:line 
    execute ":MiniBufExplorer" 
    execute ":UMiniBufExplorer" 
endfunction 
 
command! -nargs=1 Find :call Find("<args>" ) 
 
map ,f :Fi- 
