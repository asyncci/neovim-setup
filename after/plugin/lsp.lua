require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        'rust-analyzer',
        'gopls',
        'lua-language-server',
        'clangd',
        'codelldb',
        'pyright',
        'omnisharp'
    }
})

require('mason-lspconfig').setup()

--turn off inline error message
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = false
    }
)

local caps = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)

    --omnisharp
    if client.name == "omnisharp" then
        vim.keymap.set('n', '<space>D', require('omnisharp_extended').lsp_definitions, opts)
        client.server_capabilities.semanticTokensProvider = nil
    else
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    end

    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local stdOpts = {
    capabilities = caps,
    on_attach = on_attach
}
local omnisharpOpts = {
    handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
    },
    capabilities = caps,
    on_attach = on_attach
}
local rust_opts = {
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
    capabilities = caps,
    on_attach = on_attach
}
local servers = {
    rust_analyzer = rust_opts,
    omnisharp = omnisharpOpts,
    clangd = stdOpts,
    pyright = stdOpts,
    lua_ls = stdOpts,
}

for lsp, opts in pairs(servers) do
    lspconfig[lsp].setup(opts)
end
