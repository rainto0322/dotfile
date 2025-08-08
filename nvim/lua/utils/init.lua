local utils = {}

function utils.debug(Message)
  vim.api.nvim_err_writeln(Message)
  vim.notify(Message)
end

function utils.toString(t)
  local result = {}
  for k, v in pairs(t) do
    table.insert(result, tostring(k) .. "=" .. tostring(v))
  end
  return "{" .. table.concat(result, ", ") .. "}"
end

return utils
