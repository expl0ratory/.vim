return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	opts = {
	    compile = false,             -- enable compiling the colorscheme
	    undercurl = true,            -- enable undercurls
	    commentStyle = { italic = true },
	    functionStyle = {},
	    keywordStyle = { italic = true},
	    statementStyle = { bold = true },
	    typeStyle = {},
	    transparent = true,         -- do not set background color
	    dimInactive = true,
	    overrides = function(colors)
            return {
                LineNr = { bg = 'NONE'},
                SignColumn = { bg = 'NONE'},
            }
	    end,
	},
}
