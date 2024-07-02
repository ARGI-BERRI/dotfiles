vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

vim.opt.number = true

-- file util
vim.opt.autoread = true
vim.opt.hidden = true

-- view
vim.opt.title = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.scrolloff = 5

-- tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true

-- search
vim.opt.wrapscan = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- misc
vim.opt.wildmenu = true
vim.opt.ttyfast = true
vim.opt.gdefault = true
vim.opt.termguicolors = true

require("config.lazy")

-- colorscheme
vim.cmd [[
    colorscheme kanagawa
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi VertSplit guibg=NONE ctermbg=NONE
    hi Special guibg=NONE ctermbg=NONE
    hi Identifier guibg=NONE ctermbg=NONE    
]]
