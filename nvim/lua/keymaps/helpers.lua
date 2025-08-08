local help = {}

help.DeleteBuffer = function()
  if vim.bo.modified then
    local choice = vim.fn.input("File has unsaved changes. Delete anyway? [y/N] ")
    if choice:lower() == "y" then
      vim.cmd("write")
    end
  end
  vim.cmd("bd!")
end

help.DeleteBufferOther = function()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.cmd("bd! " .. buf)
    end
  end
end

help.ReplaceAll = function()
  local mode = vim.fn.mode()
  local word
  -- Save the current text in a register
  if mode == "v" or mode == "V" then
    vim.cmd('normal! "xy')
    word = vim.fn.getreg('x')
    vim.fn.setreg('"', vim.fn.getreg('"'), vim.fn.getregtype('"'))
  else
    -- Get word where the cursor located
    word = vim.fn.expand('<cword>')
  end

  if not word or word == "" then
    vim.notify("No word selected or under cursor.", vim.log.levels.ERROR)
    return
  end

  local replacement = vim.fn.input(word .. "\nReplace with:")
  if replacement == "" then return end

  word = word:gsub('\n', '\\n')
  vim.cmd(string.format(
    "%%s/%s/%s/g",
    vim.fn.escape(word, "/"),
    vim.fn.escape(replacement, "/")
  ))
end

return help
