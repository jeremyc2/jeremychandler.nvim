-- Helper function to find the nearest Git root
local function get_git_root()
  local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 or not git_root or git_root == '' then
    print 'Not inside a Git repository.'
    return nil
  end
  return git_root
end

-- Function to open the current file in VS Code within the Git project
local function open_in_vscode()
  local git_root = get_git_root()
  if not git_root then
    return
  end

  local file_path = vim.fn.expand '%:p'
  local line = vim.fn.line '.' -- Get the current line number
  local col = vim.fn.col '.' - 1 -- Get the current column number (0-indexed for VS Code)

  if file_path == '' then
    print 'No file is currently open.'
    return
  end

  -- Build the VS Code command
  local cmd = string.format('code --goto %s %s:%d:%d', git_root, file_path, line, col)

  print(cmd)

  local result = os.execute(cmd)

  if result ~= 0 then
    print 'Failed to open in VS Code. Is `code` CLI installed and in your PATH?'
  end
end

vim.api.nvim_create_user_command('VSCode', function()
  open_in_vscode()
end, {})
