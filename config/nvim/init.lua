local work = vim.env.WORK or false

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


local lsp_formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})


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
  -- {
  --   'NeogitOrg/neogit',
  --   dependencies = 'nvim-lua/plenary.nvim',
  --   config = function()
  --     require('neogit').setup()
  --   end
  -- },
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
    "amarakon/nvim-cmp-buffer-lines",
    config = function()
    end,
  },
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
      require("hop").setup({
        keys = "dstrneailhupfwbmo"
      })
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
  -- use({ "simrat39/symbols-outline.nvim", config = function() end })
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  {
    "epwalsh/obsidian.nvim",
    -- lazy = true,
    -- event = { "BufReadPre /Users/marcusbuffett/Documents/SecondBrain/*.md" },
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional, for completion.
      "hrsh7th/nvim-cmp",

      -- Optional, for search and quick-switch functionality.
      "nvim-telescope/telescope.nvim",

      -- Optional, an alternative to telescope for search and quick-switch functionality.
      -- "ibhagwan/fzf-lua"

      -- Optional, another alternative to telescope for search and quick-switch functionality.
      -- "junegunn/fzf",
      -- "junegunn/fzf.vim"

      -- Optional, alternative to nvim-treesitter for syntax highlighting.
      "godlygeek/tabular",
      "preservim/vim-markdown",
    },
    opts = {
      dir = "~/Obsidian/Second Brain", -- no need to call 'vim.fn.expand' here
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub("[^A-Za-z0-9-,'\".]", "")
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(suffix)
      end,
      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "Calendar/Dailies",
        -- Optional, if you want to change the date format for daily notes.
        date_format = "%Y-%m-%d"
      },
      completion = {
        new_notes_location = "000 Zettel",
      },
      mappings = {
      },
      disable_frontmatter = true,
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ "open", url }) -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,

      open_app_foreground = true,




      -- templates = {
      --   subdir = "Templates",
      --   date_format = "%Y-%m-%d-%a",
      --   time_format = "%H:%M"
      -- },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)
    end,
  },
  -- {
  --   "numtostr/FTerm.nvim",
  --   config = function()
  --     local map = vim.api.nvim_set_keymap
  --     local opts = { noremap = true, silent = true }
  --
  --     map("n", "<C-e>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
  --     map("t", "<C-e>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
  --   end,
  -- },
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
        s = { function()
          local current_window = vim.fn.win_getid()
          require('leap').leap { target_windows = { current_window } }
        end, "leap" },
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
  -- -- { "anuvyklack/windows.nvim",
  -- --   dependencies = "anuvyklack/middleclass",
  -- --   config = function()
  -- --     require('windows').setup()
  -- --   end
  -- -- },
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
  -- -- {
  -- --   "glepnir/dashboard-nvim",
  -- --   config = function()
  -- --     vim.g.dashboard_default_executive = "telescope"
  -- --   end,
  -- -- },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup()
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup()
    end
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
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
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
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
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




  { "kyazdani42/nvim-web-devicons" },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({

      })
      require("mason-lspconfig").setup {
        ensure_installed = {
          "rust_analyzer",
        },
      }
      require('mason-tool-installer').setup {

        -- a list of all tools you want to ensure are installed upon
        -- start; they should be the names Mason uses for each tool
        ensure_installed = {
          "tailwindcss-language-server",
          -- Status: doesn't work with typescript config files
          -- "unocss-language-server",
          "emmet-language-server",
          "lua-language-server",
        },

        auto_update = true,
      }
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
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim",  opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
      },
      -- "creativenull/efmls-configs-nvim"
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      local opts = {
        on_attach = function(client, bufnr)
          -- print(vim.inspect(client.server_capabilities))
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
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('.git'),
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
        capabilities = {},
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
      -- local biome = require('efmls-configs.formatters.biome')
      -- local fixjson = require('efmls-configs.formatters.fixjson')
      -- local languages = {
      --   typescript = { biome },
      --   typescriptreact = { biome },
      --   json = { fixjson },
      --   jsonc = { fixjson },
      -- }
      --
      -- -- Or use the defaults provided by this plugin
      -- -- check doc/SUPPORTED_LIST.md for the supported languages
      -- --
      -- -- local languages = require('efmls-configs.defaults').languages()
      --
      -- local efmls_config = {
      --   filetypes = vim.tbl_keys(languages),
      --   settings = {
      --     rootMarkers = { '.git/' },
      --     languages = languages,
      --   },
      --   init_options = {
      --     documentFormatting = true,
      --     documentRangeFormatting = true,
      --   },
      -- }
      --
      -- lspconfig.efm.setup(vim.tbl_extend('force', efmls_config, opts))

      lspconfig.rust_analyzer.setup(opts)
      if not work then
        lspconfig.biome.setup(opts)
      end
      if work then
        if vim.fn.executable('relay-compiler') == 1 then
          -- copy = vim.deepcopy(opts)
          lspconfig.relay_lsp.setup(opts)
        end
      end

      lspconfig.lua_ls.setup(opts)
      lspconfig.pyright.setup(opts)
      lspconfig.gopls.setup {}
      if work then
        require 'lspconfig'.eslint.setup({
          settings = {
            packageManager = 'yarn'
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        })
      end
      lspconfig.tailwindcss.setup(opts)
      -- lspconfig.unocss.setup(opts)

      lspconfig.emmet_language_server.setup(opts)


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
    run = ':TSUpdate',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "tsx", "json", "rust", "python", "lua" },
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
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
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
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
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
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },







  -- {
  --   "axkirillov/easypick.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     local easypick = require("easypick")
  --
  --     -- only required for the example to work
  --     local base_branch = "master"
  --
  --     easypick.setup({
  --       pickers = {
  --         -- add your custom pickers here
  --         -- below you can find some examples of what those can look like
  --
  --         -- list files inside current folder with default previewer
  --         {
  --           -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
  --           name = "ls",
  --           -- the command to execute, output has to be a list of plain text entries
  --           command = "ls",
  --           -- specify your custom previwer, or use one of the easypick.previewers
  --           previewer = easypick.previewers.default()
  --         },
  --
  --         -- diff current branch with base_branch and show files that changed with respective diffs in preview
  --         {
  --           name = "changed_files",
  --           command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
  --           previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
  --         },
  --
  --         -- list files that have conflicts with diffs in preview
  --         {
  --           name = "conflicts",
  --           command = "git diff --name-only --diff-filter=U --relative",
  --           previewer = easypick.previewers.file_diff()
  --         },
  --       }
  --     })
  --   end
  -- },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
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
  { 'nvim-telescope/telescope-fzf-native.nvim',    build = 'make' },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { { "nvim-lua/plenary.nvim" }, { "debugloop/telescope-undo.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim' } },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "smart" },
          prompt_prefix = "   ",
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
      require("telescope").load_extension("projects")
      require("telescope").load_extension("undo")
      require('telescope').load_extension('fzf')
    end,
  },
  { "folke/neodev.nvim",      opts = {} },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      print("luasnip loaded, setting keymaps")
      vim.keymap.set({ "i" }, "<C-n>", function()
        return require("luasnip").jump(1)
      end, { silent = true })
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip'
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", },
    config = function()
      -- local gps = require("nvim-gps")
      require("lualine").setup({
        sections = {
          -- lualine_x = {
          --   -- {
          --   --   require("noice").api.status.message.get_hl,
          --   --   cond = require("noice").api.status.message.has,
          --   -- },
          --   -- {
          --   --   require("noice").api.status.command.get,
          --   --   cond = require("noice").api.status.command.has,
          --   --   color = { fg = "#ff9e64" },
          --   -- },
          --   -- {
          --   --   require("noice").api.status.mode.get,
          --   --   cond = require("noice").api.status.mode.has,
          --   --   color = { fg = "#ff9e64" },
          --   -- },
          --   -- {
          --   --   require("noice").api.status.search.get,
          --   --   cond = require("noice").api.status.search.has,
          --   --   color = { fg = "#ff9e64" },
          --   -- },
          -- },
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
    "nvimtools/none-ls.nvim",
    config = function()
      local sources = {
        -- require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.fixjson,
        -- require("null-ls").builtins.formatting.prettier_d_slim,
        require("null-ls").builtins.formatting.black.with {
          cwd = function(params)
            return vim.fn.fnamemodify(params.bufname, ':h')
          end,
        },
        require("null-ls").builtins.formatting.ruff,
        require("null-ls").builtins.formatting.ruff,
        -- require("null-ls").builtins.formatting.eslint_d.with({
        -- }),
        -- require("null-ls").builtins.diagnostics.sqlfluff.with({
        --   extra_args = { "--dialect", "postgres" }, -- change to your dialect
        -- }),
        -- require("null-ls").builtins.diagnostics.eslint_d,
        -- require("null-ls").builtins.completion.spell,
      }
      if work then
        table.insert(sources, require("null-ls").builtins.formatting.prettier)
      end
      if not work then
        table.insert(sources, require("null-ls").builtins.formatting.biome)
      end
      require("null-ls").setup({
        debug = true,
        sources = sources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = lsp_formatting_augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = lsp_formatting_augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
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
        callbacks = {
          ["gitlab.tula.co"] = require("gitlinker.hosts").get_gitlab_type_url,

        },
        mappings = "<space>gy"

      })
    end,
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
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --     },
  --     routes = {
  --       {
  --         filter = {
  --           event = "msg_show",
  --           any = {
  --             { find = "%d+L, %d+B" },
  --             { find = "; after #%d+" },
  --             { find = "; before #%d+" },
  --           },
  --         },
  --         view = "mini",
  --       },
  --     },
  --     popupmenu = {
  --       enabled = false,
  --     },
  --     presets = {
  --       bottom_search = true,
  --       command_palette = true,
  --       long_message_to_split = true,
  --       inc_rename = true,
  --     },
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "<leader>ba", function() require("noice").cmd("all") end, desc = "Noice All" },
  --     {
  --       "<leader>bd",
  --       function() require("noice").cmd("dismiss") end,
  --       desc =
  --       "Dismiss All"
  --     },
  --   },
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
-- opt.laststatus = 0
opt.list = false           -- Show some invisible characters (tabs...
opt.mouse = "a"            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = true  -- Relative line numbers
opt.scrolloff = 4          -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 2         -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = false       -- Dont show mode since we have a statusline
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = "yes"     -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.smartindent = true     -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true      -- Put new windows below current
opt.splitright = true      -- Put new windows right of current
opt.tabstop = 2            -- Number of spaces tabs count for
opt.termguicolors = true   -- True color support
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

add_snippets()

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
    t = { ":tabclose<CR>", "Close tab" },
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
    e = { function()
      local current_path = vim.fn.expand("%:p:h")

      if require("obsidian").util.cursor_on_markdown_link() and current_path == "~/Obsidian/Second Brain" then
        vim.cmd.normal(vim.api.nvim_replace_termcodes(":ObsidianFollowLink<CR>", true, true, true))
      else
        vim.lsp.buf.definition()
      end
    end
    , "Definition" },
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
      require "gitlinker".get_buf_range_url("n", { action_callback = require "gitlinker.actions".copy_to_clipboard })
    end, "gitlinker" },
  }
}, { prefix = "<leader>" })
wk.register({
  ["<F8>"] = { "<cmd>w<CR>:noh<CR>", "Save / Clear Highlights" }

}, { mode = "n" })
wk.register({
  ["<F8>"] = { "<esc><cmd>w<CR><cmd>noh<CR><esc>", "Save / Clear Highlights" }
}, { mode = "i" })
