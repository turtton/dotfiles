lua << EOF
function _G.metals_init_or_attach()
	local metals = require("metals")
	local metals_config = metals.bare_config()

	metals_config.init_options.statusBarProvider = "on"
	metals_config.settings = {
			showImplicitArguments = true,
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
