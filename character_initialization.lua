local _G = _G
local TRADE = TRADE
local GENERAL = GENERAL
local L_CHAT_DEFENSE = L_CHAT_DEFENSE
local L_CHAT_RECRUITMENT = L_CHAT_RECRUITMENT
local L_CHAT_LFG = L_CHAT_LFG

local function SetupUI()
	SetCVar("chatStyle", "im")
	SetCVar('chatMouseScroll', 1)
	SetCVar('useUiScale', 1)
	-- SetCVar('uiScale', 768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], '%d+x(%d+)'))
	SetCVar('uiScale', 0.64999997615814)
	SetCVar('countdownForCooldowns', 1)
	SetCVar('UnitNameFriendlyPlayerName', 0)
	SetCVar('UnitNameFriendlyPetName', 0)
	SetCVar('UnitNameFriendlyGuardianName', 0)
	SetCVar('autoOpenLootHistory', 0)
	SetCVar('UnitNameFriendlyTotemName', 0)
	SetCVar('nameplateShowEnemies', 1)
	SetCVar('taintLog', 0)
	SetCVar('UnitNameEnemyPlayerName', 1)
	SetCVar('UnitNameEnemyPetName', 1)
	SetCVar('UnitNameEnemyGuardianName', 0)
	SetCVar('UnitNameEnemyTotemName', 0)
	--SetCVar('cameraDistanceMax', 50)
	--SetCVar('cameraDistanceMaxFactor', 2)
	SetCVar('cameraDistanceMaxZoomFactor', 2.6)
	--SetCVar('cameraSmoothTrackingStyle', 0)
	SetCVar('cameraSmoothStyle', 0)
	SetCVar('cameraZoomSpeed', 50)
	SetCVar("ffxGlow", 0)
	SetCVar('lootUnderMouse', 0)
	SetCVar("consolidateBuffs", 0)
	SetCVar("buffDurations", 1)
	SetCVar('bloattest', 0)
	SetCVar("showVKeyCastbar", 1)
	SetCVar("removeChatDelay", 1)
	SetCVar('bloatnameplates', 0) 
	SetCVar('bloatthreat', 0)
	SetCVar("synchronizeBindings", 0)
	SetCVar("alternateResourceText", 1)
	SetCVar("statusTextDisplay", "BOTH")
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("scriptErrors", 1)
	SetCVar("screenshotQuality", 10)
	SetCVar("WholeChatWindowClickable", 0)
	SetCVar("ConversationMode", "inline")
	SetCVar("BnWhisperMode", "popout_and_inline")
	SetCVar("WhisperMode", "popout_and_inline")
	SetCVar("showTutorials", 0)
	SetCVar("UberTooltips", 1)
	SetCVar("autoQuestProgress", 1)
	SetCVar("autoQuestWatch", 1)
	SetCVar("threatWarning", 3)
	SetCVar('alwaysShowActionBars', 1)
	SetCVar('profanityFilter', 0)
	SetCVar('lockActionBars', 1)
	SetCVar('SpamFilter', 0)
	SetCVar('autoLootDefault', 1)

	InterfaceOptionsActionBarsPanelPickupActionKeyDropDown:SetValue('SHIFT')
	InterfaceOptionsActionBarsPanelPickupActionKeyDropDown:RefreshValue()
	
end

local function SetupChats()
  TRADE, GENERAL, L_CHAT_DEFENSE, L_CHAT_RECRUITMENT, L_CHAT_LFG = 'TRADE', 'GENERAL', 'L_CHAT_DEFENSE', 'L_CHAT_RECRUITMENT', 'L_CHAT_LFG'
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow(GENERAL)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)

	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame4)
	FCF_SetLocked(ChatFrame4, 1)
	ChatFrame4:Show()

	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local id = frame:GetID()
		frame:SetSize(420, 170)
		SetChatWindowSavedDimensions(id, 420, 170)
		FCF_SavePositionAndDimensions(frame)

		if i == 1 then SetChatWindowSavedPosition(id, 'BOTTOMLEFT', 0, 0) end
		if i == 4 then SetChatWindowSavedPosition(id, 'BOTTOMRIGHT', 0, 0) end
		
		-- Set chat window titles
		if i == 1 then FCF_SetWindowName(frame, "Chat") end
		if i == 2 then FCF_SetWindowName(frame, "Log") end
		if i == 3 then FCF_SetWindowName(frame, "Whisper") end
		-- Set font sizes
		if i == 1 then FCF_SetChatWindowFontSize(nil, frame, 14) end
		if i == 2 then FCF_SetChatWindowFontSize(nil, frame, 12) end
		if i == 3 then FCF_SetChatWindowFontSize(nil, frame, 14) end
		if i == 4 then FCF_SetChatWindowFontSize(nil, frame, 12) end
		
	end

	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, TRADE)
	ChatFrame_RemoveChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, L_CHAT_DEFENSE)
	ChatFrame_RemoveChannel(ChatFrame1, L_CHAT_RECRUITMENT)
	ChatFrame_RemoveChannel(ChatFrame1, L_CHAT_LFG)
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")

	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddMessageGroup(ChatFrame3, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame3, "BN_CONVERSATION")

	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddChannel(ChatFrame4, TRADE)
	ChatFrame_AddChannel(ChatFrame4, GENERAL)
	ChatFrame_AddChannel(ChatFrame4, L_CHAT_DEFENSE)
	ChatFrame_AddChannel(ChatFrame4, L_CHAT_RECRUITMENT)
	ChatFrame_AddChannel(ChatFrame4, L_CHAT_LFG)
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame4, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame4, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame4, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame4, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame4, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame4, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame4, "IGNORED")

	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
	
	ReloadUI()	
end


SlashCmdList["CHARACTER_INITIALIZATION_SLASHCMD"] = function(msg)
	SetupUI()
	SetupChats()
end

SLASH_CHARACTER_INITIALIZATION_SLASHCMD1 = "/character-initialization" 
SLASH_CHARACTER_INITIALIZATION_SLASHCMD2 = "/ci"





