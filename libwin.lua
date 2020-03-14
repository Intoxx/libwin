local _, libwin = ...;
libwin.VERSION = "0.1";
libwin.DEBUG = true;

SLASH_RELOADUI1 = "/rl";
SlashCmdList.RELOADUI = ReloadUI;

function libwin:print(msg)
	if libwin.DEBUG then
		print(msg);
	end
end

libwin:print("libwin version " .. libwin.VERSION .. " loaded.");

-- Test frame
local window = libwin.window:new(UIParent, 300, 200, "Window");
local hlayout = libwin.hlayout:new(window.f);
local btn_1 = libwin.button:new(hlayout.f, "A");
local btn_2 = libwin.button:new(hlayout.f, "B");
local btn_3 = libwin.button:new(hlayout.f, "C");
hlayout:add(btn_1, "A");
hlayout:add(btn_2, "B");
hlayout:add(btn_3, "C");
window:set_layout(hlayout);
hlayout:draw();
