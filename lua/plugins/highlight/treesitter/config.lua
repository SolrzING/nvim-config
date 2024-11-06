local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "lua",
            "luadoc",
            "python",
            "html",
            "css",
            "javascript",
            "bash",
        },
        highlight = {
            enable = true,
        },
        indent = {
            enable = false,
        },
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
            filetypes = {
                "html", "javascript", "typescript", "javascriptreact",
                "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
                "xml", "htmldjango", "php", "markdown", "astro",
                "glimmer", "handlebars", "hbs", "python", "lua",
            }
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                }
            }
        },
    })
end

return M
