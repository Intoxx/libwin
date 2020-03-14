local _, libwin = ...;
libwin.line = libwin.line or {};
libwin.line.__index = libwin.line;

--[[
	Note : parent must be a WIDGET and have a frame named "f" inside.
--]]
function libwin.line:new(parent, point, alignment, width, thickness, color)
	local self = {};
	setmetatable(self, libwin.line);

	--[[
		Main frame
		FIX ME : change default SetPoint
		FIX ME : change default color
	--]]
	self.f = CreateFrame("Frame", nil, parent.f);

	if alignment == "VERTICAL" then
		self.alignment = "VERTICAL";
		self.f:SetSize(thickness, width);
	elseif alignment == "HORIZONTAL" then
		self.alignment = "HORIZONTAL";
		self.f:SetSize(width, thickness);
	end

	self.f:SetPoint(point);
	self.bg = self.f:CreateTexture(nil, "BORDER");
	self.bg:SetColorTexture(unpack(color));
	self.bg:SetAllPoints();

	--[[
		Events
	--]]
	self.f:SetScript("OnEnter", function(s, motion)
				 self:on_enter(motion);
	end);
	self.f:SetScript("OnLeave", function(s, motion)
				 self:on_leave(motion);
	end);

	return self;
end

--[[
	Change line color
--]]
function libwin.line:set_color(color)
	self.bg:SetColorTexture(unpack(color));
end

--[[
	Change line thickness
--]]
function libwin.line:set_thickness(thickness)
	if self.alignment == "VERTICAL" then
		self.f:SetWidth(thickness);
	elseif self.alignment == "HORIZONTAL" then
		self.f:SetHeight(thickness);
	end
end
