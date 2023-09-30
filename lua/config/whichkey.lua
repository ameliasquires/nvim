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
    ["f"] = { "<cmd>Neotree<CR>", "fs"},
    ["t"] = { "<cmd>UndotreeToggle<CR>", "clip tree"},		
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
			name = "sci",
			["i"] = { "<cmd>lua require('nabla').toggle_virt({autogen=true})<CR>", "toggle" },	
		},
		["q"] = {
			name = "quick chords",
			["l"] = { "0v$", "line" },
			["s"] = { "\"+y", "system grab" },	
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


