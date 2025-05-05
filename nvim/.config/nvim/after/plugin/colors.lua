function ColorMyPencils(color)
	-- color = color or "onedark"
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "",
end

-- ColorMyPencils()
local neopywal = require("neopywal")
neopywal.setup({
  use_wallust = true,
})
vim.cmd.colorscheme("neopywal") 
