
local P = require "Pickle"
local F = require "Pickle.Filter"
local Core = require "core/Core"
local Layout = require "core/Layout"
local Page = require "core/Page"
local NavItem = require "core/NavItem"

P.configure{
	build_path = "build/",
}

Core.setup_site(function()
	title = "komiga"
	url = "http://komiga.com"
	run_years = "2012–2016"
	md_image = "http://lh4.googleusercontent.com/-fek5nINIJug/UMVJdFtlHVI/AAAAAAAAAHw/sb0KGgMaPPU/k-nrm-256.png"

	analytics_id = "UA-6565507-1"
	analytics_domain_name = nil
	human_date_format = "%d %B %Y"

	nav = {
		home     = NavItem(nil, "top"      , "#", "komiga.svg", "home"),
		backhome = NavItem(nil, "main page", "/", "komiga.svg", "home"),
		email    = NavItem("@", "email"    , "mailto:me@komiga.com"),
		github   = NavItem(nil, "GitHub"   , "https://github.com/komiga" , "github.svg"),
		twitter  = NavItem(nil, "Twitter"  , "https://twitter.com/komiga", "twitter.svg"),
	}
end)

P.filter("static", F.copy)
P.filter("layout", Layout)
P.filter("page", Page)

Core.setup_filters()
