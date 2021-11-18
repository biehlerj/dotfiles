-- Make scripts executable on save
vim.cmd([[ au BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile> | endif ]])

-- Vertically center document when entering insert mode
vim.cmd([[ autocmd InsertEnter * norm zz ]])

-- Clean tex build files when leaving .tex document
vim.cmd([[ autocmd VimLeave *.tex !texclear % ]])
