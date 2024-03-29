--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.colorscheme = "catppuccin"
lvim.format_on_save = true
lvim.transparent_window = true
vim.opt.relativenumber = true
lvim.builtin.dap.active = true

local theme = require("lualine.themes.tokyonight")
theme.normal.c.bg = nil
lvim.builtin.lualine.options.theme = theme

lvim.builtin.nvimtree.setup.view.adaptive_size = true

-- vim.cmd [[set runtimepath+=~/Projects/spaceduck]]
-- vim.cmd [[colorscheme spaceduck]]


-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-M-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<S-M-h>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"

-- noice
-- lvim.keys.normal_mode["<S-Enter>"] = ":"
--  { desc = "Redirect Cmdline" })
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- local cmp = require "cmp"

-- lvim.builtin.cmp.mapping["<C-e>"] = function(fallback)
--   cmp.mapping.abort()
--   local copilot_keys = vim.fn["copilot#Accept"]()
--   if copilot_keys ~= "" then
--     vim.api.nvim_feedkeys(copilot_keys, "i", true)
--   else
--     fallback()
--   end
-- end


-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
  "haskell",
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "lua_ls",
  "jsonls",
}
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100", "--single-quote", "true" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
-- local dap = require('dap')
-- dap.adapters.cppdbg = {
--   id = 'cppdbg',
--   type = 'executable',
--   command = '/home/turutupa/.config/vscode-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "rustfmt", filetypes = { "rust" } },
})

lvim.builtin.sell_soul_to_devel = true

lvim.plugins = {
  { 'sheerun/vim-polyglot' },
  { "EdenEast/nightfox.nvim" },
  { 'projekt0n/github-nvim-theme' },
  { 'Rigellute/shades-of-purple.vim' },
  { 'nvim-treesitter/nvim-treesitter' },
  -- { 'nvim-treesitter/nvim-treesitter-context' },
  { 'nvim-treesitter/nvim-treesitter-context', require 'treesitter-context'.setup {
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'inner',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20,     -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  } },
  { 'JoosepAlviste/palenightfall.nvim' },
  { 'rose-pine/neovim' },
  -- { 'rose-pine/neovim', require('rose-pine').setup({
  --   disable_italics = true,
  -- }) },
  { 'junegunn/goyo.vim' },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  { 'loctvl842/monokai-pro.nvim' },
  -- { 'loctvl842/monokai-pro.nvim', require("monokai-pro").setup({
  --   filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  -- })
  -- },
  { 'martinsione/darkplus.nvim' },
  -- { 'github/copilot.vim' },
  { 'Mofiqul/vscode.nvim' },
  { 'sainnhe/gruvbox-material' },
  { 'luisiacc/gruvbox-baby' },
  { 'morhetz/gruvbox' },
  -- { "rebelot/kanagawa.nvim" },
  { "rebelot/kanagawa.nvim", require('kanagawa').setup({
    undercurl = true,
    transparent = false,
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = { italic = false, bold = false },
    functionStyle = { italic = false, bold = false },

    colors = {
      theme = {
        wave = {
          ui = {
            bg = "#1F1F28",
          }
        },
        all = {
          ui = {
            bg_gutter = "none"
          }
        }
      }
    },

    overrides = function(colors)
      local theme = colors.theme
      return {
        -- More uniform colors for the popup menu.
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },

        -- This will make floating windows look nicer with default borders.
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

        -- Block-like modern Telescope UI
        -- TelescopeTitle = { fg = theme.ui.special, bold = true },
        -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      }
    end,
  })
  },
  -- {
  --   "gelfand/copilot.vim",
  --   disable = not lvim.builtin.sell_soul_to_devel,
  --   config = function()
  --     -- copilot assume mapped
  --     vim.g.copilot_assume_mapped = true
  --     vim.g.copilot_no_tab_map = true
  --   end
  -- },
  -- {
  --   "hrsh7th/cmp-copilot",
  --   disable = not lvim.builtin.sell_soul_to_devel,
  --   config = function()
  --     lvim.builtin.cmp.formatting.source_names["copilot"] = "(Cop)"
  --     table.insert(lvim.builtin.cmp.sources, { name = "copilot" })
  --   end
  -- },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { "Mofiqul/dracula.nvim" },
  { "arcticicestudio/nord-vim" },
  { 'rmehri01/onenord.nvim' },
  { 'shaunsingh/nord.nvim' },
  { "folke/lsp-colors.nvim" },
  { 'marko-cerovac/material.nvim' },
  { 'fatih/vim-go' },
  { 'artanikin/vim-synthwave84' },
  { 'catppuccin/nvim' },
  { 'Yazeed1s/oh-lucy.nvim' },
  { 'ghifarit53/daycula-vim' },
  { 'safv12/andromeda.vim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "ellisonleao/gruvbox.nvim",
  --   require("gruvbox").setup({
  --     undercurl = true,
  --     underline = true,
  --     bold = false,
  --     italic = false,
  --     strikethrough = true,
  --     invert_selection = false,
  --     invert_signs = false,
  --     invert_tabline = false,
  --     invert_intend_guides = false,
  --     inverse = true,    -- invert background for search, diffs, statuslines and errors
  --     contrast = "hard", -- can be "hard", "soft" or empty string
  --     palette_overrides = {},
  --     overrides = {},
  --     dim_inactive = false,
  --     transparent_mode = false,
  --   })
  -- },
  -- { 'folke/tokyonight.nvim', require('tokyonight').setup({
  --   -- your configuration comes here
  --   -- or leave it empty to use the default settings
  --   style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  --   light_style = "day",    -- The theme is used when the background is set to light
  --   transparent = false,    -- Enable this to disable setting the background color
  --   terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  --   styles = {
  --     -- Style to be applied to different syntax groups
  --     -- Value is any valid attr-list value for `:help nvim_set_hl`
  --     comments = { italic = true },
  --     keywords = { italic = true },
  --     functions = {},
  --     variables = {},
  --     -- Background styles. Can be "dark", "transparent" or "normal"
  --     sidebars = "transparent",       -- style for sidebars, see below
  --     floats = "transparent",         -- style for floating windows
  --   },
  --   sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  --   day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  --   hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  --   dim_inactive = false,             -- dims inactive windows
  --   lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
  -- })
  -- },
  -- { 'navarasu/onedark.nvim' },
  -- { 'navarasu/onedark.nvim',
  --   require('onedark').setup {
  --     -- Main options --
  --     style = 'deep',               -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --     transparent = false,          -- Show/hide background
  --     term_colors = false,          -- Change terminal color as per the selected theme style
  --     ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  --     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  --     -- toggle theme style ---
  --     toggle_style_key = nil,                                                              -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  --     toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between

  --     -- Change code style ---
  --     -- Options are italic, bold, underline, none
  --     -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  --     code_style = {
  --       comments = 'none',
  --       keywords = 'none',
  --       functions = 'none',
  --       strings = 'none',
  --       variables = 'none'
  --     },

  --     -- Lualine options --
  --     lualine = {
  --       transparent = true, -- lualine center bar transparency
  --     },

  --     -- Custom Highlights --
  --     colors = {},     -- Override default colors
  --     highlights = {}, -- Override highlight groups

  --     -- Plugins Config --
  --     diagnostics = {
  --       darker = true,     -- darker colors for diagnostic
  --       undercurl = true,  -- use undercurl instead of underline for diagnostics
  --       background = true, -- use background color for virtual text
  --     },
  --   }
  -- },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          ptogglemode = "z,",
          stoggleup = "",
          vsplit = "<C-v>"
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 80,               -- Width of the floating window
        height = 20,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = 0,              -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil,     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
        vim.cmd("nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>"),
        vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
        vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
        vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>"),
      }
    end
  },
  { "npxbr/glow.nvim",           ft = { "markdown" } },
  { 'bluz71/vim-nightfly-colors' },
  { 'haishanh/night-owl.vim' },
  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup {
        show_numbers = true,         -- Enable 'number' for the window while peeking
        show_cursorline = true,      -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = true,          -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true,     -- Peeked line will be centered relative to window
      }
    end
  },
  { 'nvim-lua/plenary.nvim' },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      -- local lsp_installer_servers = require("nvim-lsp-installer.servers")
      -- local _, requested_server = lsp_installer_servers.get_server("rust_analyzer")
      require("rust-tools").setup({
        tools = {
          autoSetHints = true,
          -- hover_with_actions = true,
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {
            -- the border that is used for the hover window
            -- see vim.api.nvim_open_win()
            border = {
              { "╭", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╮", "FloatBorder" },
              { "│", "FloatBorder" },
              { "╯", "FloatBorder" },
              { "─", "FloatBorder" },
              { "╰", "FloatBorder" },
              { "│", "FloatBorder" },
            },

            -- whether the hover action window gets automatically focused
            -- default: false
            auto_focus = true,
          },
          runnables = {
            use_telescope = true,
          },
        },
        server = {
          on_init = require("lvim.lsp").common_on_init,
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            local rt = require("rust-tools")
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>lA", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
        -- debugging stuff
        dap = {
          adapter = {
            type = "executable",
            command = "lldb-vscode",
            name = "rt_lldb",
          },
        },
      })
    end,
    ft = { "rust", "rs" },
  },
  {
    "stevearc/dressing.nvim"
  },
  -- {
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup({
  --       -- add any options here
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         -- override = {
  --         --   ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         --   ["vim.lsp.util.stylize_markdown"] = true,
  --         --   ["cmp.entry.get_documentation"] = true,
  --         -- },
  --         signature = {
  --           enabled = false,
  --         },
  --         hover = {
  --           enabled = false,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true,         -- use a classic bottom cmdline for search
  --         command_palette = false,      -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false,       -- add a border to hover docs and signature help
  --       },
  --       messages = {
  --         view_warn = false,
  --         view_error = false,
  --         view = false,
  --       }
  --     })
  --   end,
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     -- "rcarriga/nvim-notify",
  --   }
  -- }
  -- { 'karb94/neoscroll.nvim',
  --   config = function()
  --     require('neoscroll').setup({
  --       -- All these keys will be mapped to their corresponding default scrolling animation
  --       mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
  --         '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  --       hide_cursor = true, -- Hide cursor while scrolling
  --       stop_eof = true, -- Stop at <EOF> when scrolling downwards
  --       respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = nil, -- Default easing function
  --       pre_hook = nil, -- Function to run before the scrolling animation starts
  --       post_hook = nil, -- Function to run after the scrolling animation ends
  --       performance_mode = false, -- Disable "Performance Mode" on all buffers.
  --     })
  --   end
  -- }
}

-- Additional Plugins
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
