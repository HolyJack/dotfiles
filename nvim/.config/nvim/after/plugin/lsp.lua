local ENSURE_INSTALLED = {
	"dockerls",
	"docker_compose_language_service",
	"pyre",
	"lua_ls",
	"custom_elements_ls",
	"jsonls",
	"tailwindcss",
	"terraformls",
	"jedi_language_server",
	"gopls",
}

-- Reference https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
local map = function(type, key, value)
	vim.api.nvim_buf_set_keymap(0, type, key, value, { noremap = true, silent = true })
end

local custom_attach = function(client)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
	map("n", "<leader>gw", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
	map("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
	map("n", "<leader>ah", "<cmd>lua vim.lsp.buf.hover()<CR>")
	map("n", "<leader>af", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	map("n", "<leader>ee", "<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>")
	map("n", "<leader>ar", "<cmd>lua vim.lsp.buf.rename()<CR>")
	map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local handlers = {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = custom_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					usePlaceholders = true,
				},
			},
		})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
}

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = ENSURE_INSTALLED })
require("mason-lspconfig").setup_handlers(handlers)
