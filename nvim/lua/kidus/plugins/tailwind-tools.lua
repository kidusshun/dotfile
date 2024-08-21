-- tailwind-tools.lua
return {
    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {}, -- your configuration
    },
    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true,
            },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        },
        opts = function(_, opts)
            -- Ensure opts.formatting is a table
            opts.formatting = opts.formatting or {}

            -- Ensure opts.formatting.format is a function, or provide a default
            local format_kinds = opts.formatting.format
                or function(entry, item)
                    return item
                end

            opts.formatting.format = function(entry, item)
                format_kinds(entry, item) -- add icons
                return require("tailwindcss-colorizer-cmp").formatter(entry, item)
            end
        end,
    },
}
