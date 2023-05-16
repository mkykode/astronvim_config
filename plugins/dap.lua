return {
  {
    "mxsdev/nvim-dap-vscode-js",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      {
        "microsoft/vscode-js-debug",
        lazy = true,
        build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
      },
    },
    config = function()
      local dap = require "dap"
      dap.set_log_level "DEBUG"
      local dap_js = require "dap-vscode-js"
      -- vscode-js configuration for debugging support
      local DEBUG_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"
      dap_js.setup {
        node_path = "node",
        debugger_path = DEBUG_PATH,
        adapters = { "pwa-node", "node-terminal", "pwa-chrome" }, -- which adapters to register in nvim-dap
      }
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "launch file (" .. language .. ")",
            program = "${file}",
            cwd = "${workspacefolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "attach (" .. language .. ")",
            processid = require("dap.utils").pick_process,
            cwd = "${workspacefolder}",
          },
        }
      end
      for _, language in ipairs { "typescriptreact", "javascriptreact" } do
        require("dap").configurations[language] = {
          {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
          },
          {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:3000",
            browserLaunchLocation = "workspace",
          },
        }
      end
    end,
  },
}
