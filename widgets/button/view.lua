local _, libwin = ...;
libwin.button = libwin.button or {};
libwin.button.__index = libwin.button;

--[[
	Create a button widget
	WARNING : no size or point is fixed because it should be the role of the layout
--]]
function libwin.button:new(parent, text)
	local self = {};
	setmetatable(self, libwin.button);

	-- Load widget style into the widget table
	self.style = libwin.style.DEFAULT["button"];
	
	--[[
		Main Frame
	--]]
	
	self.f = CreateFrame("Button", nil, parent);
	self.bg = self.f:CreateTexture(nil, "BACKGROUND");
	self.bg:SetColorTexture(
		unpack(self.style["NORMAL"]["BACKGROUND"])
	);
	self.bg:SetAllPoints();

	-- Text
	self.f:SetText(text);
	self.f:SetNormalFontObject("GameFontNormalLarge");
	self.f:SetHighlightFontObject("GameFontHighlightLarge");

	return self;
end
