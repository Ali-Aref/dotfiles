return {
	{
		"f-person/git-blame.nvim",
    lazy = true,
		-- event = "VeryLazy",
    cmd = { "GitBlameEnable" },
		opts = {
			enabled = false,
			display_virtual_text = true,
			-- available template options
			-- <author> <committer> <date> <committer-date> <summary> <sha>
			message_template = "<summary> - <date> - <committer>",
			-- date_format = "%m-%d-%Y %H:%M:%S",
			date_format = "%a, %H:%M %d:%m:%Y ",
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
			schedule_event = "CursorMoved", -- CursorMoved|CursorHold
			clear_event = "CursorMovedI", -- CursorMovedI|CursorHoldI
		},
	},
}
