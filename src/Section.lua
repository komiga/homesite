
local U = require "togo.utility"
local P = require "Pickle"
local Core = require "core/Core"
local Page = require "core/Page"
local NavItem = require "core/NavItem"
local M = U.module("Section")

local tpl_url = [[<a target="_blank" href="%s">%s</a>]]
local tpl_content = [[<h%d>%s<a class="para-ref" id="%s" href="#%s"></a></h%d>]]

local function make(nav, page, name, url, id, level)
	U.type_assert(page, Page)
	U.type_assert(name, "string")
	U.type_assert(url, "string", true)
	U.type_assert(id, "string", true)
	level = U.optional(U.type_assert(level, "number", true), 1)

	id = id or Core.slugize(name)
	local text
	if nav then
		text = "§ " .. name
		table.insert(page.nav, NavItem(text, nil, "#" .. id))
	else
		text = url and string.format(tpl_url, url, name) or name
	end
	return string.format(tpl_content, level, text, id, id, level)
end

function M.nav(page, name, url, id, level)
	return make(true, page, name, url, id, level)
end

function M.item(page, name, url, id, level)
	return make(false, page, name, url, id, level or 4)
end

return M
