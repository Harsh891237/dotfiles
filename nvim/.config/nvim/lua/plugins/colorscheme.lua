-- Tokyonight Theme
return {
    "folke/tokyonight.nvim",
    lazy = false, 
    priority = 1000, 
    config = function()
	require("tokyonight").setup({
	    transparent = true,
	    styles = {
		sidebars = "transparent",
		floats = "transparent",
	    },
	})

	local bg_transparent = true 
	-- Toggle background transparency
	local toggle_transparency = function()
	    bg_transparent = not bg_transparent
	    require("tokyonight").setup({
		transparent = bg_transparent
	    })
	    vim.cmd [[colorscheme tokyonight]]
	end
	vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })

	vim.cmd([[colorscheme tokyonight]])
    end,
}
