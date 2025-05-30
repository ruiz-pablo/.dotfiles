-- Global variables
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Options
vim.opt.mouse = 'a'
vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10
vim.opt.confirm = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indenting
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true

-- Helper functions
local function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in ipairs(windows) do
        if win.quickfix == 1 then
            vim.cmd('cclose')
            return
        end
    end
    vim.cmd('copen')
end

-- Remaps
vim.keymap.set('n', '<leader>n', ':cnext<CR>')
vim.keymap.set('n', '<leader>p', ':cprev<CR>')
vim.keymap.set('n', '<leader>b', ':ls<CR>:b ')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')
vim.keymap.set('n', '<leader>e', function() vim.cmd('Ex') end)
vim.keymap.set('n', '<leader>r', function() vim.cmd('source $MYVIMRC') end)
-- vim.keymap.set('n', '<leader>s', function() vim.cmd('source %') end)
vim.keymap.set('n', '<ESC>',     function() vim.cmd('noh') end)
vim.keymap.set('n', '<leader>l', toggle_quickfix)

vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>d', '"_d')

-- Remaps for Netrw
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'netrw',
    desc = 'Custom remaps for Netrw',
    callback = function()
        vim.keymap.set('n', 'l', '<CR>', {remap = true, buffer = true})
        vim.keymap.set('n', 'h', '-', {remap = true, buffer = true})
    end
})

-- Install lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup(
    {
        -- Guess indent
        'NMAC427/guess-indent.nvim',

        -- Telescope
        {
            'nvim-telescope/telescope.nvim',
            event = 'VimEnter',
            dependencies = {
                'nvim-lua/plenary.nvim',
                { 'nvim-telescope/telescope-ui-select.nvim' },
                { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
            },
            config = function()
                -- List of all key bindigns: C-/
                -- or ? in Normal mode
                -- For main menu do :Telescope

                require('telescope').setup {
                    -- You can put your default mappings / updates / etc. in here
                    --  All the info you're looking for is in `:help telescope.setup()`
                    --
                    -- defaults = {
                        --   mappings = {
                            --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                            --   },
                            -- },
                            -- pickers = {}
                            extensions = {
                                ['ui-select'] = {
                                    require('telescope.themes').get_dropdown(),
                                },
                            },
                        }

                        -- Enable Telescope extensions if they are installed
                        pcall(require('telescope').load_extension, 'fzf')
                        pcall(require('telescope').load_extension, 'ui-select')

                        -- See `:help telescope.builtin`
                        local builtin = require 'telescope.builtin'
                        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
                        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
                        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
                        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
                        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
                        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
                        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
                        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
                        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
                        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

                        -- Slightly advanced example of overriding default behavior and theme
                        vim.keymap.set('n', '<leader>/', function()
                            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                                winblend = 10,
                                previewer = false,
                            })
                        end, { desc = '[/] Fuzzily search in current buffer' })

                        -- It's also possible to pass additional configuration options.
                        --  See `:help telescope.builtin.live_grep()` for information about particular keys
                        vim.keymap.set('n', '<leader>s/', function()
                            builtin.live_grep {
                                grep_open_files = true,
                                prompt_title = 'Live Grep in Open Files',
                            }
                        end, { desc = '[S]earch [/] in Open Files' })

                        -- Shortcut for searching your Neovim configuration files
                        vim.keymap.set('n', '<leader>sn', function()
                            builtin.find_files { cwd = vim.fn.stdpath 'config' }
                        end, { desc = '[S]earch [N]eovim files' })
                    end,
                },

            },
            {
                ui = {
                    icons = vim.g.have_nerd_font and {} or {
                        cmd = '⌘',
                        config = '🛠',
                        event = '📅',
                        ft = '📂',
                        init = '⚙',
                        keys = '🗝',
                        plugin = '🔌',
                        runtime = '💻',
                        require = '🌙',
                        source = '📄',
                        start = '🚀',
                        task = '📌',
                        lazy = '💤 ',
                    },
                }
            }
        )
