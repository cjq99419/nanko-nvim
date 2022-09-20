local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "o", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-u>", ":vertical resize -2<CR>", opt)
map("n", "<C-p>", ":vertical resize +2<CR>", opt)
-- 上下比例
map("n", "<C-i>", ":resize +2<CR>", opt)
map("n", "<C-o>", ":resize -2<CR>", opt)
-- 等比例
map("n", "<C-y>", "<C-w>=", opt)
-- 设置终端开启
map("n", "ht", ":sp | terminal<CR> | a", opt)
map("n", "vt", ":vsp | terminal<CR> | a", opt)

map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)


-- 上下滚动浏览
map("n", "<S-j>", "4j", opt)
map("n", "<S-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动20行，默认移动半屏
map("n", "<S-h>", "20j", opt)
map("n", "<S-l>", "20k", opt)

-- 插件快捷键
local pluginKeys = {}

-- nvim-tree
-- ctrl + m 键打开关闭tree
map("n", "tr", ":NvimTreeToggle<CR>", opt)

-- bufferline
-- 左右Tab切换
map("n", "<S-u>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<S-i>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<S-o>", ":Bdelete!<CR>", opt)
map("n", "<leader>cr", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>cl", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>cp", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-g>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
	i = {
		-- 上下移动
		["<S-j>"] = "move_selection_next",
		["<S-k>"] = "move_selection_previous",
		["<Down>"] = "move_selection_next",
		["<Up>"] = "move_selection_previous",
		-- 历史记录
		["<S-n>"] = "cycle_history_next",
		["<S-p>"] = "cycle_history_prev",
		-- 关闭窗口
		["<S-c>"] = "close",
		-- 预览窗口上下滚动
		["<S-h>"] = "preview_scrolling_up",
		["<S-l>"] = "preview_scrolling_down",
	},
}

pluginKeys.cmp = function(cmp)
	return {
		-- 出现补全
		["<C-,>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		-- 取消
		["<C-.>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close()
		}),
		-- 上一个
		["<S-k>"] = cmp.mapping.select_prev_item(),
		-- 下一个
		["<S-j>"] = cmp.mapping.select_next_item(),
		-- 确认
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace
		}),
		-- 如果窗口内容太多，可以滚动
		["<S-l>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<S-h>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	}
end

pluginKeys.mapLSP = function(mapbuf)
	-- rename
	--[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	-- code action
	--[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	-- go xx
	--[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
	mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
	--[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	--[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	--[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
	-- 未用
	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end


-- 列表快捷键
pluginKeys.nvimTreeList = {
	-- 打开文件或文件夹
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- 分屏打开文件
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- 显示隐藏文件
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- 文件操作
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
return pluginKeys
