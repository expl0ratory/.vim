return {
    'mhinz/vim-grepper',
    name = 'vim-grepper',
    config = function()
        vim.g.grepper = {
            tools = {'ag'},
        }
    end
}
