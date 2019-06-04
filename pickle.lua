
local FS = require "togo.filesystem"
local P = require "Pickle"
local F = require "Pickle.Filter"
local Core = require "core/Core"
local NavItem = require "core/NavItem"
local Composition = require "src/Composition"
local Section = require "src/Section"

P.configure{
	build_path = "build/",
}

Core.setup_site(function(_ENV)
	title = "komiga"
	url = "http://komiga.com"
	run_years = "2012–2019"
	md_image = "http://lh4.googleusercontent.com/-fek5nINIJug/UMVJdFtlHVI/AAAAAAAAAHw/sb0KGgMaPPU/k-nrm-256.png"

	analytics_id = "UA-6565507-1"
	analytics_domain_name = nil
	human_date_format = "%d %B %Y"

	nav = {
		root     = NavItem(nil, "top"      , "#", "komiga.svg", "root"),
		backroot = NavItem(nil, "main page", "/", "komiga.svg", "root"),
		email    = NavItem("@", "email"    , "mailto:me@komiga.com", nil, nil, "single"),
		twitter  = NavItem(nil, "Twitter"  , "https://twitter.com/komiga", "twitter.svg"),
		github   = NavItem(nil, "GitHub"   , "https://github.com/komiga" , "github.svg"),

		allopoeia = NavItem("<span>Ω</span>", "Allopoeia", "http://allopoeia.komiga.com", nil, nil, "single omega", false),
	}
end)

P.filter("static", F.copy)
P.filter("layout", Composition.layout)
P.filter("page", Composition.page)

Core.setup_filters()
