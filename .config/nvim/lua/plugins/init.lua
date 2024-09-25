return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require "configs.lsp_signature"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "configs.null-ls"
        require "configs.lspconfig"
      end,
    },
  },
  {
    "github/copilot.vim",
    enable = false,
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "typescript-language-server",
        "prisma-language-server",
        "gopls",
        "golines",
        "goimports-reviser",
        "gofumpt",
        "json-lsp",
        "bash-language-server",
        "rust-analyzer",
        "black",
        "pyright",
        "mypy",
        "ruff",
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    event = "VeryLazy",
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {
      auto_enable = true,
      preview = {
        auto_preview = true,
      },
    },
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.db_ui_auto_execute_table_helpers = 1
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "http",
        "go",
        "gomod",
        "gowork",
        "gosum",
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
      })

      opts.incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader><CR>", -- Initialize selection
          node_incremental = "<leader><CR>", -- Increment to the upper named node
          scope_incremental = false,
          node_decremental = "<bs>", -- Decrement to the previous node
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    opts = {},
    config = function()
      require "configs.nvim-treesitter-textobjects"
    end,
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup {
        -- result = {
        --   behavior = {
        --     formatters = {
        --       json = "jq",
        --     },
        --   },
        -- },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-context",
  --   event = "VeryLazy",
  -- },
  {
    "tpope/vim-unimpaired",
    event = "VeryLazy",
  },
  {
    "rmagatti/auto-session",

    -- run on startup
    event = "VimEnter",
    config = function()
      require("auto-session").setup {
        log_level = vim.log.levels.ERROR,
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
        auto_session_use_git_branch = true,

        auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),

        -- ⚠️ This will only work if Telescope.nvim is installed
        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }

      -- Set mapping for searching a session.
      -- ⚠️ This will only work if Telescope.nvim is installed
      vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, {
        noremap = true,
      })
    end,
  },
  {
    "rust-lang/rust.vim",
    event = "VeryLazy",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   event = "VeryLazy",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
}
