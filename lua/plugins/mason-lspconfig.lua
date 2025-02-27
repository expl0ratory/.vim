return {
    'williamboman/mason-lspconfig.nvim',
    name = 'mason-lspconfig',
    dependencies = {'mason.nvim'},
    opts = {
        automatic_installation = true,
    },
    config = function()
        local nvim_lsp = require('lspconfig')
        local util = require('lspconfig/util')
        local path = util.path

        local function get_python_path(workspace)
          -- Use activated virtualenv.
          if vim.env.VIRTUAL_ENV then
            return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
          end

          -- Find and use virtualenv in workspace directory.
          for _, pattern in ipairs({'*', '.*'}) do
            local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
            if match ~= '' then
              return path.join(path.dirname(match), 'bin', 'python')
            end
          end

          -- Fallback to system Python.
          return exepath('python3') or exepath('python') or 'python'
        end

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
          local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
          -- Mappings.
          local opts = { noremap=true, silent=true }

          -- See `:help vim.lsp.*` for documentation on any of the below functions
          buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
          buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
          buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
          buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
          --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
          --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
          --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        --  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
          buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        --  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        --  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
          buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
          buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
          buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
          buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
          buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

        end

        nvim_lsp.gopls.setup {
            cmd = {"gopls", "serve"},
            filetypes = {"go", "gomod"},
            root_dir = util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
              },
            },
            on_attach = on_attach,
        }

        -- Use a loop to conveniently call 'setup' on multiple servers and
        -- map buffer local keybindings when the language server attaches
        --local servers = { "pylsp", "ts_ls", "gopls" }
        --for _, lsp in ipairs(servers) do
        --  nvim_lsp[lsp].setup {
        --    on_attach = on_attach,
        --    flags = {
        --      debounce_text_changes = 150,
        --    },
        --    cmd_env = {
        --      VIRTUAL_ENV = "$HOME/Code/cjdev/services/cratejoy/venv"
        --    }
        --  }
        --end

        nvim_lsp.pyright.setup({
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            cmd_env = {
                VIRTUAL_ENV = "$HOME/Code/cjdev/services/cratejoy/venv"
            },
            before_init = function(_, config)
                config.settings.python.pythonPath = get_python_path(config.root_dir)
            end
        })

        -- function go_org_imports(wait_ms)
        --     local params = vim.lsp.util.make_range_params()
        --     params.context = {only = {"source.organizeImports"}}
        --     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
        --     for cid, res in pairs(result or {}) do
        --       for _, r in pairs(res.result or {}) do
        --         if r.edit then
        --           local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        --           vim.lsp.util.apply_workspace_edit(r.edit, enc)
        --         end
        --       end
        --     end
        -- end

    end
}
