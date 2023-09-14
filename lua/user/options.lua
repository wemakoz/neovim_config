local options = {
	backup 			= false ,
	clipboard 		= "unnamedplus", 
	cmdheight 		= 2,
	completeopt 	= { "menuone", "noselect" }, 
	conceallevel	= 0, 
	fileencoding	= "utf-8", 
	hlsearch		= true, 
	ignorecase		= true, 
	mouse			= "a", 
	pumheight		= 7, 
	showmode		= false,
	showtabline		= 2,
	smartcase 		= true,
	smartindent		= true, 
	splitbelow		= true, 
	splitright		= true, 
	swapfile		= false,
	termguicolors	= true ,
	timeoutlen		= 1000,
	undofile		= true, 
	updatetime		= 300,
	writebackup		= false,
	expandtab		= true, 
	shiftwidth		= 4, 
	tabstop			= 4,
	cursorline		= true, 
	number			= true, 
	relativenumber	= false,
	numberwidth		= 4,
	signcolumn		= "yes",
	wrap			= true, 
	scrolloff		= 10, 
	sidescrolloff	= 5,
}

vim.opt.shortmess:append "c"

for key , value in pairs(options) do
	vim.opt[key] = value 
end 

vim.cmd "set whichwrap+=<,>,h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] 

