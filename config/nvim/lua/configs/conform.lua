local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },
    
    -- Web technologies - use prettier instead of prettierd to avoid path issues
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    vue = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    
    -- Python
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_format" }
      else
        return { "isort", "black" }
      end
    end,
    
    -- Shell scripts
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
    
    -- Terraform
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    hcl = { "terraform_fmt" },
    
    -- Other languages will use LSP formatting if available
  },

  -- Enable format on save
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  
  -- Configure formatters
  formatters = {
    shfmt = {
      prepend_args = { "-i", "2" }, -- Use 2 spaces for indentation
    },
    
    -- Configure prettier to match VSCode settings
    prettier = {
      prepend_args = {
        "--print-width", "80",
        "--tab-width", "2",
        "--semi",
        "--single-quote=false",
        "--bracket-spacing",
        "--arrow-parens", "always",
      },
    },
    
  },
}

return options
