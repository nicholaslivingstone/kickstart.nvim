return {
  {
    "snakemake/snakemake",
    ft = "snakemake",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/misc/vim")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "snakemake",
        callback = function()
          vim.opt_local.expandtab = true
          vim.opt_local.shiftwidth = 4
          vim.opt_local.tabstop = 4
          vim.opt_local.softtabstop = 4
        end,
      })
    end,
    init = function(plugin)
      require("lazy.core.loader").ftdetect(plugin.dir .. "/misc/vim")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        ["smk"] = {
          icon = "󱔎",
          color = "#6db33f",
          name = "Snakemake",
        },
      },
      override_by_filename = {
        ["Snakefile"] = {
          icon = "󱔎",
          color = "#6db33f",
          name = "Snakefile",
        },
      },
    },
  },
}
