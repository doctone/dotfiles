local actions = require("telescope.actions")

return {
  defaults = {
    -- Ripgrep arguments for better performance
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob=!**/.git/*',
      '--glob=!**/node_modules/*',
      '--glob=!**/dist/*',
      '--glob=!**/build/*',
      '--glob=!**/.next/*',
      '--glob=!**/coverage/*',
      '--glob=!**/*.min.js',
      '--glob=!**/*.min.css',
    },
    -- Layout and display options
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.95,
      height = 0.85,
      preview_cutoff = 120,
    },
    sorting_strategy = "ascending",
    winblend = 0,
    -- Show full file paths
    path_display = { "smart" },
    -- Truncate long file names but keep them readable
    dynamic_preview_title = true,
    mappings = {
      i = {
        -- CMD+Enter to open in horizontal split (may not work in all terminals)
        ["<D-CR>"] = actions.select_horizontal,
        -- Alternative: Ctrl+x for horizontal split (more reliable)
        ["<C-x>"] = actions.select_horizontal,
        -- Alternative: Ctrl+s for horizontal split
        ["<C-s>"] = actions.select_horizontal,
        -- Keep default vertical split
        ["<C-v>"] = actions.select_vertical,
        -- Keep default tab
        ["<C-t>"] = actions.select_tab,
      },
      n = {
        -- Same mappings for normal mode
        ["<D-CR>"] = actions.select_horizontal,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = { "rg", "--files", "--hidden", "--no-ignore", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*", "--glob", "!**/dist/*", "--glob", "!**/.next/*" },
      path_display = { "truncate" },
    },
    live_grep = {
      additional_args = function()
        return { 
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/node_modules/*",
          "--glob=!**/dist/*",
          "--glob=!**/build/*",
          "--glob=!**/.next/*",
          "--glob=!**/coverage/*",
          "--glob=!**/*.min.js",
          "--glob=!**/*.min.css",
          "--glob=!**/package-lock.json",
          "--glob=!**/yarn.lock",
          "--glob=!**/pnpm-lock.yaml",
        }
      end,
    },
    lsp_references = {
      show_line = false,
      path_display = { "shorten" },
    },
    lsp_implementations = {
      show_line = false, 
      path_display = { "shorten" },
    },
    lsp_document_symbols = {
      symbol_width = 50,
    },
    lsp_dynamic_workspace_symbols = {
      symbol_width = 50,
    },
  },
  extensions = {},
}
