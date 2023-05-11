return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup { --[[ your config ]]
      }
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function() require("todo-comments").setup {} end,
  },
  {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup {} end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup {
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
  },
  -- {
  --   "mxsdev/nvim-dap-vscode-js",
  --   requires = { "mfussenegger/nvim-dap" },
  --   config = function(config)
  --     config.dap.adapters.vscode = {
  --       type = "executable",
  --       command = "node",
  --       args = { os.getenv "HOME" .. "~/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
  --     }
  --
  --     config.dap.configurations.javascript = {
  --       {
  --         type = "vscode",
  --         request = "launch",
  --         program = "${file}",
  --         cwd = vim.fn.getcwd(),
  --         sourceMaps = true,
  --         protocol = "inspector",
  --         console = "integratedTerminal",
  --       },
  --     }
  --   end,
  -- },

  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     require("dapui").setup()
  --     require("dapui").open()
  --     dap.adapters.chrome = {
  --       type = "executable",
  --       command = "node",
  --       args = { os.getenv("HOME") .. "",
  --       },
  --     }
  --
  --   end,
  -- },
}
