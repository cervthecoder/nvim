call plug#begin('~/.config/nvim/plugged')

Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

" LSP and completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Rust language support
Plug 'rust-lang/rust.vim'

" Color scheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" Statusline
Plug 'freddiehaddad/feline.nvim'

" File explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Install vim-fugitive
Plug 'tpope/vim-fugitive'

" Install gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'  " gitsigns dependency

"lua line
Plug 'nvim-lualine/lualine.nvim'


call plug#end()

set number
set mouse=a
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set encoding=UTF-8
set termguicolors

" Set colorscheme
colorscheme catppuccin-mocha

" Source Lua configuration
lua require('init')

" Move to the right before entering insert mode
" Move to the right before entering insert mode unless at end of line
nnoremap i :lua if vim.fn.col('.') < vim.fn.col('$') - 1 then vim.api.nvim_feedkeys('l', 'n', false) end vim.api.nvim_feedkeys('i', 'n', false)<CR>


" Codeium mapping
imap <script><silent><nowait><expr> <C-m-> codeium#Accept()
imap <C-k>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-l>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-q>   <Cmd>call codeium#Clear()<CR>

