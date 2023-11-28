------ lazy.nvim ---------------
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
vim.fn.system ({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
vim.opt.rtp:prepend(lazypath)
