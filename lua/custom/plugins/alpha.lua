return {
	{
		'goolord/alpha-nvim',
		dependencies = {
			'shatur/neovim-session-manager',
		},
		config = function ()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')

			 dashboard.section.header.val = {
			     "    Start Here                  ",
			     "                                ",
			     "    Put things here. ",
			     "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
				 "                                ",
			     "      End Here                  ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
				dashboard.button("c", "⚙️  Open Config (~/.config/nvim)", ":e ~/.config/nvim<CR>"),
				dashboard.button("l", "📦  Lazy Plugin Manager", ":Lazy<CR>"),
				dashboard.button("m", "🧱  Mason Package Manager", ":Mason<CR>"),
				dashboard.button("q", "🚪  Quit Neovim", ":qa<CR>"),
			}
			
			local function footer()
				local datetime = os.date("📅 %Y-%m-%d             ⏰ %H:%M:%S")

				local version = vim.version()
				local nvim_version = string.format("	  🧪 Neovim           v%d.%d.%d", version.major, version.minor, version.patch)

				local lazy_plugins = require("lazy").stats()
				local lazy_info = string.format("	  📦 Lazy Plugins     %d", lazy_plugins.count)

				local mason_path = vim.fn.stdpath("data") .. "/mason/packages"
				local handle = io.popen("ls -1 " .. mason_path .. " 2>/dev/null | wc -l")
				local lsp_count = handle and handle:read("*n") or 0
				if handle then
					handle:close()
				end
				local mason_info = string.format("	  🔧 Mason LSPs       %d", lsp_count)

				return {
					"",
					datetime,
					"",
					nvim_version,
					"",
					lazy_info,
					"",
					mason_info,
					"",
				}
			end
			dashboard.section.footer.val = footer()
			dashboard.section.footer.opts = {
				position = "center",
			}
			dashboard.section.footer.opts.hl = "Constant"
			alpha.setup(dashboard.opts)
		end
	},
};