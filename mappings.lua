-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- this is useful for naming menus
    -- quick save
    ["<C-s>"] = { ":w!<CR>", desc = "Save File" }, -- change description but the same command
    ["<C-q>"] = { ":wq!<CR>", desc = "Save and Quit" },
    -- ["p"] = { '"_dP', desc = "Paste without copy" },
  },
  v = {
    ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
    ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
