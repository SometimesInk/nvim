-- Turn .h files into C
vim.api.nvim_create_augroup("HFileAutoCmd", { clear = true })

vim.api.nvim_create_autocmd("BufRead", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
  group = "HFileAutoCmd",
  pattern = "*.h",
  callback = function()
    -- Run the specified command
    vim.cmd("set filetype=c")
  end,
})

vim.filetype.add({
  pattern = {
    ["Makefile"] = "make",
    ["makefile"] = "make",
  },
  extension = {
    make = "make",
  },
})
