return {
    'nvim-treesitter/nvim-treesitter-context' ,
    name = 'nvim-treesitter-context',
    deps = {'nvim-treesitter'},
    opts = {
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scop = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20
    }
}
