local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }


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
map("n", "<S-h>", "<C-w>h", opt)
map("n", "<S-j>", "<C-w>j", opt)
map("n", "<S-k>", "<C-w>k", opt)
map("n", "<S-l>", "<C-w>l", opt)


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
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动20行，默认移动半屏
map("n", "<C-h>", "20j", opt)
map("n", "<C-l>", "20k", opt)

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
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- 全局搜索
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
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
