local _, libwin = ...;
libwin.line = libwin.line or {};
libwin.line.__index = libwin.line;

--[[
	Triggers when the mouse enters the widget
--]]
function libwin.line:on_enter(motion)
	libwin:print("controller(line):on_enter()");
end

--[[
	Triggers when the mouse leaves the widget
--]]
function libwin.line:on_leave(motion)
	libwin:print("controller(line):on_leave()");
end
