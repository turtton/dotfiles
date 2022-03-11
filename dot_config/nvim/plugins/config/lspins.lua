local lsp_servers = require("nvim-lsp-installer.servers")

local languages={'sumneko_lua', 'vimls'}
for _,language in ipairs(languages) do
	local isAvailable, server = lsp_servers.get_server(language)
	if not isAvailable then
		error(string.format("nvim-lsp-installer doesn't support %s server.", language))
		break
	end

	server:on_ready(function()
		local opts = {}
		if server.name == "sumneko_lua" then
			opts.hint= {
				enable = true,
			}
		end
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end
		server:setup(opts)
	end)

	if not server:is_installed() then
		server:install()
	end
end

local lsp_installer = require("nvim-lsp-installer")
-- Settings
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
