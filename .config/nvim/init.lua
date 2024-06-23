vim.cmd([[
autocmd BufRead,BufEnter *.astro set filetype=astro
autocmd BufNewFile,BufRead *.vert,*.tesc,*.tese,*.geom,*.frag,*.comp,*.vs,*.fs set filetype=glsl
autocmd BufRead,BufEnter *.slim set filetype=slim
nmap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
tnoremap <Esc> <C-\><C-n>
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" hi Normal ctermbg=NONE ctermfg=252 guibg=#NONE guifg=#c6c8d1
]])
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
	"folke/which-key.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[
      colorschem tokyonight
      ]])
		end,
	},
})
