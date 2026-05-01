---------------------------------------------------------------------
--
-- General Settings
--
---------------------------------------------------------------------

-- Encoding
vim.opt.encoding = "utf-8"

-- Enable mouse support
vim.opt.mouse = "a"

-- Enable clipboard support
vim.opt.clipboard:append("unnamedplus")

-- Enable filetype detection and plugins
vim.cmd("filetype plugin indent on")

-- Syntax highlighting
vim.cmd("syntax on")

-- Auto read external file changes
vim.opt.autoread = true

-- History / undo levels
vim.opt.history = 10000
vim.opt.undolevels = 1000

-- Lines kept above/below cursor when scrolling
vim.opt.scrolloff = 5

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Status / UI niceties
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.title = true

-- Tabs & indentation
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.magic = true

-- Wildmenu
vim.opt.wildmenu = true

-- Buffer handling / performance
vim.opt.hidden = true
vim.opt.lazyredraw = true

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Splits
vim.opt.splitright = true

-- Completion popup
vim.opt.completeopt = { "longest", "menuone" } -- no 'preview'

-- Folding
vim.opt.foldmethod = "manual"
vim.opt.foldnestmax = 3
vim.opt.foldcolumn = "0"
