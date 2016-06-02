
local U = require "togo.utility"
local M = require "core/Section"

function M.nav(page, name, id, level)
	return M.make(page, name, "§ " .. name, nil, id, level, true)
end

function M.sub(page, name, url, id, level)
	return M.make(page, name, name, url, id, level or 4, false, "∗ ")
end

function M.item(page, name, url, id, level)
	return M.make(page, name, name, url, id, level or 4, false, "∗ ")
end

return M
