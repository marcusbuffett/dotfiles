local work = vim.env.WORK or false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)



require("lazy").setup {
  concurrency = 10,

  spec = {
    { "tpope/vim-fugitive" },
    -- {
    --   "kylechui/nvim-surround",
    --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
    --   event = "VeryLazy",
    --   config = function()
    --     require("nvim-surround").setup({
    --       keymaps = {
    --         insert = "<C-g>s",
    --         insert_line = "<C-g>S",
    --         normal = "ys",
    --         normal_cur = "yss",
    --         normal_line = "yS",
    --         normal_cur_line = "ySS",
    --         visual = "s",
    --         visual_line = "gS",
    --         delete = "ds",
    --         change = "cs",
    --         change_line = "cS",
    --       },
    --
    --       -- Configuration here, or leave empty to use defaults
    --     })
    --   end
    -- },
    { "kazhala/close-buffers.nvim" },

    -- {
    --   "Bryley/neoai.nvim",
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --   },
    --   cmd = {
    --     "NeoAI",
    --     "NeoAIOpen",
    --     "NeoAIClose",
    --     "NeoAIToggle",
    --     "NeoAIContext",
    --     "NeoAIContextOpen",
    --     "NeoAIContextClose",
    --     "NeoAIInject",
    --     "NeoAIInjectCode",
    --     "NeoAIInjectContext",
    --     "NeoAIInjectContextCode",
    --   },
    --   keys = {
    --   },
    --   config = function()
    --     require("neoai").setup({
    --       -- Options go here
    --     })
    --   end,
    -- },
    -- {
    --   'NeogitOrg/neogit',
    --   dependencies = 'nvim-lua/plenary.nvim',
    --   config = function()
    --     require('neogit').setup()
    --   end
    -- },
    -- {
    --   "jackMort/ChatGPT.nvim",
    --   config = function()
    --     require("chatgpt").setup({
    --       -- optional configuration
    --     })
    --   end,
    --   dependencies = {
    --     "MunifTanjim/nui.nvim",
    --     "nvim-lua/plenary.nvim",
    --     "nvim-telescope/telescope.nvim"
    --   }
    -- },
    { "ilAYAli/scMRU.nvim" },
    -- {
    --   "amarakon/nvim-cmp-buffer-lines",
    --   config = function()
    --   end,
    -- },
    {
      "folke/tokyonight.nvim",
      opts = { style = "moon" },
      priority = 1000,
      lazy = false,
      config = function()
        vim.cmd [[colorscheme tokyonight-moon]]
        vim.cmd [[highlight FlashLabel guifg=#bb9af7 guibg=#3b4261]]
      end
    },
    --
    -- { "rebelot/kanagawa.nvim",
    --   config = function()
    --     vim.cmd("colorscheme kanagawa")
    --   end
    -- },
    -- {
    --   'AlexvZyl/nordic.nvim',
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     require('nordic').load()
    --   end
    -- },

    -- {
    --   "folke/tokyonight.nvim",
    --   lazy = false,
    --   priority = 1000,
    --   config = function()
    --     vim.cmd [[colorscheme tokyonight-night]]
    --   end
    -- },
    { "nvim-neotest/neotest",

      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "rouge8/neotest-rust",
        "marilari88/neotest-vitest"
      }
      , config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust")({
          }),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },

      })
    end },

    -- { "catppuccin/nvim",
    --   lazy = false,
    --   name = "catppuccin",
    --   priority = 1000,
    --
    --   config = function()
    --     require("catppuccin").setup {
    --       color_overrides = {
    --         all = {
    --           crust = "#495367",
    --         },
    --       }
    --     }
    --
    --     vim.cmd.colorscheme "catppuccin-mocha"
    --   end
    -- },

    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          log_level = "warn",
        })
      end,
    },
    -- { "Exafunction/codeium.vim" },
    {
      "oskarrrrrrr/symbols.nvim",
      config = function()
        local r = require("symbols.recipes")
        require("symbols").setup(r.DefaultFilters, r.AsciiSymbols, {
          -- custom settings here
          -- e.g. hide_cursor = false
        })
      end
    },


    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",  -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
        "ibhagwan/fzf-lua",              -- optional
      },
      config = function()
        require("neogit").setup({
          mappings = {
            commit_editor = {
              ["q"] = "Close",
              ["<c-c><c-c>"] = "Submit",
              ["<c-c><c-k>"] = "Abort",
            },
            commit_editor_I = {
              ["<c-c><c-c>"] = "Submit",
              ["<c-c><c-k>"] = "Abort",
            },
            rebase_editor = {
              ["p"] = "Pick",
              ["r"] = "Reword",
              ["e"] = "Edit",
              ["s"] = "Squash",
              ["f"] = "Fixup",
              ["x"] = "Execute",
              ["d"] = "Drop",
              ["b"] = "Break",
              ["q"] = "Close",
              ["o"] = "OpenCommit",
              ["gk"] = "MoveUp",
              ["gj"] = "MoveDown",
              ["<c-c><c-c>"] = "Submit",
              ["<c-c><c-k>"] = "Abort",
              ["[c"] = "OpenOrScrollUp",
              ["]c"] = "OpenOrScrollDown",
            },
            rebase_editor_I = {
              ["<c-c><c-c>"] = "Submit",
              ["<c-c><c-k>"] = "Abort",
            },
            finder = {
              -- ["<cr>"] = "Select",
              ["<c-c>"] = "Close",
              ["<esc>"] = "Close",
              ["<c-n>"] = "Next",
              ["<c-p>"] = "Previous",
              ["<down>"] = "Next",
              ["<up>"] = "Previous",
              ["<tab>"] = "MultiselectToggleNext",
              ["<s-tab>"] = "MultiselectTogglePrevious",
              ["<c-j>"] = "NOP",
              ["<CR>"] = "NOP",
            },
            -- Setting any of these to `false` will disable the mapping.
            popup = {
              ["?"] = "HelpPopup",
              ["A"] = "CherryPickPopup",
              ["D"] = "DiffPopup",
              ["M"] = "RemotePopup",
              ["P"] = "PushPopup",
              ["X"] = "ResetPopup",
              ["Z"] = "StashPopup",
              ["b"] = "BranchPopup",
              ["B"] = "BisectPopup",
              ["c"] = "CommitPopup",
              ["f"] = "FetchPopup",
              ["l"] = "LogPopup",
              ["m"] = "MergePopup",
              ["p"] = "PullPopup",
              ["r"] = "RebasePopup",
              ["v"] = "RevertPopup",
              ["w"] = "WorktreePopup",
            },
            status = {
              ["k"] = "MoveUp",
              ["j"] = "MoveDown",
              ["q"] = "Close",
              ["o"] = "OpenTree",
              ["I"] = "InitRepo",
              ["1"] = "Depth1",
              ["2"] = "Depth2",
              ["3"] = "Depth3",
              ["4"] = "Depth4",
              ["<CR>"] = "Toggle",
              ["x"] = "Discard",
              ["s"] = "Stage",
              ["S"] = "StageUnstaged",
              ["<c-s>"] = "StageAll",
              ["K"] = "Untrack",
              ["u"] = "Unstage",
              ["U"] = "UnstageStaged",
              ["$"] = "CommandHistory",
              ["Y"] = "YankSelected",
              ["<c-r>"] = "RefreshBuffer",
              ["e"] = "GoToFile",
              ["<c-v>"] = "VSplitOpen",
              ["<c-x>"] = "SplitOpen",
              ["<c-t>"] = "TabOpen",
              ["{"] = "GoToPreviousHunkHeader",
              ["}"] = "GoToNextHunkHeader",
              ["[c"] = "OpenOrScrollUp",
              ["]c"] = "OpenOrScrollDown",
            },
          },

        })
      end
    },
    { "tpope/vim-abolish" },
    {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
        require("telescope").load_extension("neoclip")
      end,
    },
    {
      "phaazon/hop.nvim",
      config = function()
        require("hop").setup({
          keys = "dstrneailhupfwbmo"
        })
      end,
    },
    { "michaeljsmith/vim-indent-object" },
    { "jeetsukumaran/vim-indentwise" },
    { "tommcdo/vim-exchange" },
    { "epilande/vim-react-snippets" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "RRethy/nvim-treesitter-textsubjects" },
    { "junegunn/fzf" },
    { "junegunn/fzf.vim" },
    {
      "ggandor/leap.nvim",
      dependencies = {
        "ggandor/flit.nvim",
      },
      config = function()
        require('flit').setup {
          keys = { f = 'f', F = 'F', t = 't', T = 'T' },
          -- A string like "nv", "nvo", "o", etc.
          labeled_modes = "v",
          multiline = true,
          -- Like `leap`s similar argument (call-specific overrides).
          -- E.g.: opts = { equivalence_classes = {} }
          opts = {}
        }
        -- local function get_windows_on_tabpage()
        --   local t = {}
        --   local ids = string.gmatch(vim.fn.string(vim.fn.winlayout()), "%d+")
        --   for id in ids do t[#t + 1] = id end
        --   return vim.tbl_map(function(id) return vim.fn.getwininfo(id)[1] end, t)
        -- end

        require("which-key").register({
          s = { function()
            require('leap').leap { target_windows = { vim.api.nvim_get_current_win() } }
          end, "leap" },
          S = {
            function()
              local focusable_windows = vim.tbl_filter(
                function(win)
                  return vim.api.nvim_win_get_config(win)
                      .focusable
                end,
                vim.api.nvim_tabpage_list_wins(0)
              )
              require('leap').leap { target_windows = focusable_windows }
            end
            , "leap" }
        }, {
          mode = "n"
        })
        --
        -- require("which-key").register({
        --   t = { "<Plug>(leap-backward)", "leap" }
        -- }, {
        --   mode = "n"
        -- })
        -- require("which-key").register({
        --   s = { "<Plug>(leap-forward)", "leap" }
        -- }, {
        --   mode = "n"
        -- })
        -- require("which-key").register({
        --   t = { "<Plug>(leap-backward)", "leap" }
        -- }, {
        --   mode = "x"
        -- })
        -- require("which-key").register({
        --   s = { "<Plug>(leap-forward)", "leap" }
        -- }, {
        --   mode = "x"
        -- })
        require('leap').setup {
          -- case_insensitive = true,
          safe_labels = {},
          labels = { "s", "t", "n", "e", "a", "i", "d", "r", "l", "h", "u", "p", "q", "g", "m", "b" },
          -- special_keys = {
          --   repeat_search = '<enter>',
          --   next_target   = '<enter>',
          --   prev_target   = '<tab>',
          --   next_group    = '<space>',
          --   prev_group    = '<tab>',
          --   eol           = '<space>',
          -- },
        }
        -- vim.cmd([[highlight LeapBackdrop guifg=#918474 guibg=none]])
        -- vim.cmd([[highlight LeapLabelPrimary guifg=#000000 guibg=#EBEDF1]])
      end
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
    {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup(
          {
            notify = false
          }
        )
      end,
    },
    {
      "aspeddro/gitui.nvim",
      opts = {},
    },
    {

      "lewis6991/gitsigns.nvim",
      event = { "BufReadPre", "BufNewFile" },
      opts = {
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- stylua: ignore start
          map("n", "]h", gs.next_hunk, "Next Hunk")
          map("n", "[h", gs.prev_hunk, "Prev Hunk")
          map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
          map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
          map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
          map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
          map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
          map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
          map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end,
            "Blame Line")
          map("n", "<leader>ghd", gs.diffthis, "Diff This")
          map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        end,
      },
    },
    {
      "RRethy/vim-illuminate",
      event = { "BufReadPost", "BufNewFile" },
      opts = {
        delay = 200,
        large_file_cutoff = 5000,
        large_file_overrides = nil,
      },
      config = function(_, opts)
        require("illuminate").configure(opts)

        local function map(key, dir, buffer)
          vim.keymap.set("n", key, function()
              require("illuminate")["goto_" .. dir .. "_reference"](false)
            end,
            {
              desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference",
              buffer =
                  buffer
            })
        end

        map("]]", "next")
        map("[[", "prev")

        -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
        vim.api.nvim_create_autocmd("FileType", {
          callback = function()
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
          end,
        })
      end,
      keys = {
        { "]]", desc = "Next Reference" },
        { "[[", desc = "Prev Reference" },
      },
    },



    { "sindrets/diffview.nvim" },
    {
      'neovim/nvim-lspconfig',
      dependencies = { 'saghen/blink.cmp' },
      config = function(_, opts)
        -- require'lspconfig'.rust_analyzer.setup{}

        local lspconfig = require('lspconfig')
        -- print("Setting up lspconfig", vim.inspect(opts))
        for server, config in pairs(opts.servers or {}) do
          config.capabilities = require('blink.cmp').get_lsp_capabilities(config
            .capabilities)
          lspconfig[server].setup(config)
        end
      end
    },


    { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x',
      -- dependencies = {
      --   { "kyazdani42/nvim-web-devicons" },
      --   { 'neovim/nvim-lspconfig' },
      --   "williamboman/mason-lspconfig.nvim",
      --   -- { 'hrsh7th/cmp-nvim-lsp' },
      --   -- { 'hrsh7th/nvim-cmp' },
      --   "williamboman/mason.nvim",
      --   { 'L3MON4D3/LuaSnip' },
      --
      -- },
      -- config = function()
      --   local lsp_zero = require('lsp-zero')
      --
      --
      --   lsp_zero.on_attach(function(client, bufnr)
      --     -- see :help lsp-zero-keybindings
      --     -- to learn the available actions
      --     lsp_zero.default_keymaps({ buffer = bufnr })
      --   end)
      --   require('mason').setup({
      --     ensure_installed = {
      --       "tsserver"
      --     }
      --   })
      --   require('mason-lspconfig').setup({
      --     ensure_installed = {
      --       -- 'rust_analyzer',
      --       'oxc',
      --       'lua_ls',
      --       -- 'tsserver',
      --     },
      --     handlers = {
      --       function(server_name)
      --         require('lspconfig')[server_name].setup({})
      --       end,
      --       rust_analyzer = function()
      --         require('lspconfig').rust_analyzer.setup({
      --           -- cargo = {
      --           --   extraArgs = { "--profile=rust-analyzer" },
      --           -- },
      --           -- checkOnSave = {
      --           --   extraArgs = {
      --           --     "--profile=rust-analyzer",
      --           --   },
      --           -- },
      --           settings = {
      --             ['rust-analyzer'] = {
      --               -- cargo = {
      --               --   extraArgs = { "--profile=rust-analyzer" },
      --               -- },
      --               checkOnSave = {
      --                 extraArgs = {
      --                   "--profile=rust-analyzer",
      --                 },
      --               },
      --             }
      --           },
      --           on_attach = function(client, bufnr)
      --             print('hello rust analyzer 3')
      --           end
      --         })
      --       end
      --     },
      --   })
      --   lsp_zero.setup()
      -- end },
    },
    {
      'stevearc/conform.nvim',
      config = function()
        -- function that checks if root of current git repo is "micro", and uses prettier if so, otherwise biome
        local function get_formatter()
          local root = vim.fn.system("git rev-parse --show-toplevel")
          local last_dir = vim.fn.fnamemodify(root, ":t")
          last_dir = last_dir:gsub("\n", "")
          if last_dir == "micro" then
            return { "prettier" }
          else
            return { "biome" }
          end
        end
        require("conform").setup({
          format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
          },

          formatters_by_ft = {
            lua = { "stylua" },
            -- Conform will run multiple formatters sequentially
            python = { "black" },
            -- Use a sub-list to run only the first available formatter
            javascript = get_formatter(),
            javascriptreact = get_formatter(),
            typescript = get_formatter(),
            html = get_formatter(),
            typescriptreact = get_formatter(),
          },
        })
      end
    },


    {
      "williamboman/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim"
      },
      -- keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
      build = ":MasonUpdate",
      config = function()
        -- print("mason")
        require("mason").setup({

        })
        require("mason-lspconfig").setup {
          ensure_installed = {
            "rust_analyzer",
            "lua_ls",
            "biome",
          },
          automatic_installation = true,
          handlers = {
            function(server_name)
              require('lspconfig')[server_name].setup({})
            end,
            rust_analyzer = function()
              require('lspconfig').rust_analyzer.setup({
                settings = {
                  ['rust-analyzer'] = {
                    checkOnSave = {
                      extraArgs = {
                        "--profile=rust-analyzer",
                      },
                    },
                    cargo = {
                      features = { "ssr" } -- Add this line
                    }

                  }
                },
                on_attach = function(client, bufnr)
                  -- print('hello rust analyzer 3')
                end
              })
            end
          },
        }
        require('mason-tool-installer').setup {
          ensure_installed = {
            "tailwindcss-language-server",
            -- Status: doesn't work with typescript config files
            -- "unocss-language-server",
            "emmet-language-server",
            "lua-language-server",
          },
          auto_update = true,
        }
        local lspconfig = require("lspconfig")
        -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
        local opts = {
          on_attach = function(client, bufnr)
            -- print("hello ", client.name)
            -- require("aerial").on_attach(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
              vim.cmd([[
                                    augroup LspFormatting
                                    autocmd! * <buffer>
                                    autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = false }
                                    augroup END
                                    ]])
            end
          end,
          -- capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern(".git", "init.lua"),

          diagnostics = {
            underline = true,
            update_in_insert = false,
            virtual_text = {
              spacing = 4,
              source = "if_many",
              prefix = "●",
              -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
              -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
              -- prefix = "icons",
            },
            severity_sort = true,
          },
          -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
          -- Be aware that you also will need to properly configure your LSP server to
          -- provide the inlay hints.
          inlay_hints = {
            enabled = false,
          },
          -- add any global capabilities here
          -- capabilities = {},
          -- Automatically format on save
          autoformat = true,
          -- Enable this to show formatters used in a notification
          -- Useful for debugging formatter issues
          format_notify = false,
          -- options for vim.lsp.buf.format
          -- `bufnr` and `filter` is handled by the LazyVim formatter,
          -- but can be also overridden when specified
          format = {
            formatting_options = nil,
            timeout_ms = nil,
          },

        }
        lspconfig.lua_ls.setup(opts)
        lspconfig.rust_analyzer.setup(opts)
        lspconfig.pyright.setup(opts)
        -- lspconfig.gopls.setup {}
        lspconfig.tailwindcss.setup(opts)
        lspconfig.ts_ls.setup {
          on_attach = function(client, bufnr)
            -- require("aerial").on_attach(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            -- client.server_capabilities.documentFormattingProvider = false
          end,
          handlers = {
            ["textDocument/definition"] = function(_, result, params)
              if result == nil or vim.tbl_isempty(result) then
                local _ = vim.lsp.log.info() and
                    vim.lsp.log.info(params.method, "No location found")
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
                    vim.fn.setqflist(vim.lsp.util
                      .locations_to_items(result))
                    vim.api.nvim_command("copen")
                  end
                end
              else
                vim.lsp.util.jump_to_location(result)
              end
            end,
          },
          -- capabilities = capabilities
        }
        vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
          local client = vim.lsp.get_client_by_id(ctx.client_id)
          if client and client.name == "graphql" then
            return
          end
          vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
        end
      end,
    },

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
      "https://gitlab.com/yorickpeterse/nvim-window.git",
      config = function()
        require('nvim-window').setup({
          -- The characters available for hinting windows.
          chars = { "s", "t", "n", "e", "a", "i", "d", "r", "l", "h", "u", "p", "q", "g", "m", "b" },
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
      -- run = ':TSUpdate',
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "tsx", "json", "rust", "python", "lua", "typescript", "javascript", "css", "scss", "html", "yaml", "graphql" },
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
      'windwp/nvim-autopairs',
      event = "InsertEnter",
      opts = {} -- this is equalent to setup({}) function
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      cmd = "Neotree",
      deactivate = function()
        vim.cmd([[Neotree close]])
      end,
      init = function()
        if vim.fn.argc() == 1 then
          local stat = vim.loop.fs_stat(vim.fn.argv(0))
          if stat and stat.type == "directory" then
            require("neo-tree")
          end
        end
      end,
      opts = {
        sources = { "filesystem", "buffers",
          -- "git_status",
          "document_symbols" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
        filesystem = {
          bind_to_cwd = false,
          follow_current_file = { enabled = true },
          use_libuv_file_watcher = true,
        },
        window = {
          mappings = {
            ["<space>"] = "none",
            ["/"] = "none",
            ["s"] = "none",
            ["?"] = "none",
          },
        },
        default_component_configs = {
          indent = {
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
        },
      },
      config = function(_, opts)
        require("neo-tree").setup(opts)
      end,
    },

    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    },
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
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "Cargo.toml", ".obsidian" },
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
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    {
      "nvim-telescope/telescope.nvim",
      dependencies = { { "nvim-lua/plenary.nvim" }, { "debugloop/telescope-undo.nvim" },
        { 'nvim-telescope/telescope-fzf-native.nvim' } },
      config = function()
        require("telescope").setup({
          defaults = {
            path_display = { "smart" },
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
              },
              vertical = {
                mirror = false,
              },
              width = 0.87,
              height = 0.80,
              preview_cutoff = 120,
            },

          },
          extensions = {
            fzf = {
              fuzzy = true,                   -- false will only do exact matching
              override_generic_sorter = true, -- override the generic sorter
              override_file_sorter = true,    -- override the file sorter
              case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            },
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- more options
              },
            },
            lsp_handlers = {
              disable = {
                -- ['textDocument/codeAction'] = true,

              },

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
                telescope = require('telescope.themes').get_dropdown({}),

                no_results_message = "No code actions available",
                prefix = "",
              },
            },
          },
        })
        require("telescope").load_extension("projects")
        require("telescope").load_extension("undo")
        require('telescope').load_extension('fzf')
      end,
    },

    {
      'saghen/blink.cmp',
      lazy = false, -- lazy loading handled internally
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',

      -- use a release tag to download pre-built binaries
      version = 'v0.*',
      -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = { preset = 'default',
          ['<CR>'] = { 'accept', 'fallback' },
        },

        completion = {
          list = {

            selection = {

              preselect = false,
            }
          },
          trigger = {

            show_on_trigger_character = true,

          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,

          },
        },
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        -- nerd_font_variant = 'mono',

        -- experimental auto-brackets support
        -- accept = { auto_brackets = { enabled = true } }

        -- experimental signature help support
        -- trigger = { signature_help = { enabled = true } }
      }
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "kyazdani42/nvim-web-devicons", },
      config = function()
        -- local gps = require("nvim-gps")
        require("lualine").setup({
          sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
          },

        })
      end,
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
      cmd = { "TroubleToggle", "Trouble" },
      opts = { use_diagnostic_signs = true },
      keys = {
        { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
        {
          "[q",
          function()
            if require("trouble").is_open() then
              require("trouble").previous({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cprev)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Previous trouble/quickfix item",
        },
        {
          "]q",
          function()
            if require("trouble").is_open() then
              require("trouble").next({ skip_groups = true, jump = true })
            else
              local ok, err = pcall(vim.cmd.cnext)
              if not ok then
                vim.notify(err, vim.log.levels.ERROR)
              end
            end
          end,
          desc = "Next trouble/quickfix item",
        },
      },
    },



    {
      "ruifm/gitlinker.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("gitlinker").setup({
          mappings = "<space>gy"

        })
      end,
    },
    {
      'Chaitanyabsprip/fastaction.nvim',
      ---@type FastActionConfig
      opts = {
        dismiss_keys = { "j", "k", "<c-c>", "q", "<esc>" },

        rust = {
          { pattern = 'If this is intentional', key = 'i', order = 1 },
        },
        typescript = {
          { pattern = 'to existing import declaration', key = 'a', order = 2 },
          { pattern = 'from module',                    key = 'i', order = 1 },
        }

      },
    },

    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      ---@type snacks.Config
      opts = {
        bigfile = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        scroll = {
          enabled = false,
          animate = {
            duration = { step = 15, total = 100 },
            easing = "linear",
          },
        },
      },
    },


    {
      "stevearc/dressing.nvim",
      lazy = true,
      init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.select(...)
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.input = function(...)
          require("lazy").load({ plugins = { "dressing.nvim" } })
          return vim.ui.input(...)
        end
      end,
    },


    {
      "andrewferrier/debugprint.nvim",
      config = function()
        require("debugprint").setup()
      end,
    },
    {
      "rcarriga/nvim-notify",
      keys = {
        {
          "<leader>un",
          function()
            require("notify").dismiss({ silent = true, pending = true })
          end,
          desc = "Dismiss all Notifications",
        },
      },
      opts = {
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
      },
    },
    { "MunifTanjim/nui.nvim", lazy = true },
    {
      "danielfalk/smart-open.nvim",
      -- branch = "0.1.x",
      config = function()
        require "telescope".load_extension("smart_open")
      end,
      dependencies = { "kkharji/sqlite.lua" }
    },
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
        vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>",
          { desc = "Spider-w" })
        vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>",
          { desc = "Spider-w" })
        vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>",
          { desc = "Spider-w" })
        vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>",
          { desc = "Spider-w" })
      end
    },
    {
      'echasnovski/mini.nvim',
      version = false,
      config = function()
        require('mini.bracketed').setup()
        print("Setting up auto root")
        require('mini.misc').setup()
        require('mini.misc').setup_auto_root()
        require('mini.ai').setup({
          n_lines = 1000,

        })
      end
    },

    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    },


    {
      "antosha417/nvim-lsp-file-operations",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-tree.lua",
      },
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
  },

}

-- END PLUGINS



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

vim.api.nvim_set_keymap("n", ",", "<cmd>q<CR>", {})
vim.api.nvim_set_keymap("n", "T", "<cmd>only<CR>", {})
-- vim.api.nvim_set_keymap("n", "zz", "ono!<esc>", {})


-- require("packer").startup(function(use)
--   -- use { "catppuccin/nvim", as = "catppuccin", config = function()
--   --   vim.cmd.colorscheme "catppuccin"
--   -- end }
-- end)

local opt = vim.opt
vim.g.mapleader = " "
opt.hidden = true      -- Enable background buffers
opt.joinspaces = false -- No double spaces with join
opt.autowriteall = true
opt.gdefault = true
opt.swapfile = false
opt.writebackup = true
opt.backup = false
opt.backupcopy = "auto"
opt.autoread = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = true             -- Confirm to save changes before exiting modified buffer
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true      -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3

-- opt.laststatus = 0
opt.list = false          -- Show some invisible characters (tabs...
opt.mouse = "a"           -- Enable mouse mode
opt.number = true         -- Print line number
opt.pumblend = 10         -- Popup blend
opt.pumheight = 10        -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4         -- Lines of context
opt.mousescroll = "ver:1,hor:10"

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true    -- Round indent
opt.shiftwidth = 2       -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false     -- Dont show mode since we have a statusline
opt.sidescrolloff = 8    -- Columns of context
opt.signcolumn = "yes"   -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true     -- Don't ignore case with capitals
opt.smartindent = true   -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true    -- Put new windows below current
opt.splitright = true    -- Put new windows right of current
opt.tabstop = 2          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = false                   -- Disable line wrap
opt.expandtab = true

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0


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
      { trig = "mep" },
      [[
      pub async fn new_route(
          endpoint_state: EndpointState,
          Json(request): Json<NewPathRequest>,
      ) -> EndpointResult<Response> {
        Ok(Json(todo!()).into_response())
      }
      ]]
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
  local snippets = {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    ls.parser.parse_snippet(
      { trig = "shm" },
      "const isMobile = useIsMobile()"
    ),
    ls.parser.parse_snippet(
      { trig = "seh" },
      "<Spacer height={${1}}/>"
    ),
    ls.parser.parse_snippet(
      { trig = "cl" },
      "console.log('${1}', ${2})"
    ),

    ls.parser.parse_snippet(
      { trig = "seif" },
      [[
      <Show when={${1}}>
      ${2}
      </Show>
      ]]
    ),
    ls.parser.parse_snippet(
      { trig = "sew" },
      "<Spacer width={${1}}/>"
    ),
    -- ls.parser.parse_snippet(
    --   { trig = "misp" },
    --   [[
    --     {intersperse(
    --       ${1}.map((x, i) => {
    --         return <div key={i} style={s()}></div>;
    --       }),
    --       (i) => {
    --         return <Spacer height={height}key={i} />;
    --       }
    --     )}
    --   ]]
    -- )
  }


  if work then
    table.insert(snippets, ls.parser.parse_snippet(
      { trig = "sed" },
      "<div className={\"${1}\"}>${2}</div>"
    )
    )
    table.insert(snippets, ls.parser.parse_snippet(
      { trig = "sedl" },
      "<div className={classNames(\"${1}\")}>${2}</div>"
    ))
  end
  if not work then
    table.insert(snippets, ls.parser.parse_snippet(
      { trig = "sed" },
      "<div class={clsx(\"${1}\")}>${2}</div>"
    ))
  end

  ls.add_snippets("typescriptreact", snippets)

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

-- and_snippets()

local wk = require("which-key")

wk.register({
  m = {
    -- e = { require("react-extract").extract_to_current_file, "Extract to current file" },
  },
  r = {
    d = { "\"+y", "Yank to system clioard" },
  }
}, { prefix = "<leader>", mode = "v" })

wk.register({
  ["<leader>"] = {
    r = {
      i = {
        "<cmd>HopLineStart<CR>",
        "Hop line",
      }
    },
  },
}, { mode = "x" })

wk.register({
  i = {
    e = { ":Chat code_edit ", "ChatGPT w/ last selection" },
    i = { ":Chat code_edit_4 ", "Chat gpt 4 edit" },
    a = { ":Chat complete ", "ChatGPT w/ last selection" },
  },
  r = {

    a = { function()
      require("fastaction").code_action()
    end, "Code action" },
  }
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
    s = { function() require("snacks").lazygit() end, "Lazygit" },
    a = { ":Git push<CR>", "Fugitive push" },
    n = { "<cmd>Gvdiffsplit<CR>", "diffview" },
    i = { "<cmd>DiffviewFileHistory %<CR>", "File history" },
    r = { function() require("gitsigns").blame_line { full = true } end, "Blame line" },
    e = { function() require("gitsigns").toggle_deleted() end, "Toggle deleted lines" },
    u = { "<cmd>Diffview<CR>", "DiffviewOpen" },
  },
  n = {
    name = "Navigation",
    r = { ":lua require('nvim-window').pick()<CR>", "Window picker" },
    s = { ":tabn<CR>", "Next tab" },
    t = { ":tabclose<CR>", "Close tab" },
    d = { "<cmd>only<CR>", "Close all others" },
    e = { "<cmd>q<CR>", "Close window" },
    a = { "<C-w>v", "Split vertically" },
    i = { "<C-w>s", "Split horizontally" },
  },
  t = {
    name = "lsp",
    r = { "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", "Next diagnostic error" },
    s = { "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", "Prev diagnostic error" },
    m = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
    g = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
    d = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
    e = { function()
      local current_path = vim.fn.expand("%:p:h")

      -- if require("obsidian").util.cursor_on_markdown_link() and current_path == "~/Obsidian/Second Brain" then
      --   vim.cmd.normal(vim.api.nvim_replace_termcodes(":ObsidianFollowLink<CR>", true, true, true))
      -- else
      vim.lsp.buf.definition()
      -- end
    end
    , "Definition" },
    i = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
    a = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
  },
  r = {
    name = "Misc / High Freq",
    a = { function()
      require("fastaction").code_action()
    end, "Code action" },
    e = { ":Telescope neoclip<CR>", "Neoclip" },
    n = { "<cmd>w<CR>:noh<CR>", "Save / Clear Highlights" },
    s = { ":SymbolsToggle<CR>", "Symbols" },
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
      "<Cmd>ObsidianQuickSwitch<CR>", "Search obsidian files"
    },
    d = {
      ":Telescope commands<CR>", "Command pallete",
    },
    e = {
      "<Cmd>ObsidianSearch<CR>", "Grep obsidian files"
    },
    s = { ":Neotree filesystem reveal<CR>", "Neotree toggle" },
    a = { function()
      require("spectre").open()
    end, "Spectre" },
    r = { ":ChatGPT<CR>", "ChatGPT" },
    t = { ":e ~/.config/nvim/init.lua<CR>", "Edit config" },
  },
  g = {
    y = { function()
      require "gitlinker".get_buf_range_url("n",
        { action_callback = require "gitlinker.actions".copy_to_clipboard })
    end, "gitlinker" },
  }
}, { prefix = "<leader>" })

wk.register({
  ["<Tab>"] = { "<C-^>", "Cycle between buffers" }
}, { mode = "n" })
vim.lsp.set_log_level("debug")

-- Add to your init.lua
local large_file_size_mb = 10

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
    local file = vim.fn.expand("<afile>")
    local size = vim.fn.getfsize(file)

    if size > large_file_size_mb * 1024 * 1024 or size == -2 then
      -- Disable heavy features for large files
      vim.opt_local.swapfile = false
      vim.opt_local.bufhidden = "unload"
      vim.opt_local.buftype = "nowrite"
      vim.opt_local.undolevels = -1

      -- Disable syntax highlighting
      vim.opt_local.syntax = "OFF"
      vim.api.nvim_create_autocmd("BufEnter", {
        buffer = 0,          -- Current buffer
        once = true,         -- Only run once
        callback = function()
          vim.cmd("LspStop") -- Or alternatively use vim.lsp.stop_client(vim.lsp.get_active_clients())
        end
      })


      -- Ignore FileType events
      local eventignore = vim.opt.eventignore:get()
      if not vim.tbl_contains(eventignore, "FileType") then
        table.insert(eventignore, "FileType")
        vim.opt.eventignore = eventignore
      end
    else
      -- Re-enable FileType events for normal files
      local eventignore = vim.opt.eventignore:get()
      local index = vim.tbl_contains(eventignore, "FileType")
      if index then
        table.remove(eventignore, index)
        vim.opt.eventignore = eventignore
      end
    end
  end
})
