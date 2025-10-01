-- Set options for a better editing experience
local opt = vim.opt

opt.number = true -- Show line numbers
opt.relativenumber = false -- Show relative line numbers
opt.tabstop = 4 -- Number of spaces a tab counts for
opt.shiftwidth = 4 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Makes indenting smart
opt.wrap = false -- Do not wrap lines
opt.swapfile = true -- Don't use a swap file
opt.backup = false -- Don't create a backup file
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = true -- Don't highlight search results
opt.incsearch = true -- Highlight search results as you type
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.scrolloff = 8 -- Keep cursor 8 lines from top/bottom
opt.updatetime = 50 -- Faster update time for plugins
opt.signcolumn = "yes" -- Always show the sign column
opt.clipboard = 'unnamedplus'
