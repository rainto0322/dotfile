local map_options = {}
function map_options:new()
  local instance = {
    cmd = "",
    options = {
      noremap = false,
      silent = false,
      expr = false,
      nowait = false,
      callback = nil,
      desc = "",
    }
  }
  setmetatable(instance, self)
  self.__index = self
  return instance
end

function map_options:noremap()
  self.options.noremap = true
  return self
end

function map_options:silent()
  self.options.silent = true
  return self
end

function map_options:nowait()
  self.options.nowait = true
  return self
end

function map_options:expr()
  self.options.expr = true
  return self
end

---@param desction string
function map_options:desc(desction)
  self.options.desc = desction
  return self
end

local bind = {}

function bind.map(command)
  local map = map_options:new()
  map.cmd = command
  return map
end

function bind.cmd(command)
  local map = map_options:new()
  map.cmd = ("<Cmd>%s<CR>"):format(command)
  return map
end

function bind.callback(func)
  local map = map_options:new()
  map.cmd = ''
  map.options.callback = func
  return map
end

function bind.load_mapping(mapping)
  for key, value in pairs(mapping) do
    local modes, keymap = key:match("([^|]*)|?(.*)")
    if type(value) == "table" then
      for _, mode in ipairs(vim.split(modes, "")) do
        local rhs = value.cmd
        local options = value.options
        vim.api.nvim_set_keymap(mode, keymap, rhs, options)
      end
    end
  end
end

return bind
