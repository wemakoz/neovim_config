local fn = vim.fn
local PACKER_USE_POPUP=true 
-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
-- BTW, pcall(func, *args) calls function <func> with *args arguments, if fails returns status_ok=false, else status_ok=true
-- Very useful when you not sure for chunk of code that may crash
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("Error on loading packer.nvim")
  return
end

-- If you would like packer to use popup frame set PACKER_USE_POPUP to true 
if(PACKER_USE_POPUP) then
    packer.init {
      display = {
        open_fn = function()
          return require("packer.util").float { border = "rounded" }
        end,
      },
    }
end

-- PACKAGES 
return packer.startup(function(use)

  use "wbthomason/packer.nvim" 
  use "nvim-lua/popup.nvim" 
  use "nvim-lua/plenary.nvim"


  -- Colorschemes 
 -- use 'lunarvim/colorschemes'
  use "lunarvim/darkplus.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
