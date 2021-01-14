" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

" augroup CompletionTriggerCharacter
"     autocmd!
"     autocmd BufEnter * let g:completion_trigger_character = ['.']
"     autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::', '->']
" augroup end

" Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
set completeopt=menuone,noinsert

" Avoid showing message extra message when using completion
set shortmess+=c

:lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  require('completion').on_attach()

  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- local opts = { noremap=true, silent=true }
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<leader>pa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>pd', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>pl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  --   buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- elseif client.resolved_capabilities.document_range_formatting then
  --   buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    require('lspconfig').util.nvim_multiline_command [[
      :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {'gopls', 'clangd', 'tsserver', 'pyls', 'vuels'}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = true,
  }
)
EOF
