lua << EOF
function _G.metals_init_or_attach()
	local metals = require("metals")
	local metals_config = metals.bare_config()

	local woring_dir = vim.api.nvim_exec('echo getcwd()', true)
	metals_config.init_options.statusBarProvider = "on"
	metals_config.settings = {
			showImplicitArguments = true,
			ammoniteJvmProperties = {"-Xmx4G", "-Xms100M"},
			gradleScript = string.format("%s/gradlew", woring_dir),
	}

	metals.initialize_or_attach(metals_config)
end
EOF

augroup lsp
	au!
	au FileType scala,sbt, call v:lua.metals_init_or_attach()
augroup end

set shortmess+=c
set shortmess-=F
