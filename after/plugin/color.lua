require("rose-pine").setup({
	styles = {
		italic = false,
	},
})

require("catppuccin").setup({
    no_italic = true,
})

function SetColor(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetColor()
