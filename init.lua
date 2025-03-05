-- https://vi.stackexchange.com/questions/12794/how-to-share-config-between-vim-and-neovim/39957#39957
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
]])

-- vim.o.background = "light"
-- vim.cmd.colorscheme "base16-default-light"
