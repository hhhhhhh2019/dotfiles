require "config.settings"
require "config.lazy"

vim.schedule(function()
	require "config.mappings"
end)
