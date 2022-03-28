if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/app/dein/repos/github.com/Shougo/dein.vim

set wildmode=longest,list,full
set wildmenu
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/dist/*
set wildignore+=**/target/*
set wildignore+=*.pyc
set wildignore+=*.log
set wildignore+=**/.git/*
"@" set wildignore+=**/.cache/*
""" Note: This line has to be commented out, because
""" the path `./dein/.cache/` is used by the plugin `dein.vim`.

call dein#begin('~/app/dein')
let g:dein#types#git#default_protocol = "https"

call dein#add('~/app/dein/repos/github.com/Shougo/dein.vim')

"@" call dein#add('morhetz/gruvbox')
call dein#add('gongxgong/vim-gruvbox8')
call dein#add('gongxgong/papercolor-theme')
"@" call dein#add('altercation/vim-colors-solarized')

"@" call dein#add('itchyny/lightline.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('edkolev/tmuxline.vim')

"@" call dein#add('jbgutierrez/vim-better-comments')
call dein#add('folke/todo-comments.nvim')
lua << EOF_TODO_COMMENTS
  require("todo-comments").setup {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      MAYBE = { icon = "ﮐ ", color = "hint", alt = { "INFO" } },
    },
}
EOF_TODO_COMMENTS

call dein#add('ntpeters/vim-better-whitespace')
call dein#add('Yggdroot/indentLine')

call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate' })
call dein#add('nvim-lua/plenary.nvim')
call dein#add('nvim-neorg/neorg')
lua << EOF
  require('neorg').setup {
    -- Tell Neorg what modules to load
    load = {
      ["core.defaults"] = {}, -- Load all the default modules
      ["core.norg.concealer"] = {}, -- Allows for use of icons
      ["core.norg.dirman"] = { -- Manage your directories with Neorg
        config = {
          workspaces = {
            my_workspace = "~/neorg"
          }
        }
      }
    },
  }
EOF

"@" call dein#add('Shougo/deoplete.nvim')
call dein#add('majutsushi/tagbar')
""" Note: coc.nvim is conflicted with deoplete.nvim
call dein#add('neoclide/coc.nvim', {'merged': 0, 'rev': 'release'})
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#add('fatih/vim-go')

call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})

call dein#add('ap/vim-css-color')

call dein#add('fsharp/vim-fsharp', {'on_ft': 'fsharp', 'build': 'make fsautocomplete'})

call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

"@" call dein#add('junegunn/fzf', {'build': './install --all' })
"@" call dein#add('junegunn/fzf.vim', {'depends': 'fzf'})
call dein#add('lotabout/skim', {'build': 'cargo install --release; cp ./target/release/sk ./bin/'})

""" Note: Search thercode base with `ripgrep`
call dein#add('gabesoft/vim-ags')
let g:ags_agexe = 'rg'
let g:ags_agargs = {
  \ '--column'         : ['', ''],
  \ '--line-number'    : ['', ''],
  \ '--context'        : ['g:ags_agcontext', '-C'],
  \ '--max-count'      : ['g:ags_agmaxcount', ''],
  \ '--heading'        : ['',''],
  \ '--smart-case'     : ['','-S'],
  \ '--color'          : ['always',''],
  \ '--colors'         : [['match:fg:green', 'match:bg:black', 'match:style:nobold', 'path:fg:red', 'path:style:bold', 'line:fg:black', 'line:style:bold'] ,''],
  \ }
nnoremap <Leader>fw :Ags<Space>

""" Note: Typing Practice
call dein#add('dapplebeforedawn/vim-typing-practice')

call dein#end()

if dein#check_install()
  call dein#install()
endif

set number relativenumber
augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

let g:tabar_ctags_bin='/usr/bin/ctags-universal'

let g:deoplete#enable_at_startup = 1

""" Note: configure yats to highlight host specific keywords like `addEventListener`. Default is 1. Set it 0 to turn off highlighting.
let g:yats_host_keyword = 1

let g:gitgutter_highlight_linenrs = 1

""" config vim-newtrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

""" tmux statusline
let g:airline#extensions#tmuxline#enabled = 1

"@" " Using `Enter` as `Esc`
"@" function! ToggleEnterMapping()
"@"   if empty(mapcheck('<CR>', 'i'))
"@"     inoremap <CR> <Esc>`^
"@"     return "\<Esc>"
"@"   else
"@"     iunmap <CR>
"@"     return "\<CR>"
"@"   endif
"@" endfunction
"@" call ToggleEnterMapping()
"@" inoremap <expr> <S-CR> ToggleEnterMapping()
"@" " Optional (so <CR> cancels prefix, selection, operator).
"@" nnoremap <CR> <Esc>
"@" vnoremap <CR> <Esc>gV
"@" onoremap <CR> <Esc>

""" From coc.nvim, config GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
let g:coc_global_extensions = ['coc-git', 'coc-snippets', 'coc-rls', 'coc-go', 'coc-jedi', 'coc-tsserver', 'coc-eslint', 'coc-yaml', 'coc-toml', 'coc-html', 'coc-css', 'coc-vetur']

""" Fuzzy finder by `Skim`
nnoremap <Leader>ff <Cmd>SK<CR>

""" """ neovim as a git difftool, update in the file `~/.gitconfig`
""" [difftool]
"""     prompt = true
""" [diff]
"""     tool = nvimdiff
""" [difftool "nvimdiff"]
"""     cmd = "nvim -d \"$LOCAL\" \"$REMOTE\""


""" Compare current buffer and an arbitary spec.
function! Diff(mods, spec)
    let mods = a:mods
    if !len(mods) && &diffopt =~ 'vertical'
      let mods = 'vertical'
    endif
    execute mods . ' new'
    setlocal bufhidden=wipe buftype=nofile nobuflisted noswapfile
    let cmd = "++edit #"
    if len(a:spec)
        let cmd = "!git -C " . shellescape(fnamemodify(finddir('.git', '.;'), ':p:h:h')) . " show " . a:spec . ":#"
    endif
    execute "read " . cmd
    silent 0d_
    let &filetype = getbufvar('#', '&filetype')
    augroup Diff
      autocmd!
      autocmd BufWipeout <buffer> diffoff!
    augroup END
    diffthis
    wincmd p
    diffthis
endfunction
command! -nargs=? Diff call Diff(<q-mods>, <q-args>)


if has('termguicolors')
  set termguicolors
  syntax on
  set background=dark
  " set background=light
  colorscheme gruvbox8
  "" colorscheme solarized
  " colorscheme PaperColor
  " let g:airline_theme='papercolor'
  " let g:airline_theme='owo'
  " let g:airline_theme='base16_gruvbox_dark_soft'
  let g:airline_theme='onedark'

endif

function s:setTabWidth(w)
  let &l:shiftwidth=a:w
  let &l:softtabstop=a:w
  setlocal expandtab
endfunction

function s:setTabStop(w)
  let &l:shiftwidth=a:w
  let &l:tabstop=a:w
  setlocal noexpandtab
endfunction

""" 2 tab / indent space for languages
autocmd filetype vim call s:setTabWidth(2)
autocmd filetype toml call s:setTabWidth(2)
autocmd filetype yaml call s:setTabWidth(2)
autocmd filetype json call s:setTabWidth(2)
autocmd filetype bash call s:setTabWidth(2)
autocmd filetype javascript call s:setTabWidth(2)
autocmd filetype typescript call s:setTabWidth(2)
autocmd filetype fsharp call s:setTabWidth(2)
""" 4 tab / indent space for languages
autocmd filetype c call s:setTabWidth(4)
autocmd filetype cpp call s:setTabWidth(4)
autocmd filetype rust call s:setTabWidth(4)
autocmd filetype go call s:setTabStop(4)
autocmd filetype python call s:setTabWidth(4)

filetype plugin indent on
syntax enable

""" highlight LineNr term=bold cterm=NONE ctermfg=DarkYellow ctermbg=NONE gui=NONE guifg=#66C2C2 guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=#00D2D2 guibg=NONE

""" background transparent
highlight Normal guibg=NONE ctermbg=NONE
