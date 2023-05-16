-- return {
--   "mfussenegger/nvim-dap",
--   dependencies = {
--     {
--       "mxsdev/nvim-dap-vscode-js",
--       opts = { debugger_cmd = { "js-debug-adapter" }, adapters = { "pwa-node" } },
--     },
--     { "theHamsta/nvim-dap-virtual-text", config = true },
--   },
--   config = function()
--     local dap = require "dap"
--
--     local attach_node = {
--       type = "pwa-node",
--       request = "attach",
--       name = "Attach",
--       processId = require("dap.utils").pick_process,
--       cwd = "${workspaceFolder}",
--     }
--
--     dap.configurations.javascript = {
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--       },
--       attach_node,
--     }
--     dap.configurations.typescript = {
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--         runtimeExecutable = "ts-node",
--         sourceMaps = true,
--         protocol = "inspector",
--         console = "integratedTerminal",
--         resolveSourceMapLocations = {
--           "${workspaceFolder}/dist/**/*.js",
--           "${workspaceFolder}/**",
--           "!**/node_modules/**",
--         },
--       },
--       attach_node,
--     }
--   end,
-- }
-- { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
-- {
--   "microsoft/vscode-js-debug",
--   opt = true,
--   run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
-- }
-- require("js-debug-adapter").setup {
--   node_path = "/usr/local/bin/node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
--   -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
--   -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
--   -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
--   -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
--   log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
-- }
--
-- for _, language in ipairs { "typescript", "javascript" } do
--   require("dap").configurations[language] = {
--     -- see below
--     {
--       {
--         type = "pwa-node",
--         request = "launch",
--         name = "Launch file",
--         program = "${file}",
--         cwd = "${workspaceFolder}",
--       },
--       {
--         type = "pwa-node",
--         request = "attach",
--         name = "Attach",
--         processId = require("dap.utils").pick_process,
--         cwd = "${workspaceFolder}",
--       },
--     },
--   }
-- end
-- setup adapters
-- require("dap-vscode-js").setup {
--   debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
--   debugger_cmd = { "js-debug-adapter" },
--   adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
-- }
--
-- local dap = require "dap"
--
-- -- custom adapter for running tasks before starting debug
-- local custom_adapter = "pwa-node-custom"
-- dap.adapters[custom_adapter] = function(cb, config)
--   if config.preLaunchTask then
--     local async = require "plenary.async"
--     local notify = require("notify").async
--
--     async.run(function()
--       ---@diagnostic disable-next-line: missing-parameter
--       notify("Running [" .. config.preLaunchTask .. "]").events.close()
--     end, function()
--       vim.fn.system(config.preLaunchTask)
--       config.type = "pwa-node"
--       dap.run(config)
--     end)
--   end
-- end
--
-- -- language config
-- for _, language in ipairs { "typescript", "javascript" } do
--   dap.configurations[language] = {
--     {
--       name = "Launch",
--       type = "pwa-node",
--       request = "launch",
--       program = "${file}",
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       sourceMaps = true,
--       skipFiles = { "<node_internals>/**" },
--       protocol = "inspector",
--       console = "integratedTerminal",
--     },
--     {
--       name = "Attach to node process",
--       type = "pwa-node",
--       request = "attach",
--       rootPath = "${workspaceFolder}",
--       processId = require("dap.utils").pick_process,
--     },
--     {
--       name = "Debug Main Process (Electron)",
--       type = "pwa-node",
--       request = "launch",
--       program = "${workspaceFolder}/node_modules/.bin/electron",
--       args = {
--         "${workspaceFolder}/dist/index.js",
--       },
--       outFiles = {
--         "${workspaceFolder}/dist/*.js",
--       },
--       resolveSourceMapLocations = {
--         "${workspaceFolder}/dist/**/*.js",
--         "${workspaceFolder}/dist/*.js",
--       },
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       sourceMaps = true,
--       skipFiles = { "<node_internals>/**" },
--       protocol = "inspector",
--       console = "integratedTerminal",
--     },
--     {
--       name = "Compile & Debug Main Process (Electron)",
--       type = custom_adapter,
--       request = "launch",
--       preLaunchTask = "npm run build-ts",
--       program = "${workspaceFolder}/node_modules/.bin/electron",
--       args = {
--         "${workspaceFolder}/dist/index.js",
--       },
--       outFiles = {
--         "${workspaceFolder}/dist/*.js",
--       },
--       resolveSourceMapLocations = {
--         "${workspaceFolder}/dist/**/*.js",
--         "${workspaceFolder}/dist/*.js",
--       },
--       rootPath = "${workspaceFolder}",
--       cwd = "${workspaceFolder}",
--       sourceMaps = true,
--       skipFiles = { "<node_internals>/**" },
--       protocol = "inspector",
--       console = "integratedTerminal",
--     },
--   }
-- end
return {
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    -- requires = { "mfussenegger/nvim-dap" },
    dependencies = {
      "microsoft/vscode-js-debug",
      "mfussenegger/nvim-dap",
    },
    opts = {
      node_path = "/usr/local/bin/node",
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- require("dapui").setup()
      for _, language in ipairs { "typescript", "javascript" } do
        require("dap").configurations[language] = {
          -- see below
          {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-chrome",
              request = "launch",
              name = "Launch Chrome",
              url = "http://localhost:3000",
              webRoot = "${workspaceFolder}",
              sourceMaps = true,
              skipFiles = { "<node_internals>/**" },
              preLaunchTask = "yarn run dev",
            },
          },
        }
      end
    end,
  },
}
