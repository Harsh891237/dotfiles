return {
    {-- Shows CSS Colors
	'brenoprata10/nvim-highlight-colors',
	config = function()
	    require('nvim-highlight-colors').setup({})
	end	
    },
    {-- Makes terminal match with nvim colors
	'typicode/bg.nvim'
    },
   {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
	    require('telescope').setup()
	end
   },
   {
       'sharkdp/fd'
   },
   {
	'nvim-treesitter/nvim-treesitter'
   },
   { -- Easily add comments ( 1. use "gc" after selecting in visual mode; 2. use "gc3j"; 3. use "gcc" for current line. )
       "numToStr/Comment.nvim",
       opts = {},
       lazy = false,
    },
    {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	    "nvim-lua/plenary.nvim",
	    "MunifTanjim/nui.nvim",
	    "nvim-tree/nvim-web-devicons", 
	},
	lazy = false, -- neo-tree will lazily load itself
    },

}

