return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

    local ElijahWood_Fugitive = vim.api.nvim_create_augroup("ElijahWood_Fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = ElijahWood_Fugitive,
      pattern = "*",
      callback = function()
        if vim.bo.ft ~= "fugitive" then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        --Open up the status window via :Git
        --Move between files via <c-n>/<c-p>
        --Stage/unstage files via -
        --Start committing via cc whilst in the status window
        --Create commit message and save and close window. (I prefer :x)
        --You can also use zj and zk to move between sections
        --Using - on a section will stage/unstage all the files in that section
        --For more help with :Git see :h :Git or :G when in the :Git buffer.

        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>ga", function()
          vim.cmd("Git add .")
        end)
        vim.keymap.set("n", "<leader>gc", ":Git commit -m ")

        vim.keymap.set("n", "<leader>gp", function()
          vim.cmd("Git push origin")
        end)

        vim.keymap.set("n", "<leader>gu", vim.cmd("Git push -u origin")) -- NOTE: It allows me to easily set the branch i am pushing and any tracking
      end,
    })
  end,
}
