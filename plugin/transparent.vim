" 新增：设置默认是否开启透明的变量，0为关闭，1为开启
if !exists('g:transparent_default_enabled')
  let g:transparent_default_enabled = 0
endif

augroup transparent
    autocmd!
    " 修改：只有在变量为 1 时，启动时才自动清除背景
    autocmd VimEnter * if g:transparent_default_enabled | call background#clear_background() | endif
    " ColorScheme 的自动命令可以保持注释掉，因为我们已经在 enable/toggle 函数里手动调用了
    " autocmd ColorScheme * call background#clear_background()
    
    command -bar -nargs=0 ClearBackground call background#clear_background()
    command -bar -nargs=0 TransparentDisable call background#disable()
    command -bar -nargs=0 TransparentEnable call background#enable()
    command -bar -nargs=0 TransparentToggle call background#toggle()
augroup END
