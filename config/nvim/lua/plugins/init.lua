return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- format on save enabled
    opts = require "configs.conform",
  },

  -- Mason for managing LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        -- LSP servers
        "typescript-language-server",
        "pyright",
        "lua-language-server",
        "yaml-language-server",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "bash-language-server",
        "eslint-lsp",
        "emmet-ls",
        "prisma-language-server",
        "terraform-ls",

        -- Formatters
        "prettier",
        "black",
        "isort",
        "stylua",
        "shfmt",
        "terraform_fmt",

        -- Linters
        "ruff",
        "shellcheck",
        "yamllint",

        -- DAP servers (for debugging)
        "js-debug-adapter",
        "debugpy",

        -- Additional useful tools
        "markdownlint",
        "prettierd", -- Faster prettier
        "fixjson",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Custom command to install all tools
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      auto_install = true,
    },
  },

  -- JSON schemas
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/schemastore.nvim",
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- Telescope with custom configuration
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      return require "configs.telescope"
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Core Neovim
        "vim",
        "lua",
        "vimdoc",
        "luadoc",
        "query",

        -- Web technologies
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "json",
        "yaml",
        "toml",

        -- Backend languages
        "python",
        "bash",
        "fish",
        "sql",

        -- Configuration and markup
        "markdown",
        "markdown_inline",
        "dockerfile",
        "gitignore",
        "gitcommit",
        "diff",
        "regex",
        "hcl",
        "terraform",

        -- Additional useful parsers
        "comment",
        "jsdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<C-backspace>",
        },
      },
    },
  },

  -- Avante (AI assistant)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
      provider = "claude",
      providers = {
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-opus-4-6",
          api_key_name = "ANTHROPIC_API_KEY",
          timeout = 30000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "stevearc/dressing.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },

  -- LazyGit integration
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git blame inline
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
        virt_text_pos = "eol",
      },
    },
  },

  -- Override nvim-tree width
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        width = 45,
        side = "left",
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {},
      },
    },
  },
}
