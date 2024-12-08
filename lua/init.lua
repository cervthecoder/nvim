-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'lspconfig'.pyright.setup{}  -- Python support
require'lspconfig'.tsserver.setup{} -- JavaScript and TypeScript
require'lspconfig'.html.setup{}     -- HTML
require'lspconfig'.texlab.setup{}   -- LaTeX
require'lspconfig'.marksman.setup{} -- Markdown
require'lspconfig'.rust_analyzer.setup{}  -- Rust


--local cmp = require'cmp'
--cmp.setup({
--    snippet = {
--      expand = function(args)
--        require('luasnip').lsp_expand(args.body)
--      end,
--    },
--    mapping = cmp.mapping.preset.insert({
--      ['<Tab>'] = cmp.mapping.select_next_item(),
--      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.abort(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--    }),
--    sources = cmp.config.sources({
--      { name = 'nvim_lsp' },
--      { name = 'luasnip' },
--    }, {
--      { name = 'buffer' },
--    })
--})

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = "",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
 };
}


-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
     },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
 })

-- Key mapping to toggle nvim-tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Set window resizing mappings globally
vim.api.nvim_set_keymap('n', '>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '-', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '+', ':resize +2<CR>', { noremap = true, silent = true })

-- Load and configure gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitGutterAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change       = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitGutterDeleteChange', text = '‾', numhl='GitSignsDeleteChangeNr', linehl='GitSignsDeleteChangeLn'},
    changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Function to reload Neovim configuration and plugins
function ReloadConfig()
  local config_path = vim.fn.stdpath('config')
  local init_lua = config_path .. '/lua/init.lua'
  local init_vim = config_path .. '/init.vim'
  
  -- Save current hlsearch status
  local hls_status = vim.v.hlsearch

  -- Clear loaded packages, except nvim-tree
  for name,_ in pairs(package.loaded) do
    if name:match('^%a') and not name:match('nvim%-tree') then
      package.loaded[name] = nil
    end
  end

  -- Reload init.lua or init.vim if they exist
  if vim.fn.filereadable(init_lua) == 1 then
    dofile(init_lua)
    print("Lua configuration reloaded!")
  elseif vim.fn.filereadable(init_vim) == 1 then
    vim.cmd('source ' .. init_vim)
    print("Vimscript configuration reloaded!")
  else
    print("No init.lua or init.vim found in config directory")
  end

  -- Recompile packer if available
  if pcall(require, 'packer') then
    vim.cmd('PackerCompile')
    vim.cmd('PackerSync')
  end

  -- Restore hlsearch status
  if hls_status == 0 then vim.cmd('nohlsearch') end
end

-- Map <Leader>r to reload configuration and plugins
vim.api.nvim_set_keymap('n', '<Leader>r', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })

