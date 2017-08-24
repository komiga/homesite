
local U = require "togo.utility"
local P = require "Pickle"
local Core = require "core/Core"
local Layout = require "core/Layout"
local Page = require "core/Page"
local M = U.module("Composition")

local page_vf = P.ValueFilter("KomigaPage")
:filter("body_class", "string")

M.page = Page.compose(page_vf, nil, {
	body_class = nil,
})

local layout_vf = P.ValueFilter("KomigaLayout")

M.layout = Layout.compose(layout_vf, {
})

return M
