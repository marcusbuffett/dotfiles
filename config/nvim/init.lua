vim.g.mapleader = " "
-- vim.g.noswapfile = true
vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3"
-- vim.cmd([[
-- let g:coq_settings = { "keymap.jump_to_mark": "<C-n>", 'auto_start': v:true, "display.icons.mode": "short" }
-- ]])
-- let g:coq_settings['display.preview.border'] = ["","",""," ","","",""," "]

-- vim.cmd([[packadd packer.nvim]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "ys",
          normal_cur = "yss",
          normal_line = "yS",
          normal_cur_line = "ySS",
          visual = "<C-s>",
          visual_line = "gS",
          delete = "ds",
          change = "cs",
          change_line = "cS",
        },

        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "kazhala/close-buffers.nvim" },
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
    },
    config = function()
      require("neoai").setup({
        -- Options go here
      })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  { "ilAYAli/scMRU.nvim" },
  {
    "ggandor/flit.nvim",
    dependencies = { "ggandor/leap.nvim" },
    config = function()
      require('flit').setup {
        keys = { f = 'f', t = 'ø', T = 'ø', F = 'F' },
        -- -- A string like "nv", "nvo", "o", etc.
        -- labeled_modes = "v",
        -- multiline = true,
        -- -- Like `leap`s similar argument (call-specific overrides).
        -- -- E.g.: opts = { equivalence_classes = {} }
        opts = {
          -- case_insensitive = true,
          safe_labels = {},
          labels = { "d", "s", "t", "n", "e", "a", "i" },
        }
      }
    end,
  },
  {
    "amarakon/nvim-cmp-buffer-lines",
    config = function()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        dim_inactive = {
          enabled = true,
          shade = "dark",
          percentage = 0.25,
        },
        integrations = {
          cmp = true,
          dashboard = true,
          gitsigns = true,
          hop = true,
          leap = true,
          lsp_trouble = true,
          markdown = true,
          noice = true,
          notify = true,
          nvimtree = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          ts_rainbow = true,
          which_key = true,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },


  -- { "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd("colorscheme nightfox")
  --
  --   end },

  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require('onedark').setup {
  --       style = 'warmer'
  --     }
  --     require('onedark').load()
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   event = "VimEnter",
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup({
  --       method = "getCompletionsCycling",
  --
  --     })
  --   end
  -- },
  { "Exafunction/codeium.vim" },
  -- use({
  --   'glepnir/zephyr-nvim',
  --   config = function()
  --     vim.cmd([[colorscheme zephyr]])
  --   end
  -- })
  -- { "wbthomason/packer.nvim" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-abolish" },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    config = function()
    end
  },
  {
    "phaazon/hop.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader>z", ":HopLineStart<CR>", {})
      vim.api.nvim_set_keymap("x", "<Leader>z", "<cmd>HopLineStart<CR>", {})
      require("hop").setup()
    end,
  },
  { "michaeljsmith/vim-indent-object" },
  { "jeetsukumaran/vim-indentwise" },
  { "tommcdo/vim-exchange" },
  -- { "simnalamburt/vim-mundo" },
  { "epilande/vim-react-snippets" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  -- use({ "p00f/nvim-ts-rainbow" })
  { "RRethy/nvim-treesitter-textsubjects" },
  {
    "stevearc/aerial.nvim",
    config = function()
      require('aerial').setup({})
    end,
  },

  -- use({ "simrat39/symbols-outline.nvim", config = function() end })
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  -- use({
  --   "kevinhwang91/nvim-bqf",
  --   event = { "BufRead", "BufNew" },
  --   config = function()
  --     require("bqf").setup({
  --       func_map = {
  --         tab = "",
  --       },
  --     })
  --   end,
  -- })
  {
    "numtostr/FTerm.nvim",
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map("n", "<C-e>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
      map("t", "<C-e>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup(
        {
          labels = "dstrneaibuqmpvkw",
          modes = {
            char = {
              keys = { "f", "F", "t", "T", ";" },
            },
            search = {
              enabled = false,
            }
          },
        })
    end,
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
          })
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    config = function()
      require 'nvim-lastplace'.setup {}
    end
  },
  { "aserowy/tmux.nvim" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require("diffview").setup({
        -- key_bindings = {
        --   view = {
        --     -- other mappings ...
        --     -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
        --   },
        --   file_panel = {
        --     -- optionally add it to the file panel as well:
        --     -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
        --   },
        -- },
      })
    end,
  },
  -- { "anuvyklack/windows.nvim",
  --   dependencies = "anuvyklack/middleclass",
  --   config = function()
  --     require('windows').setup()
  --   end
  -- },
  { "stefandtw/quickfix-reflector.vim" },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        mapping = {
          ["send_to_qf"] = {
            map = "<leader>mqf",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix",
          },
        },
      })
    end,
  },
  { "akinsho/toggleterm.nvim" },
  -- {
  --   "glepnir/dashboard-nvim",
  --   config = function()
  --     vim.g.dashboard_default_executive = "telescope"
  --   end,
  -- },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
  { "rafamadriz/friendly-snippets" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          -- map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          -- map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          -- map('n', '<leader>hS', gs.stage_buffer)
          -- map('n', '<leader>hu', gs.undo_stage_hunk)
          -- map('n', '<leader>hR', gs.reset_buffer)
          -- map('n', '<leader>hp', gs.preview_hunk)
          -- map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          -- map('n', '<leader>tb', gs.toggle_current_line_blame)
          -- map('n', '<leader>hd', gs.diffthis)
          -- map('n', '<leader>hD', function() gs.diffthis('~') end)
          -- map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      })
    end,
  },
  { "kyazdani42/nvim-web-devicons" },
  { "williamboman/mason-lspconfig.nvim" },
  { "williamboman/mason.nvim" },
  {
    "cbochs/portal.nvim",
    -- Optional dependencies
    dependencies = {
      "cbochs/grapple.nvim",
    },
    config = function()
      require("portal").setup({
        labels = { "s", "t", "n", "e", "a", "i" },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "rust_analyzer" }
      })
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local opts = {
        on_attach = function(client, bufnr)
          -- print("In the on_attach thing for this client")
          -- print(vim.inspect(client.server_capabilities))
          -- require("aerial").on_attach(client, bufnr)
          if client.server_capabilities.documentFormattingProvider then
            -- print("Yup it can format!")
            vim.cmd([[
                                  augroup LspFormatting
                                  autocmd! * <buffer>
                                  autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }
                                  augroup END
                                  ]])
          end
        end,
        capabilities = capabilities
      }
      lspconfig.rust_analyzer.setup(opts)
      if vim.fn.executable('relay-compiler') == 1 then
        lspconfig.relay_lsp.setup(opts)
      end

      lspconfig.lua_ls.setup(opts)
      lspconfig.pyright.setup(opts)
      lspconfig.gopls.setup {}

      lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
          -- require("aerial").on_attach(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          -- client.server_capabilities.documentFormattingProvider = false
        end,
        handlers = {
          ["textDocument/definition"] = function(_, result, params)
            if result == nil or vim.tbl_isempty(result) then
              local _ = vim.lsp.log.info() and vim.lsp.log.info(params.method, "No location found")
              return nil
            end

            if vim.tbl_islist(result) then
              vim.lsp.util.jump_to_location(result[1])
              if #result > 1 then
                local isReactDTs = false
                for key, value in pairs(result) do
                  if string.match(value.targetUri, "styled-components/index.d.ts") or string.match(value.targetUri, "react/index.d.ts") then
                    isReactDTs = true
                    break
                  end
                end
                if not isReactDTs then
                  vim.fn.setqflist(vim.lsp.util.locations_to_items(result))
                  vim.api.nvim_command("copen")
                end
              end
            else
              vim.lsp.util.jump_to_location(result)
            end
          end,
        },
        capabilities = capabilities
      }
    end
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    config = function()
      require('nvim-window').setup({
        -- The characters available for hinting windows.
        chars = { "s", "t", "n", "e", "a", "i" },
        -- A group to use for overwriting the Normal highlight group in the floating
        -- window. This can be used to change the background color.
        normal_hl = 'Normal',
        -- The highlight group to apply to the line that contains the hint characters.
        -- This is used to make them stand out more.
        hint_hl = 'Bold',
        -- The border style to use for the floating window.
        border = 'single'
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "tsx", "json", "rust", "python" },
        sync_install = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        context_commentstring = {
          enable = false
        },
        highlight = {
          enable = true,
          disable = { "sql" },
          additional_vim_regex_highlighting = false,
        },
        rainbow = {
          enable = false,
          -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          colors = {
            "#689D6A",
            "#D69920",
            "#B16286",
          },
          -- termcolors = {} -- table of colour name strings
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            -- init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = ".",
            -- scope_incremental = "",
            node_decremental = ";",
          },
        },
        textsubjects = {
          enable = false,
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },
  {
    "axkirillov/easypick.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local easypick = require("easypick")

      -- only required for the example to work
      local base_branch = "master"

      easypick.setup({
        pickers = {
          -- add your custom pickers here
          -- below you can find some examples of what those can look like

          -- list files inside current folder with default previewer
          {
            -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
            name = "ls",
            -- the command to execute, output has to be a list of plain text entries
            command = "ls",
            -- specify your custom previwer, or use one of the easypick.previewers
            previewer = easypick.previewers.default()
          },

          -- diff current branch with base_branch and show files that changed with respective diffs in preview
          {
            name = "changed_files",
            command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
            previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
          },

          -- list files that have conflicts with diffs in preview
          {
            name = "conflicts",
            command = "git diff --name-only --diff-filter=U --relative",
            previewer = easypick.previewers.file_diff()
          },
        }
      })
    end
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },
  { "beauwilliams/focus.nvim", config = function() require("focus").setup() end },
  {
    "nanozuki/tabby.nvim",
    config = function()
      -- move current tab to previous position
      vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
      -- move current tab to next position
      vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
      local theme = {
        fill = 'TabLineFill',
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = 'TabLine',
        current_tab = 'TabLineSel',
        tab = 'TabLine',
        win = 'TabLine',
        tail = 'TabLine',
      }
      require('tabby.tabline').set(function(line)
        return {
          {
            { '  ', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep('', hl, theme.fill),
              tab.is_current() and '' or '',
              tab.number(),
              tab.name(),
              tab.close_btn(''),
              line.sep('', hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', theme.win, theme.fill),
              hl = theme.win,
              margin = ' ',
            }
          end),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end)
    end
  },
  -- {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require("auto-session").setup {
  --       log_level = "error",
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --     }
  --   end
  -- },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        }
      })
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
        -- silent_chdir = false,
        ignore_lsp = { "null-ls", "tsserver" },
        manual_mode = false,
      })
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end
  },
  { 'liuchengxu/vim-clap',     build = 'cargo build --release' },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "debugloop/telescope-undo.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
      require("telescope").load_extension("projects")
      require("telescope").load_extension("undo")
      require('telescope').load_extension('fzf')



      require("telescope").setup({
        defaults = {
          path_display = { "smart" }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- more options
            },
          },
          lsp_handlers = {
            disable = {},
            location = {
              telescope = {},
              no_results_message = "No references found",
            },
            symbol = {
              telescope = {},
              no_results_message = "No symbols found",
            },
            call_hierarchy = {
              telescope = {},
              no_results_message = "No calls found",
            },
            code_action = {
              telescope = {},
              no_results_message = "No code actions available",
              prefix = "",
            },
          },
        },
      })
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      -- require("luasnip.loaders.from_snipmate").lazy_load()
      -- require('luasnip').filetype_extend("javascript", { "javascriptreact" })
      -- require('luasnip').filetype_extend("javascript", { "typescriptreact" })
      -- require('luasnip').filetype_extend("javascript", { "html" })
      local cmp = require 'cmp'
      -- local luasnip = require 'luasnip'
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        sorting = {
          -- comparators = {
          --   -- require("copilot_cmp.comparators").prioritize,
          --   -- require("copilot_cmp.comparators").score,
          --
          --   -- Below is the default comparitor list and order for nvim-cmp
          --   cmp.config.compare.offset,
          --   -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          --   cmp.config.compare.exact,
          --   cmp.config.compare.score,
          --   cmp.config.compare.recently_used,
          --   cmp.config.compare.locality,
          --   cmp.config.compare.kind,
          --   cmp.config.compare.sort_text,
          --   cmp.config.compare.length,
          --   cmp.config.compare.order,
          -- },

        },
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          -- { name = "copilot" },
          -- { name = "buffer-lines" },
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          { name = 'luasnip' }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
          { name = 'buffer' },
        })
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", },
    config = function()
      -- local gps = require("nvim-gps")
      require("lualine").setup({
        sections = {
          lualine_c = {
            { "filename", },
          },
        },
      })
    end,
  },
  {
    "dpayne/CodeGPT.nvim",
    config = function()
      require("codegpt.config")

      -- Override the default chat completions url, this is useful to override when testing custom commands
      -- vim.g["codegpt_chat_completions_url"] = "http://127.0.0.1:800/test"

      vim.g["codegpt_commands"] = {
        ["complete"] = {
          -- Overrides the system message template
          system_message_template = "You are an expert {{language}} developer.",

          -- Overrides the user message template
          user_message_template =
          "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nPlease complete the above code. {{language_instructions}} \n {{command_args}}",
          language_instructions = {
            rust =
            "Use actix web for endpoints, sea orm for the database queries, and EndpointResult instead of the Result type."
          },

          -- Display the response in a popup window. The popup window filetype will be the filetype of the current buffer.
          callback_type = "code_popup",
        },
        ["4_code_edit"] = {
          -- Overrides the system message template
          system_message_template = "You are an expert {{language}} developer.",
          model = "gpt-4-32k",
          max_tokens = 32000,


          -- Overrides the user message template
          user_message_template =
          "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nEdit the above code. {{language_instructions}} \n {{command_args}}",

          -- Display the response in a popup window. The popup window filetype will be the filetype of the current buffer.
          callback_type = "code_popup",
        },
        ["code_edit"] = {
          -- Overrides the system message template
          system_message_template = "You are an expert {{language}} developer.",

          -- Overrides the user message template
          user_message_template =
          "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nEdit the above code. {{language_instructions}} \n {{command_args}}",

          -- Display the response in a popup window. The popup window filetype will be the filetype of the current buffer.
          callback_type = "code_popup",
        },
        -- Custom command
        -- ["modernize"] = {
        --   user_message_template = "I have the following {{language}} code: ```{{filetype}}\n{{text_selection}}```\nModernize the above code. Use current best practices. Only return the code snippet and comments. {{language_instructions}}",
        --   language_instructions = {
        --     cpp = "Use modern C++ syntax. Use auto where possible. Do not import std. Use trailing return type. Use the c++11, c++14, c++17, and c++20 standards where applicable.",
        --   },
        -- }
      }
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.fixjson,
          require("null-ls").builtins.formatting.prettier,
          -- require("null-ls").builtins.formatting.prettier_d_slim,
          require("null-ls").builtins.formatting.black.with {
            cwd = function(params)
              return vim.fn.fnamemodify(params.bufname, ':h')
            end,
          },
          require("null-ls").builtins.formatting.ruff,
          -- require("null-ls").builtins.formatting.eslint_d.with({
          -- }),
          -- require("null-ls").builtins.diagnostics.sqlfluff.with({
          --   extra_args = { "--dialect", "postgres" }, -- change to your dialect
          -- }),
          -- require("null-ls").builtins.diagnostics.eslint_d,
          -- require("null-ls").builtins.completion.spell,
        },
        debug = true,
        on_attach = function(client, bufnr)
          -- print("In the on_attach thing for this client")
          -- print(vim.inspect(client.server_capabilities))
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                -- vim.lsp.buf.formatting_sync()
                vim.lsp.buf.format({ bufnr = bufnr, async = true, timeout_ms = 5000 })
              end,
            })
          end
        end,
      })
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  { "kosayoda/nvim-lightbulb" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "napmn/react-extract.nvim",
    config = function()
      require("react-extract").setup()
    end,
  },
  {
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    config = function()
      require("telescope").load_extension("lsp_handlers")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitlinker").setup({
        callbacks = {
          ["gitlab.tula.co"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
      })
    end,
  },
  { "stevearc/dressing.nvim" },

  -- {
  --   'mrjones2014/legendary.nvim',
  --   config = function()
  --     require('legendary').setup({
  --       keymaps = {
  --         { '<F88>', ':ZkTags<CR>', description = 'zk tags' },
  --
  --
  --       },
  --       which_key = {
  --         -- Automatically add which-key tables to legendary
  --         -- see ./doc/WHICH_KEY.md for more details
  --         auto_register = true,
  --         -- you can put which-key.nvim tables here,
  --         -- or alternatively have them auto-register,
  --         -- see ./doc/WHICH_KEY.md
  --         mappings = {},
  --         opts = {},
  --         -- controls whether legendary.nvim actually binds they keymaps,
  --         -- or if you want to let which-key.nvim handle the bindings.
  --         -- if not passed, true by default
  --         do_binding = false,
  --       },
  --       commands = {
  --
  --       },
  --       funcs = {
  --         -- Make arbitrary Lua functions that can be executed via the item finder
  --         {
  --           function()
  --             require('spectre').open()
  --           end,
  --           description = 'Spectre',
  --         },
  --       },
  --       autocmds = {
  --       },
  --       extensions = {
  --         nvim_tree = true,
  --         diffview = true,
  --       },
  --     })
  --   end
  -- },

  -- TODO: neotest
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  },
  {
    "tomlion/vim-solidity",
  },
  {
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup()
    end,
  },
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
        -- it's recommended to use "telescope" or "fzf"
        picker = "telescope",
        lsp = {
          -- `config` is passed to `vim.lsp.start_client(config)`
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },
          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end
  },
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    "danielfalk/smart-open.nvim",
    -- branch = "0.1.x",
    config = function()
      require "telescope".load_extension("smart_open")
    end,
    dependencies = { "kkharji/sqlite.lua" }
  },
  -- {
  --   "nvim-zh/colorful-winsep.nvim",
  --   config = function()
  --     require('colorful-winsep').setup()
  --   end
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "chrisgrieser/nvim-spider",
    config = function()
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-w" })
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.bracketed').setup()
      require('mini.ai').setup({
        n_lines = 1000,

      })
    end
  },

  {
    'andymass/vim-matchup',
    setup = function()
      -- may set any options here
      -- vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },




}



-- vim.cmd([[
-- augroup packer_user_config
--   autocmd!
--   autocmd BufWritePost init.lua source % | PackerCompile
-- augroup end
-- ]])
vim.cmd([[
augroup save_on_leave
  autocmd!
  au BufLeave * silent! up
augroup end
]])

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

vim.api.nvim_set_keymap("n", ",", "<cmd>q<CR>", {})
vim.api.nvim_set_keymap("n", "T", "<cmd>only<CR>", {})
-- vim.api.nvim_set_keymap("n", "zz", "ono!<esc>", {})


-- require("packer").startup(function(use)
--   -- use { "catppuccin/nvim", as = "catppuccin", config = function()
--   --   vim.cmd.colorscheme "catppuccin"
--   -- end }
-- end)

local opt = vim.opt
opt.completeopt = { "menu", "menuone", "noselect" } -- Completion options (for deoplete)
opt.expandtab = true                                -- Use spaces instead of tabs
opt.hidden = true                                   -- Enable background buffers
opt.ignorecase = true                               -- Ignore case
opt.joinspaces = false                              -- No double spaces with join
-- opt.list = true                     -- Show some invisible characters
opt.number = true                                   -- Show line numbers
opt.relativenumber = true                           -- Relative line numbers
opt.scrolloff = 4                                   -- Lines of context
opt.shiftround = true                               -- Round indent
opt.shiftwidth = 2                                  -- Size of an indent
opt.sidescrolloff = 8                               -- Columns of context
opt.mouse = "a"
opt.smartcase = true                                -- Do not ignore case with capitals
opt.smartindent = true                              -- Insert indents automatically
opt.splitbelow = true                               -- Put new windows below current
opt.splitright = true                               -- Put new windows right of current
opt.tabstop = 2                                     -- Number of spaces tabs count for
opt.termguicolors = true                            -- True color support
opt.autowriteall = true
opt.wildmode = { "longest", "full" }                -- Command-line completion mode
opt.wrap = false                                    -- Disable line wrap
opt.updatetime = 300
opt.timeoutlen = 500
opt.undofile = true
opt.gdefault = true
opt.swapfile = false
opt.writebackup = true
opt.backup = false
opt.backupcopy = "auto"
opt.autoread = true
opt.foldmethod = "indent"
opt.foldlevel = 99

-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   {
--     exe = "prettier",
--     filetypes = { "typescript", "typescriptreact", "javascript", "html", "json" },
--   },
-- }
--
-- -- Mappings
-- lvim.builtin.which_key.mappings["f"] = { function () require('telescope.builtin').find_files() end, "Search files"}
-- lvim.builtin.which_key.mappings["e"] = { function () require('telescope.builtin').git_files() end, "Search git files"}
-- lvim.builtin.which_key.mappings["a"] = {
--  ":Telescope current_buffer_fuzzy_find<CR>", "Fuzzy in buffer"
-- }
-- lvim.builtin.which_key.mappings["s"]["d"] = { function ()
--   require('dash').search()
-- end, "Search dash app"}
-- lvim.builtin.which_key.mappings["s"]["p"] = { "<cmd>Telescope projects<CR>", "Projects"}
-- lvim.builtin.which_key.mappings["s"]["f"] = { "<cmd>Rg<CR>", "Fuzzy search"}
-- lvim.builtin.which_key.mappings["g"]["a"] = { "<cmd>DiffviewOpen<CR>", "diffview"}
-- lvim.builtin.which_key.mappings["m"] = {
--   name = "+Custom",
--   g = { ":Git<CR>", "Fugitive status"},
--   c = { ":Git commit<CR>", "Fugitive commit"},
--   p = { ":Git push<CR>", "Fugitive push"},
--   e = { ":e ~/Documents/notes", "Notes"},
--   n = { ":NvimTreeFindFile<CR>", "Reveal current file in nvimtree"},
-- }
-- lvim.builtin.which_key.mappings["m"]["o"] = { function () require('nvimtree').open() end, "Nvimtree"}
-- lvim.builtin.which_key.mappings["q"] = { ":q<CR>", "quit"}
--
-- lvim.plugins = {
--
-- }
--
-- lvim.builtin.dashboard.active = true
-- lvim.builtin.terminal.active = false
-- lvim.builtin.dap.active = false
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
-- -- table.insert(lvim.builtin.cmp.sources, 0, {name = "vsnip"})
--
-- -- if you don't want all the parsers change this to a table of the ones you want
-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "javascript",
--   "json",
--   "lua",
--   "python",
--   "typescript",
--   "css",
--   "rust",
--   "yaml",
-- }
--
-- lvim.builtin.treesitter.highlight.enabled = true
--
local add_snippets = function()
  local ls = require "luasnip"
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
  local ai = require("luasnip.nodes.absolute_indexer")
  local fmt = require("luasnip.extras.fmt").fmt
  local m = require("luasnip.extras").m
  local lambda = require("luasnip.extras").l
  ls.add_snippets("rust", {
    ls.parser.parse_snippet(
      { trig = "rs" },
      "\"${1}\".to_string()"
    ),
    ls.parser.parse_snippet(
      { trig = "mte" },
      [[
      let start = std::time::Instant::now();
      eprintln!("Elapsed: {:?}", start.elapsed());
      ]]
    ),
    ls.parser.parse_snippet(
      { trig = "ps" },
      [[
      #[derive(Debug, Clone, Eq, PartialEq)]
      pub struct ${1} {
        pub ${2}: ${3},
      }
      ]]
    ),
  })
  ls.add_snippets("all", {
    s("uuid", {
      f(function(args, snip, user_arg_1)
        return vim.fn.trim(vim.fn.system([[uuidgen | tr '[:upper:]' '[:lower:]']]))
      end), -- callback (args, parent, user_args) -> string
    })
  })

  ls.add_snippets("typescriptreact", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    ls.parser.parse_snippet(
      { trig = "msd" },
      "<div style={s(${1})}>${2}</div>"
    ),
    ls.parser.parse_snippet(
      { trig = "msv" },
      "<View style={s(${1})}>${2}</View>"
    ),
    ls.parser.parse_snippet(
      { trig = "mst" },
      "<CMText style={s(${1})}>${2}</CMText>"
    ),
    ls.parser.parse_snippet(
      { trig = "mhm" },
      "const isMobile = useIsMobile()"
    ),
    ls.parser.parse_snippet(
      { trig = "mht" },
      "const track = useTrack()"
    ),
    ls.parser.parse_snippet(
      { trig = "msh" },
      "<Spacer height={${1}}/>"
    ),
    ls.parser.parse_snippet(
      { trig = "cl" },
      "console.log('${1}', ${2})"
    ),

    ls.parser.parse_snippet(
      { trig = "jsxc" },
      [[
      {${1} && (
        <>
        ${2}
        </>
      )}
      ]]
    ),
    ls.parser.parse_snippet(
      { trig = "mzss" },
      [[
        ${1}: (_state?: RepertoireState) =>
          setter(set, _state, (s) => {
            ${2}
          }),
      ]]
    ),
    ls.parser.parse_snippet(
      { trig = "msw" },
      "<Spacer width={${1}}/>"
    ),
    ls.parser.parse_snippet(
      { trig = "misp" },
      [[
        {intersperse(
          ${1}.map((x, i) => {
            return <div key={i} style={s()}></div>;
          }),
          (i) => {
            return <Spacer height={height}key={i} />;
          }
        )}
      ]]
    )
  })

  -- table.insert(ls.snippets["all"], )
  -- table.insert(ls.snippets["all"], ls.parser.parse_snippet(
  --   "msh",
  --   "<Spacer height={${1}}/>"
  -- ))
  -- table.insert(ls.snippets["all"], ls.parser.parse_snippet(
  --   "msw",
  --   "<Spacer width={${1}}/>"
  -- ))
  --
  -- table.insert(ls.snippets["all"], s("misp", {
  --   t(
  --     {
  --       "{intersperse(",
  --       "items.map((x, i) => {",
  --       "return null;",
  --       "}),",
  --       "(i) => {",
  --       "return null",
  --       "},",
  --       ")}"
  --     }
  --   ) }))
end

local wk = require("which-key")

wk.register({
  m = {
    e = { require("react-extract").extract_to_current_file, "Extract to current file" },
  },
  r = {

    d = { "\"+y", "Yank to system clioard" },
  }
}, { prefix = "<leader>", mode = "v" })

wk.register({
  ["<leader>"] = {
    z = {
      "<cmd>HopLineStart<CR>",
      "Hop line",
    },
  },
}, { mode = "x" })

wk.register({
  i = {
    e = { ":Chat code_edit ", "ChatGPT w/ last selection" },
    i = { ":Chat code_edit_4 ", "Chat gpt 4 edit" },
    a = { ":Chat complete ", "ChatGPT w/ last selection" },
  },
}, { prefix = "<leader>", mode = "v" })

wk.register({
  s = {
    name = "search",
    a = { "<cmd>Telescope find_files<cr>", "Find File" },
    n = { "<cmd>Rg<CR>", "Fuzzy search" },
    d = { "<cmd>Easypick changed_files<CR>", "Search changed files" },
    t = {
      ":Telescope current_buffer_fuzzy_find<CR>",
      "Fuzzy in buffer",
    },
    r = { "<cmd>Telescope smart_open<cr>", "Open Recent File" },
    i = { "<cmd>Telescope projects<CR>", "Projects" },
    e = { "<cmd>Portal jumplist backward<cr>", "Portal jumplist" }
  },
  d = {
    name = "Git",
    t = { ":Git commit<CR>", "Fugitive commit" },
    s = { ":DiffviewOpen<CR>", "Diffview" },
    a = { ":Git push<CR>", "Fugitive push" },
    n = { "<cmd>Gvdiffsplit<CR>", "diffview" },
    i = { "<cmd>DiffviewFileHistory %<CR>", "File history" },
    r = { function() require("gitsigns").blame_line { full = true } end, "Blame line" },
    e = { function() require("gitsigns").toggle_deleted() end, "Toggle deleted lines" },
    -- u = { "<cmd>Diffview<CR>", "DiffviewOpen" },
  },
  n = {
    name = "Navigation",
    r = { ":lua require('nvim-window').pick()<CR>", "Window picker" },
    s = { ":tabn<CR>", "Next tab" },
    t = { ":$tabnew<CR>", "New tab" },
    d = { "<cmd>only<CR>", "Close all others" },
    e = { "<cmd>q<CR>", "Close window" },
    a = { "<C-w>v", "Split vertically" },
    i = { "<C-w>s", "Split horizontally" },
  },
  t = {
    name = "lsp",
    r = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Next diagnostic" },
    s = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev diagnostic" },
    d = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    e = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    i = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
    a = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  },
  r = {
    name = "Misc / High Freq",
    a = { ":CodeActionMenu<CR>", "Code action" },
    e = { ":Telescope neoclip<CR>", "Neoclip" },
    n = { "<cmd>w<CR>:noh<CR>", "Save / Clear Highlights" },
    i = {
      "<cmd>HopLineStart<CR>",
      "Hop line",
    },
  },
  a = {
    name = "Misc / Low Freq",
    e = { ":Telescope diagnostics<CR>", "Diagnostics" },
    t = { ":Telescope<CR>", "Just Telescope" },
    a = { ":Telescope keymaps<CR>", "Keymaps" },
  },
  i = {
    name = "Openers",
    n = {
      "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", "New zk note"
    },
    d = {
      "",
      ""
    },
    e = {
      "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "Search zk notes"
    },
    s = { ":Neotree filesystem reveal<CR>", "Nvim toggle" },
    a = { function()
      require("spectre").open()
    end, "Spectre" },
    r = { ":ChatGPT<CR>", "ChatGPT" },
    t = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
  }
}, { prefix = "<leader>" })
wk.register({
  ["<F8>"] = { "<cmd>w<CR>:noh<CR>", "Save / Clear Highlights" }

}, { mode = "n" })
wk.register({
  ["<F8>"] = { "<esc><cmd>w<CR><cmd>noh<CR><esc>", "Save / Clear Highlights" }
}, { mode = "i" })
