local _, libwin = ...;
libwin.window = libwin.window or {};
libwin.window.__index = libwin.window;

--[[
	Triggers when the mouse enters the widget
--]]
function libwin.window:on_enter(motion)
	libwin:print("controller:on_enter()");

	-- Update the model with the "HOVER" state background color ...
	self:set("BACKGROUND", self.style["HOVER"]["BACKGROUND"]);
	self:set("BORDERS", self.style["HOVER"]["BORDERS"]);
end

--[[
	Triggers when the mouse leaves the widget
--]]
function libwin.window:on_leave(motion)
	libwin:print("controller:on_leave()");

	-- Update the model with the "NORMAL" state background color ...
	self:set("BACKGROUND", self.style["NORMAL"]["BACKGROUND"]);
	self:set("BORDERS", self.style["NORMAL"]["BORDERS"]);
end

--[[
	Triggers when a mouse button is DOWN
--]]
function libwin.window:on_mouse_down(button)
	libwin:print("controller:on_mouse_down()");
end

--[[
	Triggers when a mouse button is UP
--]]
function libwin.window:on_mouse_up(button)
	libwin:print("controller:on_mouse_up()");
end

--[[
	Triggers when a mouse wheel is used
--]]
function libwin.window:on_mouse_wheel(delta)
	libwin:print("controller:on_mouse_wheel()" .. delta);
end

--[[
	Triggers when a key is PRESSED
--]]
function libwin.window:on_key_down(key)
	libwin:print("controller:on_key_down()" .. key);
end

--[[
	Triggers when a key is RELEASED
--]]

function libwin.window:on_key_up(key)
	libwin:print("controller:on_key_up()" .. key);
end
