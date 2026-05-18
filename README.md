# transparent.vim

\> **Note:** This is a fork of [tribela/vim-transparent](https://github.com/tribela/vim-transparent). > This version includes enhancements to fix background clearing issues and adds a configuration variable to control the default startup behavior.

## Features

- Makes the Vim/Neovim background transparent. -
- Supports manual toggling (`TransparentToggle`, `TransparentEnable`, `TransparentDisable`).
- **Enhanced:** Fixes issues where the background would reappear after changing color schemes.
- **Enhanced:** Adds `g:transparent_default_enabled` to control whether transparency is active by default on startup.

## Installation

use [Vim-Plug].

```vimrc
Plug 'JutsAoJonWong/transparent.vim'
```

## Configuration

### Default Behavior

By default, this plugin will NOT enable transparency on startup. You must manually trigger it.
If you want transparency to be enabled automatically when Vim starts, add this to your config:

```vim
let g:transparent_default_enabled = 1
```

### Advanced configuration

#### Customizing Transparent Groups

The bad thing is something in vim may be not transparent, if you use vim plugins. You can use `:filter /<pattern>/ hi` to find the highlight groups e.g. `:filter /CocList/ hi`, and change it.

For example, I use these plugins, [coc.nvim](https://github.com/neoclide/coc.nvim), [lightline](https://github.com/itchyny/lightline.vim), [rnvimr](https://github.com/kevinhwang91/rnvimr), [fzf.vim](https://github.com/junegunn/fzf), [vim-deus](https://github.com/ajmwagar/vim-deus).

:bulb: You can also use `let g:transparent_groups_add` if you just want to add some groups, without overriding the defaults.

```vim
" Plug 'tribela/vim-transparent'  " the raw project
Plug 'JustAoJonWong/transparent.vim'

" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']

" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']

augroup transparent
    autocmd VimEnter,ColorScheme * call MyTransparent()
augroup END

function! MyTransparent()
    " Customize the highlight groups for transparency in here.

    " CursorLine
    "hi CursorLine ctermfg=NONE ctermbg=239 guibg=NONE guibg=#4e4e4e

    " coc.nvim
    "hi CocMenuSel ctermbg=239 guibg=#4e4e4e
endfunction
```

fzf.vim:

```vim
":echo g:fzf_colors
" transparent the gutter
let $FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS .. ' --color=gutter:-1'
```

#### Images

coc.nvim floating windows:

![coc-floating_windows](https://github.com/tribela/vim-transparent/assets/5047683/debb3c35-7b37-4fe5-a638-140081f1d245)

coc.nvim CocList:

![coc-coclist](https://github.com/tribela/vim-transparent/assets/5047683/186e9b69-0caf-4390-b524-79ff82be7398)

Pmenu:

![pmenu](https://github.com/tribela/vim-transparent/assets/5047683/0f8b36d6-13b9-4eba-a620-6b1334e70be0)

### Usage

vim-transparent automatically transparent all of highlight settings.

You can disable it by `:TransparentDisable` and re-enable it by `:TransparentEnable`
