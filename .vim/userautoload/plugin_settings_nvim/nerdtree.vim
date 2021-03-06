scriptencoding utf-8
" Created:     2018/03/22 **:**:**
" Last Change: 2019/11/29 17:27:18.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" <Leader>o: 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>o :<C-u>NERDTree<CR>

" --------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------
let g:NERDTreeDirArrows   = 1
" let NERDTreeWinSize=22
let NERDTreeWinSize=32

" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden    = 1
" ブックマークをデフォルトで表示
let NERDTreeShowBookmarks = 1
" ファイルを開いたら "NERDTree" を閉じる
let NERDTreeQuitOnOpen    = 1

"他のバッファをすべて閉じた時に "NERDTree" が開いていたら閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 拡張子のハイライト設定
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')

"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor                   = {}           " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore']     = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor                 = {}           " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red  " sets the color for files ending with _spec.rb

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets              = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding               = ' '

" dir-icons
let g:WebDevIconsUnicodeDecorateFolderNodes              = 1
let g:DevIconsEnableFoldersOpenClose                     = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol                    = ''

" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols         = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css']  = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md']   = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt']  = ''
