vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
vim.opt.updatetime = 50
vim.opt.shortmess:append "c" -- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append "I" -- No Intro message
vim.opt.clipboard:append "unnamedplus" -- use system clipboard as default register.
vim.opt.splitbelow = true
vim.opt.splitright = true
if vim.version().major >= 0 and vim.version().minor >= 8 then
  vim.opt.laststatus = 3 -- if supported use global statusline
end

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
