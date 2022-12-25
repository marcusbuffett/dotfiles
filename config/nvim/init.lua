vim.g.mapleader = " "
-- vim.g.noswapfile = true
vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.10/bin/python3"
-- vim.cmd([[
-- let g:coq_settings = { "keymap.jump_to_mark": "<C-n>", 'auto_start': v:true, "display.icons.mode": "short" }
-- ]])
-- let g:coq_settings['display.preview.border'] = ["","",""," ","","",""," "]

vim.cmd([[packadd packer.nvim]])

vim.cmd([[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost init.lua source % | PackerCompile
augroup end
]])
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


require("packer").startup(function(use)
  -- use { "catppuccin/nvim", as = "catppuccin", config = function()
  --   vim.cmd.colorscheme "catppuccin"
  -- end }
  use({ "kazhala/close-buffers.nvim" })
  use({ "ggandor/flit.nvim",
    requires = "ggandor/leap.nvim",
    config = function()
      require('flit').setup {
        keys = { f = 'f', t = 'ø', T = 'ø', F = 'F' },
        -- -- A string like "nv", "nvo", "o", etc.
        -- labeled_modes = "v",
        -- multiline = true,
        -- -- Like `leap`s similar argument (call-specific overrides).
        -- -- E.g.: opts = { equivalence_classes = {} }
        -- opts = {}
      }
    end,
  })
  use({
    "amarakon/nvim-cmp-buffer-lines",
    config = function()
    end,
  })
  use {
    's1n7ax/nvim-window-picker',
    config = function()
      require 'window-picker'.setup()
    end,
  }
  use({
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
      require('onedark').load()
    end,
  })
  -- use({
  --   "folke/tokyonight.nvim",
  --   config = function()
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- })
  -- use({
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     vim.cmd([[colorscheme nightfox]])
  --   end,
  -- })
  -- use({
  --   'glepnir/zephyr-nvim',
  --   requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  --   config = function()
  --
  --     vim.cmd([[colorscheme zephyr]])
  --   end
  -- })
  -- use { "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     vim.cmd([[colorscheme gruvbox]])
  --   end }
  -- use({
  --   "folke/noice.nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- })
  use({ 'Ostralyan/scribe.nvim', config = function()
    require("scribe").setup({})
  end })
  use {
    "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }
  -- use({
  --   'glepnir/zephyr-nvim',
  --   config = function()
  --     vim.cmd([[colorscheme zephyr]])
  --   end
  -- })
  use("wbthomason/packer.nvim")
  use({ "tpope/vim-fugitive" })
  use({ "tpope/vim-abolish" })
  use({
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  })
  use({ "christoomey/vim-tmux-navigator", config = function() end })
  use({
    "phaazon/hop.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader>z", ":HopLineStart<CR>", {})
      vim.api.nvim_set_keymap("x", "<Leader>z", "<cmd>HopLineStart<CR>", {})
      require("hop").setup()
    end,
  })
  use({ "michaeljsmith/vim-indent-object" })
  use({ "jeetsukumaran/vim-indentwise" })
  use({ "tommcdo/vim-exchange" })
  use({ "simnalamburt/vim-mundo" })
  use({ "epilande/vim-react-snippets" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  -- use({ "p00f/nvim-ts-rainbow" })
  use({ "RRethy/nvim-treesitter-textsubjects" })
  -- use({
  --   "stevearc/aerial.nvim",
  --   config = function()
  --     require('aerial').setup({})
  --   end,
  -- })
  -- use({ "simrat39/symbols-outline.nvim", config = function() end })
  use({ "junegunn/fzf" })
  use({ "junegunn/fzf.vim" })
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
  use({
    "numtostr/FTerm.nvim",
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map("n", "<C-e>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
      map("t", "<C-e>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
    end,
  })
  use({
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
        case_insensitive = true,
        safe_labels = nil,
        labels = nil,
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
  })
  -- use({
  --   "ggandor/lightspeed.nvim",
  --   config = function()
  --     vim.cmd([[
  --       nmap s <Plug>Lightspeed_omni_s
  --     ]])
  --     require("lightspeed").setup({
  --       ignore_case = true,
  --       jump_to_unique_chars = false,
  --       safe_labels = {},
  --     })
  --   end,
  --   event = "BufRead",
  -- })
  -- 	use({
  -- 		"monaqa/dial.nvim",
  -- 		event = "BufRead",
  -- 		config = function()
  -- 			local dial = require("dial")
  -- 			vim.cmd([[
  -- 	     nmap <C-a> <Plug>(dial-increment)
  -- 	     nmap <C-x> <Plug>(dial-decrement)
  -- 	     vmap <C-a> <Plug>(dial-increment)
  -- 	     vmap <C-x> <Plug>(dial-decrement)
  -- 	     vmap g<C-a> <Plug>(dial-increment-additional)
  -- 	     vmap g<C-x> <Plug>(dial-decrement-additional)
  -- 	     ]])
  --
  -- 			dial.augends["custom#boolean"] = dial.common.enum_cyclic({
  -- 				name = "boolean",
  -- 				strlist = { "true", "false" },
  -- 			})
  -- 			table.insert(dial.config.searchlist.normal, "custom#boolean")
  --
  -- 			-- For Languages which prefer True/False, e.g. python.
  -- 			dial.augends["custom#Boolean"] = dial.common.enum_cyclic({
  -- 				name = "Boolean",
  -- 				strlist = { "True", "False" },
  -- 			})
  -- 			table.insert(dial.config.searchlist.normal, "custom#Boolean")
  -- 		end,
  -- 	})
  -- use({
  --   "tpope/vim-surround",
  --   keys = { "c", "d", "y" },
  -- })

  -- use({
  --   "phaazon/mind.nvim",
  --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   config = function()
  --     require("mind").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end
  -- })
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })
  use({ "aserowy/tmux.nvim" })
  use({
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
  })
  use { "anuvyklack/windows.nvim",
    requires = "anuvyklack/middleclass",
    config = function()
      require('windows').setup()
    end
  }
  use({ "stefandtw/quickfix-reflector.vim" })
  use({
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
  })
  use({ "akinsho/toggleterm.nvim" })
  use({
    "glepnir/dashboard-nvim",
    config = function()
      vim.g.dashboard_default_executive = "telescope"
    end,
  })
  -- use({ "L3MON4D3/LuaSnip" })
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  })
  use({ "rafamadriz/friendly-snippets" })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            -- vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
          map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
        end,
      })
    end,
  })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "williamboman/mason.nvim" })
  use({
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
  })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        sync_install = false,
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
        textsubjects = {
          enable = true,
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
          },
        },
      })
    end,
  })
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  })
  use({
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({ update_cwd = true, update_focused_file = {
        enable = true,
        update_cwd = true,
      } })
    end,
  })
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml" },
        silent_chdir = false,
        ignore_lsp = { "null-ls", "tsserver" },
        manual_mode = false,
      })
    end,
  })
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("telescope").load_extension("projects")

      require("telescope").setup({
        extensions = {
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
  })
  -- use({
  --   "ms-jpq/coq_nvim",
  --   config = function()
  --     vim.g.coq_settings = {
  --       auto_start = "shut-up",
  --       display = {
  --         icons = {
  --           mode = "none",
  --         },
  --       },
  --       keymap = {
  --         jump_to_mark = "<C-n>",
  --       },
  --       -- xdg = true,
  --       clients = {
  --         tmux = {
  --           enabled = false,
  --         },
  --         lsp = {
  --           resolve_timeout = 1.0,
  --         },
  --         tree_sitter = {
  --           slow_threshold = 0.025,
  --         },
  --         buffers = {
  --           match_syms = true,
  --           same_filetype = true,
  --         },
  --       },
  --       limits = {
  --         completion_auto_timeout = 1.0,
  --         completion_manual_timeout = 2.0,
  --       },
  --     }
  --   end,
  -- })
  -- use({
  --   "ms-jpq/coq.thirdparty",
  --   config = function()
  --     require("coq_3p")({
  --       { src = "nvimlua", short_name = "nLUA", conf_only = true },
  --     })
  --   end,
  -- })
  -- use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
  use({
    'hrsh7th/nvim-cmp',
    requires = {
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
  })
  -- use { "github/copilot.vim" }
  -- use {
  --   "zbirenbaum/copilot.lua",
  --   event = { "VimEnter" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()
  --     end, 100)
  --   end,
  -- }
  -- use {
  --   "zbirenbaum/copilot-cmp",
  --   module = "copilot_cmp",
  -- }
  use({
    "SmiteshP/nvim-gps",
    config = function()
      require("nvim-gps").setup()
    end,
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      local gps = require("nvim-gps")
      require("lualine").setup({
        sections = {
          lualine_c = {
            { "filename", gps.get_location, cond = gps.is_available },
          },
        },
      })
    end,
  })
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup({
        sources = {
          -- require("null-ls").builtins.formatting.stylua,
          require("null-ls").builtins.formatting.fixjson,
          -- require("null-ls").builtins.formatting.prettier,
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
  })
  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })
  use({ "kosayoda/nvim-lightbulb" })
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  })
  -- use({
  --   "ms-jpq/chadtree",
  --   branch = "chad",
  --   run = ":CHADdeps",
  -- })
  use({
    "napmn/react-extract.nvim",
    config = function()
      require("react-extract").setup()
    end,
  })
  use({
    "gbrlsnchs/telescope-lsp-handlers.nvim",
    config = function()
      require("telescope").load_extension("lsp_handlers")
    end,
  })
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })
  use({
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitlinker").setup({
        callbacks = {
          ["gitlab.tula.co"] = require("gitlinker.hosts").get_gitlab_type_url,
        },
      })
    end,
  })

  -- TODO: neotest
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
  use({
    "tomlion/vim-solidity",
  })
  -- use({
  -- 	"steelsojka/pears.nvim",
  -- 	config = function()
  -- 		require("pears").setup()
  -- 	end,
  -- })
  use({
    "andrewferrier/debugprint.nvim",
    config = function()
      require("debugprint").setup()
    end,
  })

end)

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
--
local wk = require("which-key")
wk.register({
  m = {
    name = "+file",
    n = { ":NvimTreeFindFileToggle<CR>", "Nvim tree" },
    e = { require("react-extract").extract_to_current_file, "Extract to current file" },
    c = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
    y = { ":Telescope neoclip<CR>", "Neoclip" },
    s = { ":ScribeOpen<CR>", "Scribe" },
    j = { ":ScribeOpen journal.md<CR>", "Scribe Journal" },
    -- s = { ":AerialOpen<CR>", "Symbols" },
  },
  h = { "ino!", "Clear highlights" },
  s = {
    name = "Searching",
    e = { "<cmd>Telescope find_files<cr>", "Find File" },
    g = { "<cmd>Rg<CR>", "Fuzzy search" },
    o = {
      ":Telescope current_buffer_fuzzy_find<CR>",
      "Fuzzy in buffer",
    },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    p = { "<cmd>Telescope projects<CR>", "Projects" },
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
  },
  z = {
    "<cmd>HopLineStart<CR>",
    "Hop line",
  },
  n = { "<cmd>w<CR>:noh<CR>", "Save" },
  -- q = { "<cmd>q<CR>", "quit" },
  t = {
    e = { ":UltestNearest<CR>", "Run nearest test" },
    u = { ":UltestSummary<CR>", "Open summary of test results" },
    a = { ":UltestClear<CR>", "Clear test results" },
  },
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

wk.register({
  ["<leader>"] = {
    z = {
      "<cmd>HopLineStart<CR>",
      "Hop line",
    },
  },
}, { mode = "x" })











-- require("lspconfig").rust_analyzer.setup({})
-- require("lspconfig").tsserver.setup()

-- vim.g.diagnostics_active = true
-- function _G.toggle_diagnostics()
--   if vim.g.diagnostics_active then
--     vim.g.diagnostics_active = false
--     vim.cmd([[LspRestart]])
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--       virtual_text = true,
--       signs = true,
--       underline = true,
--       update_in_insert = false,
--     })
--   else
--     vim.g.diagnostics_active = true
--     vim.cmd([[LspRestart]])
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--       virtual_text = false,
--       signs = true,
--       underline = true,
--       update_in_insert = false,
--     })
--   end
-- end


-- vim.cmd([[highlight LightspeedShortcut guibg=NONE guifg=#FF2F87 gui=NONE]])
-- vim.cmd([[highlight LightspeedLabel guibg=NONE guifg=#FF2F87 gui=NONE]])
-- vim.cmd([[highlight LightspeedLabelOverlapped guibg=NONE guifg=#FF2F87 gui=NONE]])