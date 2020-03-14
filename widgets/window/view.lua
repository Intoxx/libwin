local _, libwin = ...;
libwin.window = libwin.window or {};
libwin.window.__index = libwin.window;

--[[
	Create a new window widget and register events
--]]
function libwin.window:new(parent, width, height, title)
	libwin:print("view:new()");
	
	local self = {};
	setmetatable(self, libwin.window);
	
	-- Load widget style into the widget table
	self.style = libwin.style.DEFAULT["window"];
	
	--[[
		Main frame
		FIX ME : change default SetPoint
	--]]
	self.f = CreateFrame("Frame", nil, parent);
	self.f:SetSize(width, height);
	self.f:SetPoint("CENTER");
	self.bg = self.f:CreateTexture(nil, "BACKGROUND");
	self.bg:SetColorTexture(
		unpack(self.style["NORMAL"]["BACKGROUND"])
	);
	self.bg:SetAllPoints();

	--[[ 
		BORDERS
		FIX ME : for now it only supports IN borders
		WARNING : TOP and BOTTOM are defined AFTER LEFT and RIGHT which will lead to them being draw over the last
		WARNING : when using the alpha channel, it will create darker areas when two borders are on top of each other
	--]]

	self.BORDERS = {};
	
	-- LEFT border
	self.BORDERS.LEFT = libwin.line:new(
		self,
		"LEFT",
		"VERTICAL",
		height,
		self.style["NORMAL"]["BORDERS"]["LEFT"].thickness,
		self.style["NORMAL"]["BORDERS"]["LEFT"].color
	);
	-- RIGHT border
	self.BORDERS.RIGHT = libwin.line:new(
		self,
		"RIGHT",
		"VERTICAL",
		height,
		self.style["NORMAL"]["BORDERS"]["RIGHT"].thickness,
		self.style["NORMAL"]["BORDERS"]["RIGHT"].color
	);
	-- TOP border
	self.BORDERS.TOP = libwin.line:new(
		self,
		"TOP",
		"HORIZONTAL",
		width,
		self.style["NORMAL"]["BORDERS"]["TOP"].thickness,
		self.style["NORMAL"]["BORDERS"]["TOP"].color
	);
	-- BOTTOM border
	self.BORDERS.BOTTOM = libwin.line:new(
		self,
		"BOTTOM",
		"HORIZONTAL",
		width,
		self.style["NORMAL"]["BORDERS"]["BOTTOM"].thickness,
		self.style["NORMAL"]["BORDERS"]["BOTTOM"].color
	);

	--[[
		TITLE bar
		FIX ME : add hovering support
		FIX ME : add drag support
		FIX ME : add optional minimize button 
		FIX ME : add optional maximize button 
		FIX ME : add optional close button 
		FIX ME : change default text color 
		FIX ME : change default text size 
	--]]
	self.TITLE = {};
	self.TITLE.f = CreateFrame("Frame", nil, self.f);
	self.TITLE.f:SetSize(width, self.style["NORMAL"]["TITLE"].height);
	self.TITLE.f:SetPoint("TOP");
	self.TITLE.bg = self.TITLE.f:CreateTexture(nil, "BACKGROUND");
	self.TITLE.bg:SetColorTexture(
		unpack(self.style["NORMAL"]["TITLE"]["BACKGROUND"])
	);
	self.TITLE.bg:SetAllPoints();
	self.TITLE.font = self.TITLE.f:CreateFontString(
		nil,
		"OVERLAY",
		"GameFontNormalLarge"
	);
	self.TITLE.font:SetText(title);
	self.TITLE.font:SetPoint("CENTER");

	--[[
	self.TITLE.f:SetText("Title");
	self.TITLE.f:SetNormalFontObject("GameFontNormalLarge");
	self.TITLE.f:SetHighlightFontObject("GameFontHighlightLarge");
	--]]

	--[[ 
		Events
		FIX ME : implement OnDragStart
		FIX ME : implement OnDragStop
		FIX ME : implement OnReceiveDrag
		FIX ME : implement OnKeyDown
		FIX ME : implement OnKeyUp
	--]]
	self.f:SetScript("OnEnter", function(s, motion)
				 self:on_enter(motion);
	end);
	self.f:SetScript("OnLeave", function(s, motion)
				 self:on_leave(motion);
	end);
	self.f:SetScript("OnMouseDown", function(s, button)
				 self:on_mouse_down(button);
	end);
	self.f:SetScript("OnMouseUp", function(s, button)
				 self:on_mouse_up(button);
	end);
	self.f:SetScript("OnMouseWheel", function(s, delta)
				 self:on_mouse_wheel(delta);
	end);
	self.f:EnableKeyboard(true);
	self.f:SetPropagateKeyboardInput(true);
	self.f:SetScript("OnKeyDown", function(s, key)
				 self:on_key_down(key);
	end);
	self.f:SetScript("OnKeyUp", function(s, key)
				 self:on_key_up(key);
	end);

	return self;
end

--[[
	Called when the model is updated to draw a part of the widget
--]]
function libwin.window:draw(key)
	libwin:print("view:draw()");

	--[[
		Get data from the model and update the view
	--]]
	
	if key == "BACKGROUND" then
		local bg = self:get("BACKGROUND");
		self.bg:SetColorTexture(unpack(bg)); 
	else
		local borders = self:get("BORDERS");

		-- LEFT border
		self.BORDERS.LEFT:set_color(borders.LEFT.color);
		-- RIGHT border
		self.BORDERS.RIGHT:set_color(borders.RIGHT.color);
		-- TOP border
		self.BORDERS.TOP:set_color(borders.TOP.color);
		-- BOTTOM border
		self.BORDERS.BOTTOM:set_color(borders.BOTTOM.color);
	end
end

function libwin.window:set_layout(layout)
	self.layout = layout;
	self.layout.f:SetSize(
		self.f:GetWidth(),
		self.f:GetHeight() - self.style["NORMAL"]["TITLE"].height
	);
	self.layout.f:SetPoint("TOPLEFT", self.TITLE.f, "BOTTOMLEFT");
end
