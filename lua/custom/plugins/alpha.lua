return {
  {
    'goolord/alpha-nvim',
    dependencies = {
      'echasnovski/mini.icons',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('alpha').setup(require('custom.plugins._alpha-theme.theta').config)
    end,
  },
}
