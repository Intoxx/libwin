--[[
	window model
--]]

local _, libwin = ...;
libwin.window = libwin.window or {};
libwin.window.__index = libwin.window;

local DATA = {};

function libwin.window:set(key, value)
	libwin:print("model:set(" .. key .. ")");

	-- Update internal data
	DATA[key] = value;

	if key == "BORDERS" then
		print(unpack(DATA[key]));
	end
	
	-- Alert the view data has changed
	self:draw(key);
end

function libwin.window:get(key)
	libwin:print("model:get(" .. key .. ")");

	return DATA[key];
end
