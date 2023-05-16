-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      if not opts.ensure_installed then opts.ensure_installed = {} end
      require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",
        "bashls",
        "cssls",
        "cssmodules_ls",
        "dockerls",
        "eslint",
        "graphql",
        "html",
        "jsonls",
        "tsserver",
        "intelephense",
        "prismals",
        "sqlls",
        "tailwindcss",
        "lemminx",
        "yamlls",
        "pyright",
        "theme_check",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      if not opts.ensure_installed then opts.ensure_installed = {} end
      require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "prettierd",
        -- "prettier_eslint",
        -- "eslint_d",
        "stylua",
        "rustfmt",
        "phpcbf",
        "php-cs-fixer",
        -- "gofumpt",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      if not opts.ensure_installed then opts.ensure_installed = {} end
      require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "python",
        -- "chrome",
        "php",
        "bash",
        "js",
      })
    end,
  },
}
