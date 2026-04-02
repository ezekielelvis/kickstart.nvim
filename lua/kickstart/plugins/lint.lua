-- Linting

---@module 'lazy'
---@type LazySpec
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    local function has(bin)
      return vim.fn.executable(bin) == 1
    end

    local linters_by_ft = {
      markdown = { 'markdownlint' },
    }

    if has 'eslint_d' then
      linters_by_ft.javascript = { 'eslint_d' }
      linters_by_ft.javascriptreact = { 'eslint_d' }
      linters_by_ft.typescript = { 'eslint_d' }
      linters_by_ft.typescriptreact = { 'eslint_d' }
    elseif has 'eslint' then
      linters_by_ft.javascript = { 'eslint' }
      linters_by_ft.javascriptreact = { 'eslint' }
      linters_by_ft.typescript = { 'eslint' }
      linters_by_ft.typescriptreact = { 'eslint' }
    end

    if has 'ruff' then
      linters_by_ft.python = { 'ruff' }
    elseif has 'pylint' then
      linters_by_ft.python = { 'pylint' }
    end

    if has 'golangci-lint' then
      linters_by_ft.go = { 'golangcilint' }
    end

    if has 'cargo' then
      linters_by_ft.rust = { 'clippy' }
    end

    if has 'shellcheck' then
      linters_by_ft.sh = { 'shellcheck' }
      linters_by_ft.bash = { 'shellcheck' }
      linters_by_ft.zsh = { 'shellcheck' }
    end

    lint.linters_by_ft = linters_by_ft

    -- To allow other plugins to add linters to require('lint').linters_by_ft,
    -- instead set linters_by_ft like this:
    -- lint.linters_by_ft = lint.linters_by_ft or {}
    -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
    --
    -- However, note that this will enable a set of default linters,
    -- which will cause errors unless these tools are available:
    -- {
    --   clojure = { "clj-kondo" },
    --   dockerfile = { "hadolint" },
    --   inko = { "inko" },
    --   janet = { "janet" },
    --   json = { "jsonlint" },
    --   markdown = { "vale" },
    --   rst = { "vale" },
    --   ruby = { "ruby" },
    --   terraform = { "tflint" },
    --   text = { "vale" }
    -- }
    --
    -- You can disable the default linters by setting their filetypes to nil:
    -- lint.linters_by_ft['clojure'] = nil
    -- lint.linters_by_ft['dockerfile'] = nil
    -- lint.linters_by_ft['inko'] = nil
    -- lint.linters_by_ft['janet'] = nil
    -- lint.linters_by_ft['json'] = nil
    -- lint.linters_by_ft['markdown'] = nil
    -- lint.linters_by_ft['rst'] = nil
    -- lint.linters_by_ft['ruby'] = nil
    -- lint.linters_by_ft['terraform'] = nil
    -- lint.linters_by_ft['text'] = nil

    -- Create autocommand which carries out the actual linting
    -- on the specified events.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        -- avoid superfluous noise, notably within the handy LSP pop-ups that
        -- describe the hovered symbol using Markdown.
        if vim.bo.modifiable then lint.try_lint() end
      end,
    })

    vim.keymap.set('n', '<leader>ll', function() lint.try_lint() end, { desc = '[L]int current buffer' })
  end,
}
