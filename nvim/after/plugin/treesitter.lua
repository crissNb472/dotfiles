local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then
	return
end

ts.setup {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
