return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	use "EdenEast/nightfox.nvim"
	use "nvim-treesitter/nvim-treesitter"
	use "nvim-treesitter/nvim-treesitter-context"
	use {
		"nvim-telescope/telescope.nvim", branch = '0.1.x',
		requires = { {"nvim-lua/plenary.nvim"} }
	}
end)
