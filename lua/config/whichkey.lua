local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = {"n", "v"}, -- Normal mode
    prefix = " ",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local mappings = {
    --["w"] = { "<cmd>update!<CR>", "Save" }, 
    ["f"] = { "<cmd>Neotree toggle<CR>", "fs"},
    ["c"] = { "<cmd>UndotreeToggle<CR>", "clip tree"},
    ["e"] = { "<cmd>TroubleToggle<CR>", "errors" },
		["g"] = {
			name = "'games'",
			["q"] = { "<cmd>KillKillKill<CR>", "killer sheep" },
			["w"] = { "<cmd>Nvimesweeper<CR>", "minesweeper" },
			["e"] = { "<cmd>CellularAutomaton make_it_rain<CR>", "c_a make it rain" },	
			["r"] = { "<cmd>CellularAutomaton game_of_life<CR>", "c_a conway gol" },		
			["t"] = { "<cmd>Tetris<CR>", "tetris" },	
			["y"] = { "<cmd>ShenzhenSolitaireNewGame<CR>", "solitaire" },
			["u"] = { "<cmd>BlackJackNewGame<CR>", "blackjack" },
			["i"] = { "<cmd>lua require('sudoku').setup{}<CR><cmd>Sudoku<CR>", "sudoku" },
		},
		["n"] = {
			name = "visual changes",
      ["d"] = { function ()
        if not _G.__diffview_open then
          _G.__diffview_open = true;
          vim.cmd("DiffviewOpen");
        else _G.__diffview_open = false;
          vim.cmd("DiffviewClose")
        end
      end, "toggle diff"},
      ["s"] = { "<cmd>if &spell<CR>set nospell<CR>else<CR>set spell<CR>endif<CR>", "spellcheck"},
			["i"] = { "<cmd>lua require('nabla').toggle_virt({autogen=true})<CR>", "toggle markdown" },
      ["h"] = { "<cmd>HexToggle<CR>", "hex" }
    },
    ["u"] = {
      name = "utils",
      ["h"] = { "<cmd>Hardtime toggle<CR>", "toggle hardtime" },
    },
		["q"] = {
			name = "quick",
			["l"] = { "0v$", "line" },
      ["s"] = { "\"+y", "system grab" },
    },
    ["t"] = {
      name = "telescope",
      ["f"] = { "<cmd>Telescope find_files<CR>", "find files" },
      ["b"] = { "<cmd>Telescope git_branches<CR>", "git branches" },
      ["c"] = { "<cmd>Telescope git_commits<CR>", "git commits" },
      ["l"] = { "<cmd>Telescope live_grep<CR>", "ripgrep" },
      ["z"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "fuzzy" },

    },
		["z"] = {
      name = "packer",
      c = { "<cmd>PackerCompile<cr>", "compile" },
      i = { "<cmd>PackerInstall<cr>", "install" },
      s = { "<cmd>PackerSync<cr>", "sync" },
      S = { "<cmd>PackerStatus<cr>", "status" },
      u = { "<cmd>PackerUpdate<cr>", "update" },
    },
 
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M


