
local U = require "togo.utility"
local P = require "Pickle"
local M = require "core/Section"

local function grid_class(grid_modifier, grid_width)
	if grid_width < 10 then
		grid_width = grid_width * 10
	end
	return string.format("grid-%s grid-%s", grid_modifier, grid_width)
end

function M.grid_left(page, grid_width)
	return string.format([[<div class="%s">]], grid_class("left", grid_width or 60))
end

function M.grid_right(page, grid_width)
	return string.format([[<div class="%s">]], grid_class("right", grid_width or 40))
end

function M.close_grid(page)
	return [[</div>]]
end

function M.open(page, pre)
	table.insert(page.section_stack, pre and 2 or 1)
	return (
		(pre and string.format("<div class=\"%s\">\n", pre) or "") ..
		[[<div class="section">]]
	)
end

function M.close(page)
	local n = U.table_last(page.section_stack, true)
	if n == nil then
		P.error("section stack underflow")
	end
	local html = "</div>"
	while n > 1 do
		html = html .. "\n</div>"
		n = n - 1
	end
	table.remove(page.section_stack)
	return html
end

function M.nav(page, name, id, nav_text, level, post_text)
	return M.open(page) ..
		M.make(page, name, "§ " .. name, nav_text and ("§ " .. nav_text) or nil, nil, id, level, true, nil, post_text)
end

function M.nav_left(page, name, id, nav_text, grid_width, level, post_text)
	return M.open(page, grid_class("left", grid_width or 60)) ..
		M.make(page, name, "§ " .. name, nav_text and ("§ " .. nav_text) or nil, nil, id, level, true, nil, post_text)
end

function M.nav_right(page, name, id, nav_text, grid_width, level, post_text)
	return M.open(page, grid_class("right", grid_width or 40)) ..
		M.make(page, name, "§ " .. name, nav_text and ("§ " .. nav_text) or nil, nil, id, level, true, nil, post_text)
end

function M.sub(page, name, url, id, post_text, level)
	return M.make(page, name, name, nav_text, url, id, level or 3, false, "¶ ", post_text)
end

function M.item(page, name, url, id, post_text, level)
	return M.make(page, name, name, nav_text, url, id, level or 4, false, "» ", post_text)
end

return M
