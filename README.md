# vim

Only my neovim config file. 

It works on my own computer. But all the icon, airline, battery etc. might not work on wsl...

To be set on ~/.config/nvim/
or /usr/share/nvim/ and be renamed sysinit.vim

Some Extra installation might be needed for using coc. 

For having a better folding view:
Change in ~/.vim/plugged/gruvbox-material/colors on line 69:
call gruvbox_material#highlight('Folded', s:palette.yellow, s:palette.bg0, 'bold')
