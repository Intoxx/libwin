-- Namespace
local _, goldwin = ...;

print("Auction house loaded");


--[[
UI.TopLeftCorner = UI:CreateTexture(nil, "HIGHLIGHT");
UI.TopLeftCorner:SetAllPoints(true);
UI.TopLeftCorner:SetColorTexture(0.2, 0.5, 0.3);
--]]

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

--

-- Auction house main-frame
local AH = CreateFrame("Frame", "goldwin_auction_house", goldwin.UI, "BasicFrameTemplateWithInset");
-- Basic properties
AH:SetSize(400, 240);
AH:SetPoint("CENTER", UIParent, "CENTER");

-- Title bar
AH.title = AH:CreateFontString(nil, "OVERLAY");
AH.title:SetFontObject("GameFontHighlight");
AH.title:SetPoint("LEFT", AH.TitleBg, "LEFT", 5, 0);
AH.title:SetText("Goldwin Auction House");

-- Buy button
AH.buy_btn = goldwin:create_btn(AH, "Buy", 64, 24);
AH.buy_btn:SetPoint("CENTER", AH, "BOTTOM", 100, 2);

-- Sell button
AH.sell_btn = goldwin:create_btn(AH, "Sell", 64, 24);
AH.sell_btn:SetPoint("CENTER", AH, "BOTTOM", -100, 2);
