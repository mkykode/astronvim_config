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
require("dap-vscode-js").setup {
  node_path = "/usr/local/bin/node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
}

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
    },
  }
end
