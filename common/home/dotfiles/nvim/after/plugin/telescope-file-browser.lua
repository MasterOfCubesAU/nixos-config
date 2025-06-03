vim.keymap.set("n", "<space>pv", ":Telescope file_browser<CR>")

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>pv", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
}

require("telescope").load_extension "file_browser"
