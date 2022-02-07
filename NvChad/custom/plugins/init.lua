-- Example plugins file!
-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
   {
      "williamboman/nvim-lsp-installer",
      config = function()
         require "custom.plugins.lspconfig"
      end,

      -- lazy load!
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lsp-installer"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
      opt = true,
   },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
      "vimwiki/vimwiki",
      config = function()
         require "custom.plugins.vimwiki"
      end,
   },
   { "wakatime/vim-wakatime" },
   {
      "lervag/vimtex",
      after = "nvim-lspconfig",
      ft = "tex",
      config = function()
         require "custom.plugins.vimtex"
      end,
   },
   {
      "luukvbaal/stabilize.nvim",
      config = function()
         require("stabilize").setup()
      end,
   },
}
