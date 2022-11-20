vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true --don't ignore case in search when there is uppercase letter
vim.opt.equalalways = false -- don't resize windows on changing window state ( closing or splitting )
vim.opt.modeline = true --
vim.opt.autoread = true -- If you detect a file change read it automatically
vim.opt.compatible = false -- no need legacy VI compatibility
vim.opt.encoding = "utf-8" -- Default file encoding
vim.opt.hlsearch = true -- Highlight search matches
vim.opt.history = 700 -- Number of stored history items
vim.opt.tabpagemax = 100 -- Max number of tabs
vim.opt.ruler = true -- Show line and column in statusline
vim.opt.mouse = "a" -- enable mouse support for all modes
vim.opt.autoindent = true -- do auto indent when going to new line
vim.opt.cindent = true
vim.opt.wrap = false -- no line wrapping
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.splitright = true -- vertical split creates a new window right of current window
vim.opt.splitbelow = true -- horizontal split creates a new window below current window
vim.opt.cursorline = true -- highlight current line
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- show current line number
vim.opt.showmode = true -- show current vim mode down of the screen
vim.opt.showcmd = true -- show commands as they are being typed
vim.opt.hidden = true
vim.opt.updatetime = 100
vim.opt.incsearch = true -- Continue search as I type characters
vim.opt.guioptions = "egmrti"
vim.opt.backspace = "indent,eol,start"
vim.opt.complete = vim.opt.complete + "i" -- don't search for all included files
vim.opt.wildmenu = true
vim.opt.wildoptions = "tagfile"
vim.opt.updatetime = 300
vim.opt.pumheight = 10 -- Completion window max size
vim.opt.conceallevel = 2 -- Concealed text is completely hidden
vim.opt.shortmess = vim.opt.shortmess + "c" -- Shut off completion messages
vim.opt.belloff = vim.opt.belloff + "ctrlg" -- If Vim beeps during completion
vim.opt.termguicolors = true -- true color support, needs terminal support as well
vim.opt.list = true -- use list characters that are defined below
vim.opt.listchars:append "tab:<->"
vim.opt.listchars:append "eol:↲"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "lead:·"
vim.opt.timeoutlen = 500 -- when a key is pressed timeout until it's forgotten
vim.opt.clipboard:append "unnamedplus" -- use system clipboard by default

if vim.version().major >= 0 and vim.version().minor >= 8 then
  vim.opt.laststatus = 3 -- if supported use global statusline
end


