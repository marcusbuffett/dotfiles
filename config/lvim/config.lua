lvim.leader = "space"
lvim.format_on_save = true
vim.opt.wrap = false -- display lines as one long line
vim.opt.clipboard = ""
vim.opt.undofile = true
vim.opt.gdefault = true

vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.7/bin/python3"
-- table.insert(lvim.builtin.cmp.sources, 1, { name = "vsnip"})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    exe = "prettier",
    filetypes = { "typescript", "typescriptreact", "javascript", "html", "json" },
  },
}

-- Mappings
lvim.builtin.which_key.mappings["f"] = { function () require('telescope.builtin').find_files() end, "Search files"}
lvim.builtin.which_key.mappings["e"] = { function () require('telescope.builtin').git_files() end, "Search git files"}
lvim.builtin.which_key.mappings["a"] = {
 ":Telescope current_buffer_fuzzy_find<CR>", "Fuzzy in buffer"
}
lvim.builtin.which_key.mappings["s"]["d"] = { function () 
  require('dash').search()
end, "Search dash app"}
lvim.builtin.which_key.mappings["s"]["p"] = { "<cmd>Telescope projects<CR>", "Projects"}
lvim.builtin.which_key.mappings["s"]["f"] = { "<cmd>Rg<CR>", "Fuzzy search"}
lvim.builtin.which_key.mappings["g"]["a"] = { "<cmd>DiffviewOpen<CR>", "diffview"}
lvim.builtin.which_key.mappings["m"] = {
  name = "+Custom",
  g = { ":Git<CR>", "Fugitive status"},
  c = { ":Git commit<CR>", "Fugitive commit"},
  p = { ":Git push<CR>", "Fugitive push"},
  e = { ":e ~/Documents/notes", "Notes"},
  n = { ":NvimTreeFindFile<CR>", "Reveal current file in nvimtree"},
}
lvim.builtin.which_key.mappings["m"]["o"] = { function () require('nvimtree').open() end, "Nvimtree"}
lvim.builtin.which_key.mappings["q"] = { ":q<CR>", "quit"}

lvim.plugins = {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-abolish' },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
      vim.api.nvim_set_keymap('n', '<Leader>my', ":Telescope neoclip<CR>", {})
    end,
  },
  { 'christoomey/vim-tmux-navigator',
    config = function()
    end
  },
  {'phaazon/hop.nvim', config = function()
    vim.api.nvim_set_keymap('n', '<Leader>z', ":HopLineStart<CR>", {})
    vim.api.nvim_set_keymap('x', '<Leader>z', "<cmd>HopLineStart<CR>", {})
    require'hop'.setup()
  end},
  { 'jeetsukumaran/vim-indentwise' },
  { 'tommcdo/vim-exchange' },
  { 'simnalamburt/vim-mundo' },
  { 'epilande/vim-react-snippets' },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'RRethy/nvim-treesitter-textsubjects' },
  {"simrat39/symbols-outline.nvim", config = function ()
    lvim.builtin.which_key.mappings["m"]["o"] = { ":SymbolsOutline<CR>", "Symbols Outline"}
  end},
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup()
    end,
  },

  {
    "numtostr/FTerm.nvim",
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map('n', '<C-e>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
      map('t', '<C-e>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
    end
  },
  {
    "ggandor/lightspeed.nvim",
    config = function ()
      require'lightspeed'.setup {
        -- ignore_case = true,
      }
    end,
    event = "BufRead",
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      local dial = require "dial"
      vim.cmd [[
      nmap <C-a> <Plug>(dial-increment)
      nmap <C-x> <Plug>(dial-decrement)
      vmap <C-a> <Plug>(dial-increment)
      vmap <C-x> <Plug>(dial-decrement)
      vmap g<C-a> <Plug>(dial-increment-additional)
      vmap g<C-x> <Plug>(dial-decrement-additional)
      ]]

      dial.augends["custom#boolean"] = dial.common.enum_cyclic {
        name = "boolean",
        strlist = { "true", "false" },
      }
      table.insert(dial.config.searchlist.normal, "custom#boolean")

      -- For Languages which prefer True/False, e.g. python.
      dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
        name = "Boolean",
        strlist = { "True", "False" },
      }
      table.insert(dial.config.searchlist.normal, "custom#Boolean")
    end,
  },
  {
    "tpope/vim-surround",
    keys = {"c", "d", "y"}
  },

  { 'aserowy/tmux.nvim' },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function ()
      require("diffview").setup({
        key_bindings = {
          view = {
            -- other mappings ...
            -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
          },
          file_panel = {
            -- optionally add it to the file panel as well:
            -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
          }
        }
      })
    end
  },

  -- {"mrjones2014/dash.nvim", run = "make install", config = function()
  --   require('dash').setup({})
  -- end},
  { "beauwilliams/focus.nvim", config = function()
    require("focus").setup({exclude_filetypes = {"qf"}})

  end },
  { "Pocco81/AutoSave.nvim", config = function()
    require("autosave").setup({
      enabled = true
    })
    end
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        mapping={
          ["send_to_qf"] = {
            map = "<leader>mqf",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
          }
        }
      })
      lvim.builtin.which_key.mappings["m"]["s"] = { function ()
        require('spectre').open()
      end, "Spectre"}
    end,
  },

}

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
lvim.builtin.dap.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
-- table.insert(lvim.builtin.cmp.sources, 0, {name = "vsnip"})

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true

local add_snippets = function ()
  local ls = require"luasnip"
  local s = ls.snippet
  local sn = ls.snippet_node
  local isn = ls.indent_snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local events = require("luasnip.util.events")

  table.insert(ls.snippets["all"], ls.parser.parse_snippet(
        "msd",
        -- "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
        "<div style={s(${1})}>${2}</div>"
      ))
  table.insert(ls.snippets["all"], ls.parser.parse_snippet(
        "msh",
        -- "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
        "<Spacer height={${1}}/>"
      ))
  table.insert(ls.snippets["all"], ls.parser.parse_snippet(
        "msw",
        -- "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
        "<Spacer width={${1}}/>"
      ))

  table.insert(ls.snippets["all"], s("misp", {
    t(
      {
        "{intersperse(",
        "items.map((x, i) => {",
        "return null;",
        "}),",
        "(i) => {",
        "return null",
        "},",
        ")}"
      }
  )}))
end

add_snippets()
