-- Namespace
local _, libwin = ...;

function libwin:button(parent, text, width, height)

end

--[[
UI:SetSize(400, 240);
UI:SetPoint("CENTER", UIParent, "CENTER");

UI.title = UI:CreateFontString(nil, "OVERLAY");
UI.title:SetFontObject("GameFontHighlight");
UI.title:SetPoint("LEFT", UI.TitleBg, "LEFT", 5, 0);
UI.title:SetText("Goldwin");

UI.btn = CreateFrame("Button", nil, UI, "GameMenuButtonTemplate");
UI.btn:SetPoint("CENTER", UI, "TOP", 0, -70);
UI.btn:SetSize(140, 28);
UI.btn:SetText("Save");
UI.btn:SetNormalFontObject("GameFontNormalLarge");
UI.btn:SetHighlightFontObject("GameFontHighlightLarge");

--
UI.btn_2 = CreateFrame("Button", nil, UI);
UI.btn_2:SetPoint("CENTER", UI, "BOTTOM");
UI.btn_2:SetSize(140, 32);
UI.btn_2:SetText("G");
UI.btn_2:SetNormalFontObject("GameFontNormalLarge");
UI.btn_2:SetHighlightFontObject("GameFontHighlightLarge");

UI.btn_2.left = UI.btn_2:CreateTexture(nil, "BACKGROUND");
UI.btn_2.left:SetSize(12, 22);
UI.btn_2.left:SetPoint("TOPLEFT");
UI.btn_2.left:SetPoint("BOTTOMLEFT");
UI.btn_2.left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
UI.btn_2.left:SetTexCoord(0, 0.09375, 0, 0.6875);

UI.btn_2.right = UI.btn_2:CreateTexture(nil, "BACKGROUND");
UI.btn_2.right:SetSize(12, 22);
UI.btn_2.right:SetPoint("TOPRIGHT");
UI.btn_2.right:SetPoint("BOTTOMRIGHT");
UI.btn_2.right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
UI.btn_2.right:SetTexCoord(0.53125, 0.625, 0, 0.6875);

UI.btn_2.mid = UI.btn_2:CreateTexture(nil, "BACKGROUND");
UI.btn_2.mid:SetSize(12, 22);
UI.btn_2.mid:SetPoint("TOPLEFT", UI.btn_2.left, "TOPRIGHT");
UI.btn_2.mid:SetPoint("BOTTOMRIGHT", UI.btn_2.right, "BOTTOMLEFT");
UI.btn_2.mid:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
UI.btn_2.mid:SetTexCoord(0.09375, 0.53125, 0, 0.6875);
--]]

--[[
function goldwin:create_btn(parent, text, width, height)
	local btn = CreateFrame("Button", nil, parent);

	-- Events
	btn:SetScript("OnMouseDown", function(self, button)
			      print("OnMouseDown");

			      -- Show ACTIVE and hide NORMAL

			      btn.state["active"].left:Show();
			      btn.state["active"].right:Show();
			      btn.state["active"].mid:Show();

			      btn.state["normal"].left:Hide();
			      btn.state["normal"].right:Hide();
			      btn.state["normal"].mid:Hide();
	end);
	btn:SetScript("OnMouseUp", function(self, button)
			      print("OnMouseUp");

			      -- Show NORMAL and hide ACTIVE

			      btn.state["active"].left:Hide();
			      btn.state["active"].right:Hide();
			      btn.state["active"].mid:Hide();

			      btn.state["normal"].left:Show();
			      btn.state["normal"].right:Show();
			      btn.state["normal"].mid:Show();
	end);
	btn:SetScript("OnDoubleClick", function(self, button) -- A double click consumes last OnClick up release
			      print("OnDoubleClick : " .. button);

			      -- Texture is still being pushed (release has been consumed)
			      btn.state["active"].left:SetDrawLayer("BACKGROUND", 0);
			      btn.state["active"].right:SetDrawLayer("BACKGROUND", 0);
			      btn.state["active"].mid:SetDrawLayer("BACKGROUND", 0);
	end);
	btn:SetScript("OnMouseWheel", function(self, direction)
			      print("OnMouseWheel : " .. direction);
	end);
	btn:SetScript("OnEnter", function(self, motion) --- motion ? -- Add preload data option when hovering
			      print("OnEnter");
	end);
	btn:SetScript("OnLeave", function(self, motion) -- motion ? OnLeave consumes last OnClick up release
			      print("OnLeave");
	end);

	-- Base properties
	btn:SetSize(width, height);
	btn:SetText(text);
	btn:SetNormalFontObject("GameFontNormal");
	btn:SetHighlightFontObject("GameFontHighlight");

	-- Textures
	btn.state = {
		["normal"] = {},
		["hover"] = {},
		["focus"] = {}, -- eg : keyboard tab focus
		["active"] = {}
	};
	-- NORMAL (sub-layer level 0)
	btn.state["normal"].left = btn:CreateTexture(nil, "BACKGROUND", nil, 0);
	btn.state["normal"].left:SetSize(12, 22);
	btn.state["normal"].left:SetPoint("TOPLEFT");
	btn.state["normal"].left:SetPoint("BOTTOMLEFT");
	btn.state["normal"].left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	btn.state["normal"].left:SetTexCoord(0, 0.09375, 0, 0.6875);

	btn.state["normal"].right = btn:CreateTexture(nil, "BACKGROUND", nil, 0);
	btn.state["normal"].right:SetSize(12, 22);
	btn.state["normal"].right:SetPoint("TOPRIGHT");
	btn.state["normal"].right:SetPoint("BOTTOMRIGHT");
	btn.state["normal"].right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	btn.state["normal"].right:SetTexCoord(0.53125, 0.625, 0, 0.6875);
	
	btn.state["normal"].mid = btn:CreateTexture(nil, "BACKGROUND", nil, 0);
	btn.state["normal"].mid:SetSize(12, 22);
	btn.state["normal"].mid:SetPoint("TOPLEFT", btn.state["normal"].left, "TOPRIGHT");
	btn.state["normal"].mid:SetPoint("BOTTOMRIGHT", btn.state["normal"].right, "BOTTOMLEFT");
	btn.state["normal"].mid:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
	btn.state["normal"].mid:SetTexCoord(0.09375, 0.53125, 0, 0.6875);

	-- HOVER (sub-layer level doesn't matter since there are no more HIGHLIGHT layers excepted these ones)
	btn.state["hover"].left = btn:CreateTexture(nil, "HIGHLIGHT", nil, 0);
	btn.state["hover"].left:SetSize(12, 22);
	btn.state["hover"].left:SetPoint("TOPLEFT");
	btn.state["hover"].left:SetPoint("BOTTOMLEFT");
	--btn.state["hover"].left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	--btn.state["hover"].left:SetTexCoord(0, 0.09375, 0, 0.6875);
	btn.state["hover"].left:SetColorTexture(0.8, 0, 0, 0.8);

	btn.state["hover"].right = btn:CreateTexture(nil, "HIGHLIGHT", nil, 0);
	btn.state["hover"].right:SetSize(12, 22);
	btn.state["hover"].right:SetPoint("TOPRIGHT");
	btn.state["hover"].right:SetPoint("BOTTOMRIGHT");
	--btn.state["hover"].right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	--btn.state["hover"].right:SetTexCoord(0.53125, 0.625, 0, 0.6875);
	btn.state["hover"].right:SetColorTexture(0.8, 0, 0, 0.8);
	
	btn.state["hover"].mid = btn:CreateTexture(nil, "HIGHLIGHT", nil, 0);
	btn.state["hover"].mid:SetSize(12, 22);
	btn.state["hover"].mid:SetPoint("TOPLEFT", btn.state["hover"].left, "TOPRIGHT");
	btn.state["hover"].mid:SetPoint("BOTTOMRIGHT", btn.state["hover"].right, "BOTTOMLEFT");
	--btn.state["hover"].mid:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
	--btn.state["hover"].mid:SetTexCoord(0.09375, 0.53125, 0, 0.6875);
	btn.state["hover"].mid:SetColorTexture(0.8, 0, 0, 0.8);

	-- FOCUS
	-- FIX ME : IMPLEMENT IT
	
	-- ACTIVE (sub-layer level 1 to go on top of NORMAL when shown)
	btn.state["active"].left = btn:CreateTexture(nil, "BACKGROUND", nil, 1);
	btn.state["active"].left:Hide();
	btn.state["active"].left:SetSize(12, 22);
	btn.state["active"].left:SetPoint("TOPLEFT");
	btn.state["active"].left:SetPoint("BOTTOMLEFT");
	--btn.state["active"].left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	--btn.state["active"].left:SetTexCoord(0, 0.09375, 0, 0.6875);
	btn.state["active"].left:SetColorTexture(0, 0.8, 0.8);

	btn.state["active"].right = btn:CreateTexture(nil, "BACKGROUND", nil, 1);
	btn.state["active"].right:Hide();
	btn.state["active"].right:SetSize(12, 22);
	btn.state["active"].right:SetPoint("TOPRIGHT");
	btn.state["active"].right:SetPoint("BOTTOMRIGHT");
	--btn.state["active"].right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up");
	--btn.state["active"].right:SetTexCoord(0.53125, 0.625, 0, 0.6875);
	btn.state["active"].right:SetColorTexture(0, 0.8, 0.8);
	
	btn.state["active"].mid = btn:CreateTexture(nil, "BACKGROUND", nil, 1);
	btn.state["active"].mid:Hide();
	btn.state["active"].mid:SetSize(12, 22);
	btn.state["active"].mid:SetPoint("TOPLEFT", btn.state["active"].left, "TOPRIGHT");
	btn.state["active"].mid:SetPoint("BOTTOMRIGHT", btn.state["active"].right, "BOTTOMLEFT");
	--btn.state["active"].mid:SetTexture("Interface/Buttons/UI-Panel-Button-Up");
	--btn.state["active"].mid:SetTexCoord(0.09375, 0.53125, 0, 0.6875);
	btn.state["active"].mid:SetColorTexture(0, 0.8, 0.8, 0.5);

	return btn;
end
--]]
