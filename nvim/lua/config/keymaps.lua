-- Set leader key
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 🧭 Navigation & File Tree
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>fe", "<cmd>Neotree focus<CR>", { desc = "Focus file explorer" })

-- 🔍 Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Find diagnostics" })
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in buffer" })

-- 🦀 Rustaceanvim (Rust specific)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(args)
    local buf = args.buf
    local bmap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
    end
    bmap("n", "<leader>rr", function()
      vim.cmd("RustLsp runnables")
    end, "Rust: Runnables")
    bmap("n", "<leader>re", function()
      vim.cmd("RustLsp explainError")
    end, "Rust: Explain Error")
    bmap("n", "<leader>rm", function()
      vim.cmd("RustLsp expandMacro")
    end, "Rust: Expand Macro")
    bmap("n", "<leader>rf", vim.lsp.buf.format, "Rust: Format File")
    bmap("n", "<leader>rp", function()
      vim.cmd("RustLsp parentModule")
    end, "Rust: Parent Module")
    bmap("n", "<leader>rt", function()
      vim.cmd("RustLsp testables")
    end, "Rust: Testables")
    bmap("n", "<leader>rd", function()
      vim.cmd("RustLsp renderDiagnostic")
    end, "Rust: Render Diagnostics")
  end,
})

-- ⚙️ LSP
map("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover info" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })

-- 🧪 DAP
map("n", "<leader>dd", function()
  require("dap").continue()
end, { desc = "Start Debugger" })
map("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint" })
map("n", "<leader>do", function()
  require("dap").step_over()
end, { desc = "Step Over" })
map("n", "<leader>di", function()
  require("dap").step_into()
end, { desc = "Step Into" })
map("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "DAP REPL" })
map("n", "<leader>dq", function()
  require("dap").terminate()
end, { desc = "Stop Debugger" })

-- 🚨 Trouble Diagnostics
map("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Toggle Trouble" })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Document Diagnostics" })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix List" })

-- ✅ TODO Comments (lazy loaded)
map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next TODO" })
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous TODO" })
map("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "TODOs (Trouble)" })
map("n", "<leader>st", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs" })

-- 🤖 Codeium (AI completion)
vim.g.codeium_disable_bindings = 1
map("i", "<C-g>", function()
  return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Codeium: Accept" })
map("i", "<C-;>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, desc = "Codeium: Next suggestion" })
map("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, desc = "Codeium: Prev suggestion" })
map("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, { expr = true, desc = "Codeium: Clear suggestion" })

-- 🧼 Formatter (conform.nvim)
map("n", "<leader>fF", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })
map("v", "<leader>fF", function()
  require("conform").format({ async = true })
end, { desc = "Format selection" })

-- 📌 Harpoon
map("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Harpoon: Add file" })
map("n", "<leader>hh", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Harpoon: Toggle menu" })
map("n", "<leader>h1", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Harpoon: Go to file 1" })
map("n", "<leader>h2", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Harpoon: Go to file 2" })
map("n", "<leader>h3", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Harpoon: Go to file 3" })
map("n", "<leader>h4", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Harpoon: Go to file 4" })

-- 📄 Filetype-specific keymaps
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    map("n", "<leader>pm", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dockerfile",
  callback = function()
    map("n", "<leader>cb", "<cmd>!docker build -t my-image .<CR>", { desc = "Build Docker Image" })
  end,
})

-- 💾 Save & Quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all" })

-- 🪟 Window / Buffer
map("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizontal split" })

-- 🧠 Insert & Terminal
map("i", "jj", "<Esc>", { desc = "Escape insert mode" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Git
vim.keymap.set("n", "<leader>gs", "<cmd>Neotree git_status toggle<CR>", { desc = "Neo-tree: Toggle Git Status" })
