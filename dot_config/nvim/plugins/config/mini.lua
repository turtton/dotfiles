-- ===== quick comment out ======
require('mini.comment').setup({
	mappings = {
		comment = 'gc',
		comment_line = 'gC',
		textobject = '',
	}
})
-- ===== hilighting under coursor words ====
require('mini.cursorword').setup({
	delay = 100,
})
-- ===== fuzzy finder =======
require('mini.fuzzy').setup({
	cutoff = 50
})
-- ===== indent scope ======
require('mini.indentscope').setup({})
-- ===== word jump ======
require('mini.jump').setup({
  mappings = {
    forward = 'f',
    backward = 'F',
    forward_till = 't',
    backward_till = 'T',
    repeat_jump = ';',
  },
  highlight_delay = 250,
})
-- ===== misc ======
require('mini.misc').setup({
	make_global = { 'put', 'put_text', 'zoom' }
})
-- ===== auto pair completion ====
require('mini.pairs').setup({
  -- In which modes mappings from this `config` should be created
  modes = { insert = true, command = false, terminal = false },

  -- Global mappings. Each right hand side should be a pair information, a
  -- table with at least these fields (see more in |MiniPairs.map|):
  -- - <action> - one of 'open', 'close', 'closeopen'.
  -- - <pair> - two character string for pair to be used.
  -- By default pair is not inserted after `\`, quotes are not recognized by
  -- `<CR>`, `'` does not insert pair after a letter.
  -- Only parts of tables can be tweaked (others will use these defaults).
  mappings = {
    ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
    ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
    ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

    [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
    [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
    ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

    ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
    ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
    ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
  },
})
-- ===== session management ======
require('mini.sessions').setup({
	autoread = true
})
-- ===== show start screen ======
require('mini.starter').setup({})
-- ===== status line config ======
local function status_config()
  local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
  local git           = MiniStatusline.section_git({ trunc_width = 75 })
  local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
  local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
  local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
  local location      = MiniStatusline.section_location({ trunc_width = 75 })

  return MiniStatusline.combine_groups({
  { hl = mode_hl,                  strings = { mode } },
  { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics['s'] } },
  { hl = 'MiniStatuslineError',  strings = { diagnostics['e'] } },
  { hl = 'MiniStatuslineWarning',  strings = { diagnostics['w'] } },
  { hl = 'MiniStatuslineInfo',  strings = { diagnostics['i'] } },
  { hl = 'MiniStatuslineHint',  strings = { diagnostics['h'] } },
  '%<', -- Mark general truncate point
  { hl = 'MiniStatuslineFilename', strings = { filename } },
  '%=', -- End left alignment
  { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
  { hl = mode_hl,                  strings = { location } },
  })
end
require('mini.statusline').setup({
  content = {
    active = status_config
  },
})
-- ===== quick edit parenthesis ====
require('mini.surround').setup({
  -- Number of lines within which surrounding is searched
  n_lines = 20,

  -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
  highlight_duration = 500,

  -- Pattern to match function name in 'function call' surrounding
  -- By default it is a string of letters, '_' or '.'
  funname_pattern = '[%w_%.]+',

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding
    update_n_lines = 'sn', -- Update `n_lines`
  },
})
-- ===== tabline =======
require('mini.tabline').setup({
	show_icons = true,
	set_vim_settings = true
})
-- ===== show trailspace ====
require('mini.trailspace').setup({
	only_in_normal_buffers = true
})
