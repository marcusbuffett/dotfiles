--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general

-- vim.g["prettier#autoformat"] = 1
-- vim.g["prettier#autoformat_require_pragma"] = 0
-- vim.g["prettier#quickfix_enabled"] = 0
vim.o.showtabline = 0

lvim.format_on_save = true
lvim.builtin.compe.autocomplete = true
vim.o.wrap = false
lvim.colorscheme = "tokyonight"
lvim.auto_close_tree = 0
lvim.leader_key = " "

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.highlight.disable = {"tsx"}
lvim.builtin.treesitter.textsubjects.enable = true
lvim.builtin.treesitter.textobjects.swap.enable = true
lvim.builtin.treesitter.textobjects.select.enable = true
-- table.insert(lvim.builtin.compe.exclude_filetypes, "clap_input")

-- lvim.builtin.telescope.extensions.project = {
--       base_dirs = {
--         '~/Documents/projects/chess-opening-repertoire/chess-dojo',
--         '~/Documents/projects/chess-opening-repertoire/chess-dojo-server',
--         '~/Documents/projects/chess-opening-repertoire',
--       }
--   }

lvim.builtin.which_key.mappings["m"] = {
  name = "+Custom",
  a = { "<cmd>AerialOpen<CR>", "Open Aerial"},
}
lvim.builtin.which_key.mappings["f"] = { function () require('telescope.builtin').find_files() end, "Search files"}
lvim.builtin.which_key.mappings["e"] = { function () require('telescope.builtin').git_files() end, "Search git files"}
lvim.builtin.which_key.mappings["m"]["o"] = { function () require('nvimtree').open() end, "Nvimtree"}
lvim.builtin.which_key.mappings["m"] = {
  name = "+Custom",
  a = { "<cmd>AerialOpen<CR>", "Open Aerial"},
  g = { function () require('neogit').open() end, "Neogit"},
  e = { ":e ~/Documents/scratch/scratch.md<CR>", "Scratch Buffer"},
  b = { ":Telescope current_buffer_fuzzy_find<CR>", "Fuzzy in buffer"},
  n = { ":NvimTreeFindFile<CR>", "Reveal current file in nvimtree"},
}
-- lvim.builtin.which_key.mappings["s"][""] = {
--   "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
--   "Search string",
-- }
-- lvim.builtin.which_key.mappings["s"]["a"] = {
--   "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
--   "Search string",
-- }

-- lvim.builtin.which_key.mappings["l"]["a"] = { function() require('lspsaga.codeaction').code_action() end, "Code action" }

-- lvim.builtin.which_key.mappings["l"]["r"] = { function() require('lspsaga.rename').rename() end, "Rename" }
lvim.builtin.which_key.mappings.m["f"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = ''})<cr>",
  "Search string",
}


lvim.plugins = {
  { 'liuchengxu/vim-clap', run = ':Clap install-binary',
    config = function()
      vim.api.nvim_set_keymap('n', '<Leader>my', ":Clap yanks<CR>", {})
    end},
  { 'tpope/vim-fugitive' },
  -- { 'tpope/vim-surround' },
  { 'tpope/vim-abolish' },
  { 'christoomey/vim-tmux-navigator',
    config = function()
    end
  },
  {'phaazon/hop.nvim', config = function()
    vim.api.nvim_set_keymap('n', '<Leader>z', ":HopLineStart<CR>", {})
    require'hop'.setup()
  end},
  { 'jeetsukumaran/vim-indentwise' },
  { 'tommcdo/vim-exchange' },
  { 'simnalamburt/vim-mundo' },
  { 'epilande/vim-react-snippets' },
  { 'nvim-treesitter/nvim-treesitter-textobjects'
  },
  { 'RRethy/nvim-treesitter-textsubjects' },
  -- { 'prettier/vim-prettier',
  --   config = function()
  --   end
  -- },
  { 'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    "blackCauldron7/surround.nvim",
    config = function()
      vim.g.surround_prefix = "<Space>ms"

      require "surround".setup {}
    end
  },
--   {
--     "stevearc/aerial.nvim",
--
--     config = function()
--       local aerial = require'aerial'
--       local custom_attach = function(client)
--         aerial.on_attach(client)
--         vim.api.nvim_buf_set_keymap(0, 'n', '{', '<cmd>AerialPrev<CR>', {})
--         vim.api.nvim_buf_set_keymap(0, 'n', '}', '<cmd>AerialNext<CR>', {})
--       end
--       require'lspconfig'.vimls.setup{
--         on_attach = custom_attach,
--       }
--     end
  --   },
  -- { "glepnir/lspsaga.nvim",
  --   config = function()
  --     local saga = require "lspsaga"
  --     saga.init_lsp_saga()
  --     vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {})
  --     -- nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
  --   end
  -- },
  {
    'ggandor/lightspeed.nvim',
    config = function ()
      -- vim.cmd [[unmap f]]
      -- vim.cmd [[unmap F]]
      -- vim.cmd [[unmap t]]
      -- vim.cmd [[unmap T]]
    end
  },
  {
    'ChristianChiarulli/nvcode-color-schemes.vim'
  },
  {'folke/tokyonight.nvim'},
--   {'ray-x/navigator.lua',
--     requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
--     config = function()
--       print("Doing this config thing")
--       require("navigator").setup({
--         default_mapping = true, -- for now, while mappings not working
--         keymaps = {
--           {key = "gr", func = "references()"},
--           {mode = "i", key = "<M-k>", func = "signature_help()"},
--           {key = "gs", func = "signature_help()"},
--           {key = "g0", func = "document_symbol()"},
--           {key = "gW", func = "workspace_symbol()"},
--           {key = "<c-]>", func = "definition()"},
--           {key = "gD", func = "declaration({ popup_opts = { border = 'single' }})"},
--           {key = "gp", func = "require('navigator.definition').definition_preview()"},
--           {key = "gT", func = "require('navigator.treesitter').buf_ts()"},
--           {key = "GT", func = "require('navigator.treesitter').bufs_ts()"},
--           {key = "K", func = "hover({ popup_opts = { border = single }})"},
--           {key = "<Space>ca", mode = "n", func = "code_action()"},
--           {key = "<Space>cA", mode = "v", func = "range_code_action()"},
--           {key = "<Leader>re", func = "rename()"},
--           {key = "<Space>rn", func = "require('navigator.rename').rename()"},
--           {key = "<Leader>gi", func = "incoming_calls()"},
--           {key = "<Leader>go", func = "outgoing_calls()"},
--           {key = "gi", func = "implementation()"},
--           {key = "<Space>D", func = "type_definition()"},
--           {key = "gL", func = "diagnostic.show_line_diagnostics({ popup_opts = { border = single }})"},
--           {key = "gG", func = "require('navigator.diagnostics').show_diagnostic()"},
--           {key = "]d", func = "diagnostic.goto_next({ popup_opts = { border = single }})"},
--           {key = "[d", func = "diagnostic.goto_next({ popup_opts = { border = single }})"},
--           {key = "]r", func = "require('navigator.treesitter').goto_next_usage()"},
--           {key = "[r", func = "require('navigator.treesitter').goto_previous_usage()"},
--           {key = "<C-LeftMouse>", func = "definition()"},
--           {key = "g<LeftMouse>", func = "implementation()"},
--           {key = "<Leader>k", func = "require('navigator.dochighlight').hi_symbol()"},
--           -- {key = '<Space>wa', func = '<cmd>lua vim.lsp.buf.add_workspace_folder()'},
--           -- {key = '<Space>wr', func = '<cmd>lua vim.lsp.buf.remove_workspace_folder()'},
--           -- {key = '<Space>wl', func = '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'},
--         }
-- 
--       })
--     end
--   },
  -- Just gives us ctrl-hjkl for window navigation
  { 'aserowy/tmux.nvim' },
  { 'TimUntersberger/neogit', requires = {"sindrets/diffview.nvim"}, config = function()
    require('neogit').setup {integrations = {diffview = true}}
  end},
  {'sbdchd/neoformat', config = function ()
    vim.cmd [[
    augroup fmt
    autocmd!
    autocmd BufWritePre *.tsx undojoin | Neoformat
    augroup END
    ]]
  end}
  -- { 'nvim-telescope/telescope-project.nvim', config = function ()
  --   require'telescope'.load_extension('project')
  -- end}
}

vim.g.surround_prefix = "<Leader>a"

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   ignore_install = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- List of parsers to ignore installing
--   highlight = {
--     enable = true,
--     disable = {"tsx"}
--   },
--   textobjects = {
--     swap = {
--       enable = true,
--       swap_next = {
--         ["<leader>tn"] = "@parameter.inner",
--       },
--       swap_previous = {
--         ["<leader>tp"] = "@parameter.inner",
--       },
--     },
--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         ["]m"] = "@function.outer",
--         ["]]"] = "@class.outer",
--       },
--       goto_next_end = {
--         ["]M"] = "@function.outer",
--         ["]["] = "@class.outer",
--       },
--       goto_previous_start = {
--         ["[m"] = "@function.outer",
--         ["[["] = "@class.outer",
--       },
--       goto_previous_end = {
--         ["[M"] = "@function.outer",
--         ["[]"] = "@class.outer",
--       },
--     },
--     select = {
--       enable = true,
--
--       -- Automatically jump forward to textobj, similar to targets.vim
--       lookahead = true,
--
--       keymaps = {
--         -- You can use the capture groups defined in textobjects.scm
--         ["af"] = "@function.outer",
--         ["if"] = "@function.inner",
--         ["ac"] = "@class.outer",
--         ["ic"] = "@class.inner",
--       },
--     },
--   },
--   textsubjects = {
--     enable = true,
--     keymaps = {
--       ['.'] = 'textsubjects-smart',
--       [';'] = 'textsubjects-container-outer',
--     }
--   }
-- }

vim.cmd [[set clipboard=]]

vim.cmd [[set noautochdir]]

vim.g.tokyonight_style = "night"

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]

vim.g["clap_popup_move_manager"] = {
  ["<C-N>"] = "<Down>",
  ["<C-P>"] = "<Up>"
}

-- lvim.lang.typescriptreact.formatters = {{
--   exe = "prettier"
-- }}
