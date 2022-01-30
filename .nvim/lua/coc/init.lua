if vim.fn.has("nvim-0.5.0") == 1 or vim.fn.has("patch-8.1.1564") == 1 then
  vim.cmd 'set signcolumn=number'
else
  vim.cmd 'set signcolumn=yes'
end

function _G.termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_s_tab()
  return vim.fn.pumvisible() == 1 and termcodes'<C-p>' or termcodes'<C-h>'
end

vim.api.nvim_set_keymap('i', '<S-TAB>', 'v:lua.smart_s_tab()', { expr = true, noremap = true})

function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

vim.api.nvim_set_keymap(
  'i',
  '<TAB>',
  "pumvisible() ? v:lua.termcodes('<C-n>') : v:lua.check_back_space() ? v:lua.termcodes('<TAB>') : coc#refresh()",
  { silent = true, expr = true }
)

-- Use <C-Space> to trigger completion
if vim.fn.has("nvim") == 1 then
  vim.api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
else
  vim.api.nvim_set_keymap('i', '<C-@>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
end

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { noremap = false, silent = true })

-- GoTo Code Navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { noremap = false, silent = true })

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap('n', 'K', ':lua show_documentation()<CR>', { noremap = true, silent = true })
function show_documentation()
  local filetype = vim.bo.filetype

  if filetype == 'vim' or filetype == 'help' then
    vim.api.nvim_command('h '.. filetype)
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn.CocActionAsync('doHover')
  end
end

-- Highlight the symbol and its references when holding the cursor.
vim.cmd 'autocmd CursorHold * silent call CocActionAsync("highlight")'

-- Symbol renaming.
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})

-- Use CTRL-s for selections ranges
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', {})
vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', {})

-- Formatting selected code
vim.api.nvim_set_keymap('n', '<leader>fmt', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('x', '<leader>fmt', '<Plug>(coc-format-selected)', {})

vim.cmd([[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionSync('showSignatureHelp')
  augroup end
]])

-- Applying codeAction to the selected region
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {})

-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {})

-- Run the Code Lens action on the current line.
vim.api.nvim_set_keymap('n', '<leader>cl', '<Plug>(coc-codelens-action)', {})

-- Add `:Format` command to format current buffer.
vim.cmd 'command! -nargs=0 Format :call CocActionAsync("format")'

-- Add `:Fold` command to fold current buffer.
vim.cmd 'command! -nargs=? Fold :call CocAction("fold", <f-args>)'

-- Add `"OR` command for organize imports of the current buffer.
vim.cmd 'command! -nargs=0 OR :call CocActionAsync("runCommand", "editor.action.organizeImport")'

-- Show all diagnostics
vim.api.nvim_set_keymap('n', '<space>a', ':<C-u>CocList diagnostics<cr>', { noremap = true, silent = true, nowait = true })
-- Manage extensions
vim.api.nvim_set_keymap('n', '<space>e', ':<C-u>CocList diagnostics<cr>', { noremap = true, silent = true, nowait = true })
-- Show commands
vim.api.nvim_set_keymap('n', '<space>c', ':<C-u>CocList commads<cr>', { noremap = true, silent = true, nowait = true })
-- Find symbol of current document.
vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList outline<cr>', { noremap = true, silent = true, nowait = true })
-- Search workspace symbols
vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { noremap = true, silent = true, nowait = true })
-- Do default action for next item
vim.api.nvim_set_keymap('n', '<space>j', ':<C-u>CocNext<cr>', { noremap = true, silent = true, nowait = true })
-- Do default action for previous item
vim.api.nvim_set_keymap('n', '<space>k', ':<C-u>CocPrev<cr>', { noremap = true, silent = true, nowait = true })
-- Resume latest coc list
vim.api.nvim_set_keymap('n', '<space>p', ':<C-u>CocListResume<cr>', { noremap = true, silent = true, nowait = true })

