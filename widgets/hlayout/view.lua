local _, libwin = ...;
libwin.hlayout = libwin.hlayout or {};
libwin.hlayout.__index = libwin.hlayout;

function libwin.hlayout:new(parent)
	local self = {};
	setmetatable(self, libwin.hlayout);
	self.widgets = {};
	self.widget_count = 0;

	-- Basic properties
	self.f = CreateFrame("Frame", nil, parent);
	self.f:SetSize(parent:GetWidth(), parent:GetHeight());
	--[[
	self.bg = self.f:CreateTexture(nil, "BACKGROUND");
	self.bg:SetColorTexture(0.0, 0.0, 0.0);
	self.bg:SetAllPoints();
	--]]

	return self;
end

--[[
	Add a widget to the list
	FIX ME : It should send an on_add event to the controller
	FIX ME : Every widget should be unique
--]]
function libwin.hlayout:add(widget, name)
	self.widget_count = self.widget_count + 1;
	self.widgets[self.widget_count] = widget;
end

--[[
	Called when the layout change (widgets are added / removed) to recalculate
	FIX ME : model should call this after the controller receives an event
--]]
function libwin.hlayout:draw()
	local last_widget;
	for i=1, self.widget_count do
		self.widgets[i].f:SetSize(
			self.f:GetWidth()/self.widget_count,
			self.f:GetHeight()
		);

		if last_widget ~= nil then
			self.widgets[i].f:SetPoint("LEFT", last_widget.f, "RIGHT");
		else
			self.widgets[i].f:SetPoint("LEFT");
		end

		last_widget = self.widgets[i];
	end
end
