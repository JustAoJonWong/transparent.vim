function! background#clear_background()
    if g:clear_background
        if !exists('g:transparent_groups')
            let g:transparent_groups =
                        \['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                        \'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                        \'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                        \'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer',
                        \'VertSplit']
            if has('nvim')
                let g:transparent_groups += ['NormalNC']
            endif
        endif
        if exists('g:transparent_groups_add')
            let g:transparent_groups += g:transparent_groups_add
        endif
        for group in g:transparent_groups
            call s:clear_bg(group)
        endfor
    endif
endfunction

function! background#disable()
    let g:clear_background = 0
    let g:transparent_default_enabled = 0 " 同步更新全局变量
    execute 'colorscheme ' . g:colors_name
endfunction

function! background#enable()
    let g:clear_background = 1
    let g:transparent_default_enabled = 1 " 同步更新全局变量
    execute 'colorscheme ' . g:colors_name
    " 切换配色后，强制再次清除背景
    call background#clear_background()
endfunction

function! background#toggle()
    let g:clear_background = !g:clear_background
    let g:transparent_default_enabled = g:clear_background " 同步更新全局变量
    execute 'colorscheme ' . g:colors_name
    " 切换配色后，根据开关状态决定是否清除背景
    if g:clear_background
        call background#clear_background()
    endif
endfunction
