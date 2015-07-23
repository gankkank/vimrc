"#
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=/etc/vim/custom/bundle/Vundle.vim
call vundle#begin('/etc/vim/custom/bundle')
Plugin 'gmarik/Vundle.vim'


"
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Townk/vim-autoclose'

" Syntax Highlight
"
Plugin 'tpope/vim-cucumber'
Plugin 'pangloss/vim-javascript'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leshill/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'fatih/vim-go'

" Color Scheme
Plugin 'altercation/vim-colors-solarized'

" 
"source ~/.vim/rc/powerline.vimrc
source ~/.vim/rc/airline.vimrc

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Essentails
"syntax on
syntax enable
set background=light
colorscheme solarized

set number

set tabstop=2
set shiftwidth=2
set expandtab

"set backup
"set backupdir=~/.vim/backup
set nobackup


"set paste
set pastetoggle=<F10>
