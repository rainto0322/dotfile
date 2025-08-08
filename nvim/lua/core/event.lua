-- Save file prompt
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    vim.notify("File written successfully" .. vim.fn.expand("%"), vim.log.levels.INFO, {
      title = vim.fn.expand("%:t"),
      icon = "󰳻"
    })
  end
})