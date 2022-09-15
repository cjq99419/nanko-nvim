local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  "https://github.com/cjq99419/nvim",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    icon = "  ",
    desc = "Find File                           ",
    action = "<cmd>Telescope find_files<CR>"
  },
  {
    icon = "  ",
    desc = "File Browser                        ",
    action = "<cmd>Telescope file_browser<CR>"
  },
  {
    icon = "  ",
    desc = "Configuration                       ",
    action = "<cmd>e $MYVIMRC|OpenTree<CR>"
  },
  {
    icon = "  ",
    desc = "Update Plugins                      ",
    action = "<cmd>PackerUpdate<CR>"
  },
}

db.custom_header = {
  [[██████╗  █████╗ ██╗██████╗ ██╗   ██╗]],
  [[██╔══██╗██╔══██╗██║██╔══██╗██║   ██║]],
  [[██████╔╝███████║██║██║  ██║██║   ██║]],
  [[██╔══██╗██╔══██║██║██║  ██║██║   ██║]],
  [[██████╔╝██║  ██║██║██████╔╝╚██████╔╝]],
  [[╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝ ]],
}

local function footer()
  local datetime = os.date(" %Y-%m-%d") .. "  -  "
  local author = " " .. os.getenv("USER") .. "  -  "
  local total_plugins = " " .. #vim.tbl_keys(packer_plugins) .. " plugins" .. "  -  "
  local version = vim.version()
  local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch

  return author .. datetime .. total_plugins .. nvim_version_info
end

--db.section.footer.val = footer()
--db.section.footer.opts.hl = "Constant"
