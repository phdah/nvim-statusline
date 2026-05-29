local CBUFF = {}

CBUFF.nvim_Cbuffer_number = function(number)
    local idx = tonumber(number)
    if idx then
        local buffer = vim.fn.getbufinfo({ buflisted = 1 })[idx]
        if buffer and buffer.bufnr then
            vim.api.nvim_set_current_buf(buffer.bufnr)
        end
    end
end

vim.api.nvim_create_user_command('Cbuffernumber', function(opts)
    CBUFF.nvim_Cbuffer_number(opts.args)
end, { nargs = 1 })
