-- Project-specific colorscheme detection
local M = {}

-- Default fallback colorscheme
M.default_colorscheme = "catppuccin-mocha"

-- Possible config file names to look for in project root
local config_files = {
  ".nvimrc.lua",
  ".nvim.lua", 
  "nvim-config.lua",
  ".vimrc.lua"
}

-- Function to find project root (looks for common indicators)
local function find_project_root()
  local current_dir = vim.fn.getcwd()
  local indicators = {
    ".git",
    "package.json",
    "Cargo.toml",
    "go.mod",
    "pyproject.toml",
    "requirements.txt",
    "Makefile",
    "CMakeLists.txt",
    ".project-root"
  }
  
  local function check_dir(dir)
    for _, indicator in ipairs(indicators) do
      if vim.fn.isdirectory(dir .. "/" .. indicator) == 1 or 
         vim.fn.filereadable(dir .. "/" .. indicator) == 1 then
        return dir
      end
    end
    return nil
  end
  
  -- Start from current directory and go up
  local dir = current_dir
  while dir ~= "/" do
    local root = check_dir(dir)
    if root then
      return root
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  
  return current_dir -- fallback to current directory
end

-- Function to load project-specific config
local function load_project_config(project_root)
  for _, config_file in ipairs(config_files) do
    local config_path = project_root .. "/" .. config_file
    if vim.fn.filereadable(config_path) == 1 then
      -- Try to load the config file
      local success, config = pcall(dofile, config_path)
      if success and type(config) == "table" then
        return config
      end
    end
  end
  return nil
end

-- Function to apply colorscheme safely
local function apply_colorscheme(colorscheme)
  if not colorscheme or colorscheme == "" then
    return false
  end
  
  local success, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if success then
    print("Applied colorscheme: " .. colorscheme)
    return true
  else
    print("Failed to apply colorscheme: " .. colorscheme)
    return false
  end
end

-- Main function to detect and apply project colorscheme
function M.setup()
  local project_root = find_project_root()
  local project_config = load_project_config(project_root)
  
  if project_config and project_config.colorscheme then
    local success = apply_colorscheme(project_config.colorscheme)
    if not success then
      -- Fallback to default if project colorscheme fails
      apply_colorscheme(M.default_colorscheme)
    end
  else
    -- No project config found, use default
    apply_colorscheme(M.default_colorscheme)
  end
end

-- Function to create a project config file
function M.create_project_config(colorscheme)
  local project_root = find_project_root()
  local config_path = project_root .. "/.nvimrc.lua"
  
  local config_content = string.format([[-- Neovim project configuration
return {
  colorscheme = "%s"
}
]], colorscheme or "default")
  
  local file = io.open(config_path, "w")
  if file then
    file:write(config_content)
    file:close()
    print("Created project config at: " .. config_path)
    return true
  else
    print("Failed to create project config at: " .. config_path)
    return false
  end
end

-- Command to set colorscheme for current project
vim.api.nvim_create_user_command("ProjectColorscheme", function(opts)
  local colorscheme = opts.args
  if colorscheme == "" then
    print("Usage: :ProjectColorscheme <colorscheme_name>")
    return
  end
  
  -- Test if colorscheme exists
  local success = apply_colorscheme(colorscheme)
  if success then
    M.create_project_config(colorscheme)
  end
end, {
  nargs = 1,
  complete = function()
    -- Get available colorschemes
    return vim.fn.getcompletion("", "color")
  end
})

-- Command to show current project info
vim.api.nvim_create_user_command("ProjectInfo", function()
  local project_root = find_project_root()
  local project_config = load_project_config(project_root)
  
  print("Project root: " .. project_root)
  if project_config and project_config.colorscheme then
    print("Project colorscheme: " .. project_config.colorscheme)
  else
    print("No project colorscheme configured")
    print("Default colorscheme: " .. M.default_colorscheme)
  end
end, {})

return M
