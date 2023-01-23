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

  { "kazhala/close-buffers.nvim" },
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
  { "ggandor/flit.nvim",
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
    's1n7ax/nvim-window-picker',
    config = function()
      require 'window-picker'.setup()
    end,
  },
  { "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme nightfox")

    end },

  -- {
  --   "navarasu/onedark.nvim",
  --   config = function()
  --     require('onedark').setup {
  --       style = 'warmer'
  --     }
  --     require('onedark').load()
  --   end,
  -- },
  { 'Ostralyan/scribe.nvim', config = function()
    require("scribe").setup({})
  end
  },

  {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  },
  -- use({
  --   'glepnir/zephyr-nvim',
  --   config = function()
  --     vim.cmd([[colorscheme zephyr]])
  --   end
  -- })
  { "wbthomason/packer.nvim" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-abolish" },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  },
  { "christoomey/vim-tmux-navigator", config = function() end },
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
  { "simnalamburt/vim-mundo" },
  { "epilande/vim-react-snippets" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  -- use({ "p00f/nvim-ts-rainbow" })
  { "RRethy/nvim-treesitter-textsubjects" },
  -- use({
  --   "stevearc/aerial.nvim",
  --   config = function()
  --     require('aerial').setup({})
  --   end,
  -- })
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
    "ggandor/leap.nvim",
    config = function()
      -- local function get_windows_on_tabpage()
      --   local t = {}
      --   local ids = string.gmatch(vim.fn.string(vim.fn.winlayout()), "%d+")
      --   for id in ids do t[#t + 1] = id end
      --   return vim.tbl_map(function(id) return vim.fn.getwininfo(id)[1] end, t)
      -- end

      require("which-key").register({
        S = { function()
          require 'leap'.leap { ['target-windows'] = vim.api.nvim_tabpage_list_wins(0) }
        end
          , "leap" }
      }, {
        mode = "n"
      })

      require("which-key").register({
        t = { "<Plug>(leap-backward)", "leap" }
      }, {
        mode = "n"
      })
      require("which-key").register({
        s = { "<Plug>(leap-forward)", "leap" }
      }, {
        mode = "n"
      })
      require("which-key").register({
        t = { "<Plug>(leap-backward)", "leap" }
      }, {
        mode = "x"
      })
      require("which-key").register({
        s = { "<Plug>(leap-forward)", "leap" }
      }, {
        mode = "x"
      })
      require('leap').setup {
        -- case_insensitive = true,
        safe_labels = {},
        labels = { "d", "s", "t", "n", "e", "a", "i" },
        special_keys = {
          repeat_search = '<enter>',
          next_target   = '<enter>',
          prev_target   = '<tab>',
          next_group    = '<space>',
          prev_group    = '<tab>',
          eol           = '<space>',
        },
      }
      vim.cmd([[highlight LeapBackdrop guifg=#918474 guibg=none]])
      vim.cmd([[highlight LeapLabelPrimary guifg=#000000 guibg=#EBEDF1]])

    end
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
    end,
  },
  { "ethanholz/nvim-lastplace", config = function()
    require 'nvim-lastplace'.setup {}

  end },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    "tpope/vim-surround",
    keys = { "c", "d", "y" },
  },
  -- { "sunjon/shade.nvim", config = function()
  --   require 'shade'.setup({
  --     overlay_opacity = 50,
  --     opacity_step = 1,
  --     keys = {
  --       brightness_up   = '<C-Up>',
  --       brightness_down = '<C-Down>',
  --       -- toggle          = '<Leader>s',
  --     }
  --   })
  --
  -- end },

  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { "aserowy/tmux.nvim" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require("diffview").setup({
        key_bindings = {
          view = {
            -- other mappings ...
            -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
          },
          file_panel = {
            -- optionally add it to the file panel as well:
            -- ["<Leader>q"] = "<CMD>DiffviewClose<CR>",
          },
        },
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
          map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line { full = true } end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      })
    end,
  },
  { "kyazdani42/nvim-web-devicons" },
  { "williamboman/mason-lspconfig.nvim" },
  { "williamboman/mason.nvim" },
  {
    "neovim/nvim-lspconfig",
    config = function()

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer" }
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
      lspconfig.relay_lsp.setup(opts)
      lspconfig.sumneko_lua.setup(opts)
      lspconfig.pyright.setup(opts)
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
                  if string.match(value.targetUri, "react/index.d.ts") then
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
  { "https://gitlab.com/yorickpeterse/nvim-window.git", config = function()
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


  end },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        sync_install = false,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        context_commentstring = {
          enable = true
        },

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        rainbow = {
          enable = true,
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
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
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
  { "nanozuki/tabby.nvim", config = function()
    vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
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

  end },
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({ update_cwd = true, update_focused_file = {
        enable = true,
        update_cwd = true,
      } })
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
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").load_extension("projects")

      require("telescope").setup({
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
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
      require('luasnip').filetype_extend("javascript", { "javascriptreact" })
      require('luasnip').filetype_extend("javascript", { "typescriptreact" })
      require('luasnip').filetype_extend("javascript", { "html" })
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
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
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "copilot" },
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
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.fixjson,
          require("null-ls").builtins.formatting.prettier,
          -- require("null-ls").builtins.formatting.black,
          require("null-ls").builtins.formatting.isort,
          require("null-ls").builtins.formatting.eslint_d.with({
            -- extra_args = { "--fix" },
          }),
          -- require("null-ls").builtins.diagnostics.sqlfluff.with({
          --   extra_args = { "--dialect", "postgres" }, -- change to your dialect
          -- }),
          -- require("null-ls").builtins.formatting.rustfmt,
          -- require("null-ls").builtins.diagnostics.eslint,
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
                vim.lsp.buf.format({ bufnr = bufnr })
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
    'phaazon/mind.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'mind'.setup {
        persistence = {
          state_path = '~/mind/mind.json',
          data_dir = '~/mind/data',
        },

        ui = {
          width = 40,

          highlight = {
            node_root = 'Number',
          }
        },

        keymaps = {
          normal = {
            T = function(args)
              require 'mind.ui'.with_cursor(function(line)
                local tree = args.get_tree()
                local node = require 'mind.node'.get_node_by_line(tree, line)

                if node.icon == nil or node.icon == ' ' then
                  node.icon = ' '
                elseif node.icon == ' ' then
                  node.icon = ' '
                end

                args.save_tree()
                require 'mind.ui'.rerender(tree, args.opts)
              end)
            end,
          }
        }
      }
    end,
  }

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
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable background buffers
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
-- opt.list = true                     -- Show some invisible characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.sidescrolloff = 8 -- Columns of context
opt.mouse = "a"
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.autowriteall = true
opt.wildmode = { "longest", "full" } -- Command-line completion mode
opt.wrap = false -- Disable line wrap
opt.updatetime = 300
opt.timeoutlen = 500
opt.undofile = true
opt.gdefault = true
opt.swapfile = false
opt.writebackup = true
opt.backup = false
opt.backupcopy = "auto"
opt.autoread = true

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

add_snippets()
local wk = require("which-key")

local new_mappings = false
if new_mappings then
  wk.register({
    i = {
      r = { "<Esc>:ChatGPTEditWithInstructions<CR>", "ChatGPT w/ last selection" },
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
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      i = { "<cmd>Telescope projects<CR>", "Projects" },
      e = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            require 'mind.commands'.commands.open_data_index(args)
          end)
        end, "search mind notes"
      },
    },
    d = {

      name = "Git",
      t = { ":Git commit<CR>", "Fugitive commit" },
      s = { ":Git<CR>", "Fugitive status" },

      a = { ":Git push<CR>", "Fugitive push" },
      n = { "<cmd>Gvdiffsplit<CR>", "diffview" },
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
      a = { ":Telescope keymaps<CR>", "Telescope Keymaps <Spacr>" },
    },
    i = {
      name = "Openers",
      e = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            require 'mind.commands'.create_node_index(
              args.get_tree(),
              require 'mind.node'.MoveDir.INSIDE_END,
              args.save_tree,
              args.opts
            )
          end)
        end, "Create Mind Node"
      },
      d = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            local tree = args.get_tree()
            local path = vim.fn.strftime('/Journal/%Y/%b/%b %d')
            local _, node = require 'mind.node'.get_node_by_path(tree, path, true)

            if node == nil then
              vim.notify('cannot open journal 🙁', vim.log.levels.WARN)
              return
            end

            require 'mind.commands'.open_data(tree, node, args.data_dir, args.save_tree, args.opts)
            args.save_tree()
          end)
        end,
        "Mind Journal"
      },
      n = {
        ':MindOpenMain<CR>', "Mind main"
      },
      s = { ":NvimTreeFindFileToggle<CR>", "Nvim toggle" },
      a = { function()
        require("spectre").open()
      end, "Spectre" },
      r = { ":ChatGPT<CR>", "ChatGPT" },
      t = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
    }
  }, { prefix = "<leader>" })

else
  wk.register({
    m = {
      name = "+file",
      n = { ":NvimTreeFindFileToggle<CR>", "Nvim tree" },
      a = { ":ChatGPT<CR>", "ChatGPT" },
      i = { "<Esc>:ChatGPTEditWithInstructions<CR>", "ChatGPT w/ last selection" },
      e = { require("react-extract").extract_to_current_file, "Extract to current file" },
      c = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
      y = { ":Telescope neoclip<CR>", "Neoclip" },
      s = { ":ScribeOpen<CR>", "Scribe" },
      -- j = { ":ScribeOpen journal.md<CR>", "Scribe Journal" },
      -- z = {
      --   function()
      --     require 'mind'.wrap_smart_project_tree_fn(function(args)
      --       require 'mind.commands'.create_node_index(
      --         args.get_tree(),
      --         require 'mind.node'.MoveDir.INSIDE_END,
      --         args.save_tree,
      --         args.opts
      --       )
      --     end)
      --   end
      -- },
      x = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            require 'mind.commands'.create_node_index(
              args.get_tree(),
              require 'mind.node'.MoveDir.INSIDE_END,
              args.save_tree,
              args.opts
            )
          end)
        end, "Create node index"
      },
      d = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            require 'mind.commands'.commands.open_data_index(args)
          end)
        end, "search mind notes"
      },
      f = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            require 'mind.commands'.open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
          end)
        end, "search mind"
      },

      j = {
        function()
          require 'mind'.wrap_main_tree_fn(function(args)
            local tree = args.get_tree()
            local path = vim.fn.strftime('/Journal/%Y/%b/%b %d')
            local _, node = require 'mind.node'.get_node_by_path(tree, path, true)

            if node == nil then
              vim.notify('cannot open journal 🙁', vim.log.levels.WARN)
              return
            end

            require 'mind.commands'.open_data(tree, node, args.data_dir, args.save_tree, args.opts)
            args.save_tree()
          end)
        end,
        "journal"
      },
      m = {
        ':MindOpenMain<CR>', "Mind main"
      },
      -- M = {
      --   function()
      --     require 'mind'.wrap_main_tree_fn(function(args)
      --       require 'mind.commands'.open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
      --     end)
      --   end
      -- },
      -- s = { ":AerialOpen<CR>", "Symbols" },
    },
    h = { "ino!", "Clear highlights" },
    d = { ":lua require('nvim-window').pick()<CR>", "Window picker" },
    s = {
      name = "Searching",
      e = { "<cmd>Telescope find_files<cr>", "Find File" },
      g = { "<cmd>Rg<CR>", "Fuzzy search" },
      c = { "<cmd>Easypick changed_files<CR>", "Search changed files" },
      o = {
        ":Telescope current_buffer_fuzzy_find<CR>",
        "Fuzzy in buffer",
      },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      p = { "<cmd>Telescope projects<CR>", "Projects" },
      -- p = { "<cmd>Telescope projects<CR>", "Projects" },
      a = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Symbols" },
      d = {
        function()
          require("dash").search()
        end,
        "Search dash app",
      },
    },
    g = {
      name = "Git",
      c = { ":Git commit<CR>", "Fugitive commit" },
      s = { ":Git<CR>", "Fugitive status" },

      p = { ":Git push<CR>", "Fugitive push" },
      d = { "<cmd>Gvdiffsplit<CR>", "diffview" },
      a = { "<cmd>Diffview<CR>", "DiffviewOpen" },
    },
    z = {
      "<cmd>HopLineStart<CR>",
      "Hop line",
    },
    n = { "<cmd>w<CR>:noh<CR>", "Save" },
    -- q = { "<cmd>q<CR>", "quit" },
    -- t = {
    --   e = { ":UltestNearest<CR>", "Run nearest test" },
    --   u = { ":UltestSummary<CR>", "Open summary of test results" },
    --   a = { ":UltestClear<CR>", "Clear test results" },
    -- },
    l = {
      -- t = { ":call v:lua.toggle_diagnostics()<CR>", "Toggle virtualtext" },
      j = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev diagnostic" },
      n = { "<cmd>lua vim.diagnostic.goto_next({})<CR>", "Next diagnostic - any" },
      p = { "<cmd>lua vim.diagnostic.goto_prev({})<CR>", "Prev diagnostic - any" },
      d = { ":Telescope diagnostics<CR>", "Telescope diagnostics" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    },
    e = { ":CodeActionMenu<CR>", "Code action" },
  }, { prefix = "<leader>" })

  wk.register({
    m = {
      i = { "<Esc>:ChatGPTEditWithInstructions<CR>", "ChatGPT w/ last selection" },
    },
  }, { prefix = "<leader>", mode = "v" })

  wk.register({
    m = {
      e = { require("react-extract").extract_to_current_file, "Extract to current file" },
    }
  }, { prefix = "<leader>", mode = "v" })

  wk.register({
    g = {
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Go to type definition" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    ["<C-q>"] = { ":call QuickFixToggle()<CR>", "QF toggle" },
  }, {})

end

wk.register({
  m = {
    e = { require("react-extract").extract_to_current_file, "Extract to current file" },
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
