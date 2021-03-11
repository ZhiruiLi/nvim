local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
    require("completion").on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap=true, silent=true }
    buf_set_keymap("n", "<leader>si", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = { "clangd", "gopls", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
