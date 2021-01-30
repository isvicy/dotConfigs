local nvim_func = {}
local fn = vim.fn

function nvim_func.compile_run_cpp(orientation, size)
    local file_path = fn.expand("%:p:h") .. "/" .. fn.expand("%")
    local file_type = vim.bo.filetype
    fn.execute(string.format("%s%s|:terminal", size, orientation))
    local terminal_id = vim.b.terminal_job_id
    if file_type == 'cpp' or file_type == 'c' then
        fn.chansend(terminal_id, string.format("g++ %s && ./a.out\n", file_path))
    elseif file_type == 'go' then
        fn.chansend(terminal_id, string.format("go run %s\n", file_path))
    elseif file_type == 'rust' then
        fn.chansend(terminal_id, "cargo run\n")
    else
        error("Unsupported filetype")
    end
end

return nvim_func
