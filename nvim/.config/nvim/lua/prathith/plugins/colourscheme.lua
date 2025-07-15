return {
    {
        -- CATPPUCCIN
        "catppuccin/nvim",
        name = "catppuccin", 
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato", 
                transparent_background = false,
                no_italic = true,
                default_integrations = true,
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                },
            })
            vim.cmd("colorscheme catppuccin")
        end,
    },

    {
        -- GRUVBOX
        "ellisonleao/gruvbox.nvim", 
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, 
                undercurl = true, 
                bold = true, 
                strikethrough = true, 
                invert_selection = false, 
                invert_signs = false, 
                invert_tabline = false, 
                transparent_mode = true,
                
            })
        end,
    },

}
