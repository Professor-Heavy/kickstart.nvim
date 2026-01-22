return {
  {
    'shatur/neovim-session-manager',
    config = function()
      local config = require 'session_manager.config'
      require('session_manager').setup {
        load_include_current = true,
        autoload_mode = config.AutoloadMode.Disabled,
        autosave = false,
      }
    end,
  },
}
