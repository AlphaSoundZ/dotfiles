require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("i", "ciw", "<ESC>ciw")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
local M = {}

M.general = {
  n = {
    ["<leader>X"] = { "<C-w>", "Close Window" },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.lsp = {
  n = {
    ["<leader>a"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP Code Action",
      { noremap = true, silent = true },
    },
  },
}

M.telescope = {
  n = {
    ["<leader>sR"] = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Git Worktrees" },
    ["<leader>sr"] = {
      "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
      "Create Git Worktree",
    },
  },
}

M.dap = {
  n = {
    ["<leader>dc"] = { "<cmd>lua require('dap').continue()<CR>", "DAP Continue" },
    ["<leader>db"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "DAP Toggle Breakpoint" },
    ["<leader>dr"] = { "<cmd>lua require('dap').repl.toggle()<CR>", "DAP Toggle Repl" },
    ["<leader>ds"] = { "<cmd>lua require('dap').step_over()<CR>", "DAP Step Over" },
    ["<leader>di"] = { "<cmd>lua require('dap').step_into()<CR>", "DAP Step Into" },
    ["<leader>do"] = { "<cmd>lua require('dap').step_out()<CR>", "DAP Step Out" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.rest = {
  n = {
    ["<leader>rr"] = { "<cmd>lua require('rest-nvim').run()<CR>", "Run Rest Command" },
    ["<leader>rp"] = { "<cmd>lua require('rest-nvim').preview()<CR>", "Preview Rest Command" },
    ["<leader>rl"] = { "<cmd>lua require('rest-nvim').last()<CR>", "Last Rest Command" },
  },
}

M.todo_comments = {
  n = {
    ["<leader>tt"] = { "<cmd>TodoTelescope<CR>", "Search for TODOs" },
  },
}

local map = vim.keymap.set

for name, maps in pairs(M) do
  for mode, data in pairs(maps) do
    for key, val in pairs(data) do
      map(mode, key, val[1], { desc = val[2] })
    end
  end
end

return M
