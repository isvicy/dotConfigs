local nvim_func = {}
local fn = vim.fn

function nvim_func.compile_run_cpp(orientation, size)
    if vim.bo.filetype == 'cpp' or vim.bo.filetype == 'c' then
        local file_path = fn.expand("%:p:h") .. "/" .. fn.expand("%")
        fn.execute(string.format("%s%s|:terminal", size, orientation))
        local terminal_id = vim.b.terminal_job_id
        fn.chansend(terminal_id, string.format("g++ %s && ./a.out\n", file_path))
    else
        error("Invalid filetype")
    end
end

return nvim_func
