local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("没有找到 dashboard")
	return
end

local function footer()
	local datetime = os.date(" %Y-%m-%d") .. "  -  "
	local author = " " .. os.getenv("USER") .. "  -  "
	-- vim.notify(packer_plugins)
	local total_plugins = " " .. #vim.tbl_keys(packer_plugins) .. " plugins" .. "  -  "
	local version = vim.version()
	local nvim_version_info = " v" .. version.major .. "." .. version.minor .. "." .. version.patch

	return author .. datetime .. total_plugins .. nvim_version_info
end

db.custom_footer = {
	"",
	footer(),
	"",
	"https://github.com/cjq99419/nvim",
}

db.custom_center = {
	{
		icon = "	     ",
		desc = "Projects                            ",
		action = "Telescope projects",
	},
	{
		icon = "	     ",
		desc = "Recently files                      ",
		action = "Telescope oldfiles",
	},
	{
		icon = "	     ",
		desc = "Edit keybindings                    ",
		action = "edit ~/.config/nvim/lua/keybindings.lua",
	},
	{
		icon = "	     ",
		desc = "Edit Projects                       ",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
	{
		icon = "	     ",
		desc = "Find File                           ",
		action = "Telescope find_files"
	},
}

db.custom_header = {
	[[ ██████╗  █████╗ ██╗██████╗ ██╗   ██╗       ██████╗     ██╗ ██████╗ ███╗   ██╗██████╗  ]],
	[[ ██╔══██╗██╔══██╗██║██╔══██╗██║   ██║      ██╔════╝     ██║██╔═══██╗████╗  ██║██╔══██╗ ]],
	[[ ██████╔╝███████║██║██║  ██║██║   ██║█████╗██║          ██║██║   ██║██╔██╗ ██║██████╔╝ ]],
	[[ ██╔══██╗██╔══██║██║██║  ██║██║   ██║╚════╝██║     ██   ██║██║▄▄ ██║██║╚██╗██║██╔══██╗ ]],
	[[ ██████╔╝██║  ██║██║██████╔╝╚██████╔╝      ╚██████╗╚█████╔╝╚██████╔╝██║ ╚████║██████╔╝ ]],
	[[ ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝  ╚═════╝        ╚═════╝ ╚════╝  ╚══▀▀═╝ ╚═╝  ╚═══╝╚═════╝  ]],
	[[         ____________________________________________________	                ]],
	[[        /                                                    \                ]],
	[[       |    _____________________________________________     |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |  /home/chenjingqiao:\> _                    |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |                                             |    |               ]],
	[[       |   |_____________________________________________|    |               ]],
	[[       |                                                      |               ]],
	[[        \_____________________________________________________/               ]],
	[[               \_______________________________________/                      ]],
	[[            _______________________________________________                   ]],
	[[         _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_                ]],
	[[      _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_             ]],
	[[   _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_          ]],
	[[_-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_       ]],
}


--db.section.footer.val = footer()
--db.section.footer.opts.hl = "Constant"
