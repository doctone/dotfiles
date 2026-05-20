require("nvchad.configs.lspconfig").defaults()

local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Override gd/gr mappings AFTER NvChad's LspAttach autocmd runs
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CustomLspMappings", { clear = true }),
  callback = function(args)
    local bufnr = args.buf

    -- Override gd to use Telescope for go-to-definition
    vim.keymap.set("n", "gd", function()
      require('telescope.builtin').lsp_definitions({
        jump_type = "never",
        show_line = false,
        fname_width = 40,
      })
    end, { buffer = bufnr, desc = "Go to definition (Telescope)" })

    -- Override gr to use Telescope for references
    vim.keymap.set("n", "gr", function()
      require('telescope.builtin').lsp_references({
        show_line = false,
        fname_width = 40,
      })
    end, { buffer = bufnr, desc = "LSP go to references" })

    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr, desc = "LSP go to implementation" })
    vim.keymap.set("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>", { buffer = bufnr, desc = "LSP document symbols" })
    vim.keymap.set("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { buffer = bufnr, desc = "LSP workspace symbols" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "LSP code action" })
  end,
})

-- Simple on_attach without mapping overrides (handled by autocmd above)
local on_attach = function(client, bufnr)
  -- NvChad's defaults() already sets up LspAttach autocmd, no need to call on_attach again
end

local lspconfig = require "lspconfig"

-- List of servers to configure
local servers = {
  "html",
  "cssls", 
  "ts_ls", -- TypeScript/JavaScript
  "pyright", -- Python
  "lua_ls", -- Lua
  "yamlls", -- YAML
  "jsonls", -- JSON
  "tailwindcss", -- TailwindCSS
  "bashls", -- Bash
  "eslint", -- ESLint
  "emmet_ls", -- Emmet
  "prismals", -- Prisma
  "terraformls", -- Terraform
}

-- Configure each server
for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
  
  -- Server-specific configurations
  if lsp == "ts_ls" then
    opts.init_options = {
      preferences = {
        disableSuggestions = true,
      },
    }
    opts.settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    }
  elseif lsp == "pyright" then
    opts.settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
          typeCheckingMode = "basic",
        },
      },
    }
  elseif lsp == "lua_ls" then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        telemetry = {
          enable = false,
        },
      },
    }
  elseif lsp == "yamlls" then
    opts.settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://json.schemastore.org/package.json"] = "/package.json",
          ["https://json.schemastore.org/tsconfig.json"] = "/tsconfig*.json",
        },
        validate = true,
        completion = true,
        hover = true,
      },
    }
  elseif lsp == "jsonls" then
    opts.settings = {
      json = {
        schemas = require("schemastore").json.schemas {
          ignore = {
            ".eslintrc",
            "package.json",
          },
        },
        validate = { enable = true },
      },
    }
  elseif lsp == "emmet_ls" then
    opts.filetypes = {
      "html",
      "typescriptreact",
      "javascriptreact",
      "css",
      "sass",
      "scss",
      "less",
      "svelte",
    }
  elseif lsp == "terraformls" then
    opts.filetypes = { "terraform", "tf" }
    opts.settings = {
      terraform = {
        format = {
          enable = true,
        },
        validate = {
          enable = true,
        },
      },
    }
  end
  
  lspconfig[lsp].setup(opts)
end
