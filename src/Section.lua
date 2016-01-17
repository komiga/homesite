
local U = require "togo.utility"
local P = require "Pickle"
local Core = require "core/Core"
local Page = require "core/Page"
local NavItem = require "core/NavItem"
local M = U.module("Section")

local tpl_url = [[<a target="_blank" href="%s">%s</a>]]
local tpl_ref = [[<a class="para-ref" id="%s" href="#%s"></a>]]
local tpl_content = [[<h%d>%s%s</h%d>]]

local function make(page, name, text, url, id, level, add_nav)
	U.type_assert(page, Page)
	U.type_assert(name, "string")
	U.type_assert(text, "string")
	U.type_assert(url, "string", true)
	U.type_assert_any(id, {"boolean", "string"}, true)
	level = U.optional(U.type_assert(level, "number", true), 1)
	U.type_assert(add_nav, "boolean", true)

	if not U.is_type(id, "boolean") then
		id = id or Core.slugize(name)
	end
	if url then
		text = string.format(tpl_url, url, text)
	end
	if add_nav then
		table.insert(page.nav, NavItem(text, nil, "#" .. id))
	end
	local content = id and string.format(tpl_ref, id, id) or ""
	return string.format(tpl_content, level, text, content, level)
end

function M.nav(page, name, id, level)
	return make(page, name, "§ " .. name, nil, id, level, true)
end

function M.sub(page, name, url, id, level)
	return make(page, name, "∗ " .. name, url, id, level or 4)
end

function M.item(page, name, url, id, level)
	return make(page, name, name, url, id, level or 4)
end

return M
