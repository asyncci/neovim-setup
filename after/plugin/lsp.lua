local ensure_installed = {
    'lemminx',
    'gopls',
    'rust-analyzer',
    'lua-language-server',
    'clangd',
    'omnisharp',
    'pyright',
    'tss',
}
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = ensure_installed
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

local inlayHints = require("inlay-hints");

inlayHints.setup({
    renderer = "inlay-hints/render/eol",
});

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    inlayHints.on_attach(client, bufnr)
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

    if client.name == "clangd" then
        vim.opt.tabstop = 2
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end

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
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format({ async = true })
        vim.cmd("w")
    end, bufopts)
end

local stdOpts = {
    capabilities = caps,
    on_attach = on_attach
}


local clangdOpts = {
    capabilities = caps,
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern('.git'),
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

local zls_opts = {
    capabilities = caps,
    on_attach = on_attach,
}
--[[
---rust
local rt = require("rust-tools")
local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

rt.setup({
    dap = {
        adapter = {
            type = "executable",
            command = "/usr/bin/lldb-vscode",
            name = "rt_lldb",
        },
    },
    server = {
        capabilities = caps,
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            on_attach(client, bufnr)
        end
    },
    tools = {
        hover_actions = {
            auto_focus = true,
        },
    },
})

-----
--]]

local servers = {
    rust_analyzer = rust_opts,
    omnisharp = omnisharpOpts,
    clangd = clangdOpts,
    lua_ls = stdOpts,
    cmake = stdOpts,
    gopls = stdOpts,
    zls = zls_opts,
    lemminx = stdOpts,
    pyright = stdOpts ,
    tsserver = stdOpts,
}

for lsp, opts in pairs(servers) do
    lspconfig[lsp].setup(opts)
end
