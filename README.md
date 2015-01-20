###Currently Includes:###
* [Alternate](http://www.vim.org/scripts/script.php?script_id=31)
* [bufexplorer](http://www.vim.org/scripts/script.php?script_id=42)
* [bufkill](http://www.vim.org/scripts/script.php?script_id=1147)
* [easy_align](https://github.com/junegunn/vim-easy-align)
* [fugitive](https://github.com/tpope/vim-fugitive)

###Instructions for Windows###
    git clone https://github.com/pvhoffman/dotvim.git $HOME\vimfiles
    copy $HOME\vimfiles\.vimrc $HOME\_vimrc

Uncomment the guifont in $HOME\_vimrc for better fonts

$HOME is the directory refered to by executing within gvim:

    :echo $HOME

###Instructions for non-windows###
    git clone https://github.com/pvhoffman/dotvim.git ~/.vim
    cp ~/.vim/.vimrc ~/.vimrc


###All###
Clone fugutive from the link given above from within the bundle directory.

###Did it work?###
See which scripts where loaded in MacVim/gVim by executing:

    :scriptnames


Pathogen should have been loaded from within your $HOME directory and the included plugins loaded from the bundle directory.


