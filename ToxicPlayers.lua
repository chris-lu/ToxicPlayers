TP_DISPLAY_NAME_ID, TP_DISPLAY_NAME_CHARACTER, TP_DISPLAY_NAME_BOTH = 1,2,3

ToxicPlayers = {
    name = "ToxicPlayers",
    
    options = {
        type = "panel",
        name = "Toxic Players",
        author = "mouton",
        version = "1.6.4"
    },

    command =  "/toxicplayers",
    
    localSettings = {},
    accountSettings = {},
    defaultSettings = {
        useAccountWide = false,
        displayText = false, 
        displayIcon = true ,
        displayOnIgnored = true, 
        displayOnMuted = true,
        displayOnGuild = true,
        displayOnGuildBlacklist = true,
        displayOnFriends = true,
        displayOnUnknown = false,
        displayName = TP_DISPLAY_NAME_ID,
        positionName = TOP,
        positionIcon = BOTTOM,
        variableVersion = 2
    },
    
    STYLES = {
        DEFAULT = { color = ZO_ColorDef:New(1, 1, 1, 1), icon = '' },
        IGNORED = { color = ZO_ColorDef:New(1, 0.2, 0.2, .9), icon = '/esoui/art/contacts/tabicon_ignored_up.dds' },
        MUTED =   { color = ZO_ColorDef:New(1, 0.6, 0.2, .9), icon = '/esoui/art/contacts/tabicon_ignored_up.dds' },
        GUILD =   { color = ZO_ColorDef:New(0.6, 0.7, 1, 1),  icon = '/esoui/art/mainmenu/menubar_guilds_up.dds' },
        FRIENDS = { color = ZO_ColorDef:New(0.2, 1, 0.2, .9), icon = '/esoui/art/mainmenu/menubar_social_up.dds' },
        BLACKLIST = { color = ZO_ColorDef:New(1, 0.2, 0.2, .9),  icon = 'esoui/art/guildfinder/keyboard/guildrecruitment_blacklist_up.dds' }
    }

}

-- Local references to important objects
local TYPE_UNKNOWN, TYPE_IGNORED, TYPE_MUTED, TYPE_FRIENDS, TYPE_GUILD, TYPE_BLACKLIST = 1,2,3,4,5,6
local SOCIAL_RATE_DELAY = 2000
local TP = ToxicPlayers
local TPStyles = TP.STYLES
local latestEvent = GetGameTimeMilliseconds()
local latestWisp = nil
local latestPlayer = nil
local editNote = nil
local guildMates = {}
local guildBlacklist = {}


function TP.FixPositions()
    local settings = TP.getSettings()
    TP.SetPosition(ToxicPlayersUnitName, settings.positionName)
    TP.SetPosition(ToxicPlayersUnitIcon, settings.positionIcon)
    TP.SetReticleStyle(TPStyles.DEFAULT, "", true)
end

function TP.SetPosition(ctrl, position)
    ctrl:ClearAnchors()
    
    local whereOnMe, whereOnTarget, textAlign
    
    if position == BOTTOM then
        whereOnMe, whereOnTarget, textAlign = TOP, BOTTOM, TEXT_ALIGN_CENTER
    elseif position == RIGHT then
        whereOnMe, whereOnTarget, textAlign = LEFT, RIGHT, TEXT_ALIGN_LEFT
    elseif position == LEFT then
        whereOnMe, whereOnTarget, textAlign = RIGHT, LEFT, TEXT_ALIGN_RIGHT
    else
      -- Default position for TOP
        whereOnMe, whereOnTarget, textAlign = BOTTOM, TOP, TEXT_ALIGN_CENTER
    end
    
    ctrl:SetAnchor(whereOnMe, ctrl:GetParent(), whereOnTarget, 0, 0)
    if ctrl['SetHorizontalAlignment'] ~= nil then
        ctrl:SetHorizontalAlignment(textAlign)
    end
end

function TP.SetReticleStyle(style, text, hidden)
    ZO_ReticleContainerReticle:SetColor(style.color:UnpackRGB())
    local settings = TP.getSettings()
    if settings.displayIcon then
        ToxicPlayersUnitIcon:SetColor(style.color:UnpackRGBA())
        ToxicPlayersUnitIcon:SetTexture(style.icon)
        ToxicPlayersUnitIcon:SetHidden(hidden)
    end
    if settings.displayText then
        ToxicPlayersUnitName:SetColor(style.color:UnpackRGBA())
        ToxicPlayersUnitName:SetText(text)
        ToxicPlayersUnitName:SetHidden(hidden)
        if settings.positionName == settings.positionIcon then
            -- Same position, right or left
            if settings.positionName == RIGHT or settings.positionName == LEFT then
                ToxicPlayersUnitName:SetHeight(90)
                ToxicPlayersUnitName:SetVerticalAlignment(TEXT_ALIGN_BOTTOM)
            -- Same position, top or bottom
            else 
                ToxicPlayersUnitName:SetHeight(120)
                ToxicPlayersUnitName:SetVerticalAlignment(TEXT_ALIGN_CENTER)
            end
        else
            -- Any other position
            ToxicPlayersUnitName:SetHeight(40)
            ToxicPlayersUnitName:SetVerticalAlignment(TEXT_ALIGN_CENTER)
        end
    end
end

function TP.OnReticleHidden(eventcode)
    TP.SetReticleStyle(TPStyles.DEFAULT, "", true)
end

function TP.OnTargetHasChanged(eventcode,invname)
    if IsUnitPlayer('reticleover') then
        local settings = TP.getSettings()
        -- Check player ignore list
        if settings.displayOnIgnored and IsUnitIgnored('reticleover') then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_IGNORED))
            TP.SetReticleStyle(TPStyles.IGNORED, GetString(TOXICPLAYERS_IGNORED), false)
        -- If MuteList addon is installed, check muted
        elseif MuteList and MuteList.settings and settings.displayOnMuted and MuteList.settings.IsMuted(GetUnitDisplayName('reticleover')) then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_MUTED))
            TP.SetReticleStyle(TPStyles.MUTED, GetString(TOXICPLAYERS_MUTED), false)
        -- Display not grouped friends as well
        elseif settings.displayOnFriends and not IsUnitGrouped('reticleover') and IsUnitFriend('reticleover') then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_FRIENDS))
            TP.SetReticleStyle(TPStyles.FRIENDS, GetString(TOXICPLAYERS_FRIEND), false)
        -- Display not grouped on guild mates
        elseif settings.displayOnGuild and not IsUnitGrouped('reticleover') and TP.IsUnitGuildMate('reticleover') then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_GUILD))
            TP.SetReticleStyle(TPStyles.GUILD, guildMates[latestPlayer.playerName].guildName, false)
        -- Display on blacklisted users from a guild
        elseif settings.displayOnGuildBlacklist and not IsUnitGrouped('reticleover') and TP.IsUnitGuildBlacklist('reticleover') then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_BLACKLIST))
            TP.SetReticleStyle(TPStyles.BLACKLIST, guildBlacklist[latestPlayer.playerName].guildName, false)
        -- No list, but save info
        elseif settings.displayOnUnknown then
            TP.SetLastestPlayer(TP.GetLastestPlayer(TYPE_UNKNOWN))
            TP.SetReticleStyle(TPStyles.DEFAULT, "", true)
        -- No list, reset.
        else 
            TP.SetReticleStyle(TPStyles.DEFAULT, "", true)
        end
    -- No target, reset.
    else
        TP.SetReticleStyle(TPStyles.DEFAULT, "", true)
    end
end

function TP.SetLastestPlayer(player)
  if player ~= nil then
    latestWisp = player
  end
  latestPlayer = player
end

function TP.GetLastestPlayer(type) 
    local settings = TP.getSettings()
    if settings.displayName == TP_DISPLAY_NAME_ID then 
        return { playerType = type, playerName = GetUnitDisplayName('reticleover') }
    elseif settings.displayName == TP_DISPLAY_NAME_CHARACTER then 
        return { playerType = type, characterName = GetUnitName('reticleover') }
    else 
        return { playerType = type, playerName = GetUnitDisplayName('reticleover'), characterName = GetUnitName('reticleover') }
    end
end

function TP.IsUnitGuildMate(unitTag) 
    local playerName = GetUnitDisplayName(unitTag)
    return guildMates[playerName] ~= nil
end

function TP.IsUnitGuildBlacklist(unitTag) 
    local playerName = GetUnitDisplayName(unitTag)
    return guildBlacklist[playerName] ~= nil
end

function TP.UpdatePlayerNote(eventcode, playerName)
    -- Note has to be updated once ignore is saved only. Save the latest note for that player.
    -- Social functions are subject to call limit rate (?)
    local callback = function ()
        if editNote then
            for i = 1, GetNumIgnored() do
                local curDisplayName, curNote = GetIgnoredInfo(i)
                if(playerName == curDisplayName) then
                    SetIgnoreNote(i, editNote)
                    break
                end
            end
            
        end
        editNote = nil
    end

    zo_callLater(callback, SOCIAL_RATE_DELAY)
    latestEvent = GetGameTimeMilliseconds()
end

function TP.GetPlayerInfo()
    if TP.IsSocialAllowed() and latestPlayer then
        local formatedNote = nil
        local playerLink = ""
        local characterLink = ""
        
        if latestPlayer.playerName then 
            playerLink = ZO_LinkHandler_CreateDisplayNameLink(latestPlayer.playerName)
            if latestPlayer.characterName then
                characterLink = zo_strformat(TOXICPLAYERS_SI_WITH_CHAR, ZO_LinkHandler_CreateCharacterLink(latestPlayer.characterName) )
            end
        elseif latestPlayer.characterName then
            playerLink = ZO_LinkHandler_CreateCharacterLink(latestPlayer.characterName) 
        end 

        if latestPlayer.playerType == TYPE_UNKNOWN then
            formatedNote = zo_strformat(TOXICPLAYERS_SI_UNKNOWN_PLAYER_INFO, playerLink, characterLink)
        elseif latestPlayer.playerType == TYPE_FRIENDS then
            formatedNote = zo_strformat(TOXICPLAYERS_SI_FRIEND_PLAYER_INFO, playerLink, characterLink)
        elseif latestPlayer.playerType == TYPE_GUILD then
            formatedNote = zo_strformat(TOXICPLAYERS_SI_GUILD_PLAYER_INFO, playerLink, characterLink, GetGuildRecruitmentLink(guildMates[latestPlayer.playerName].guildId, LINK_STYLE_DEFAULT))
        elseif latestPlayer.playerType == TYPE_MUTED then
            formatedNote = zo_strformat(TOXICPLAYERS_SI_MUTED_PLAYER_INFO, playerLink, characterLink)
        elseif latestPlayer.playerType == TYPE_IGNORED then
            local playerNote = TP.GetPlayerIgnoreNote(latestPlayer.playerName)
            formatedNote = (playerNote == nil or playerNote == "") and zo_strformat(TOXICPLAYERS_SI_NO_IGNORE_NOTE, playerLink, characterLink) or zo_strformat(TOXICPLAYERS_SI_IGNORE_NOTE, playerLink, characterLink, playerNote)
        elseif latestPlayer.playerType == TYPE_BLACKLIST then
            local playerNote = TP.GetPlayerBannedNote(latestPlayer.playerName)
            formatedNote = (playerNote == nil or playerNote == "") and zo_strformat(TOXICPLAYERS_SI_NO_BANNED_NOTE, playerLink, characterLink) or zo_strformat(TOXICPLAYERS_SI_BANNED_NOTE, playerLink, characterLink, playerNote)
        end
        
        if formatedNote then
            -- Display the notes in the chat for now
            CHAT_SYSTEM:Maximize()
            CHAT_SYSTEM:AddMessage(formatedNote)
        end
        
        -- Display info just once
        TP.SetLastestPlayer(nil)
        latestEvent = GetGameTimeMilliseconds()
    end
end

function TP.GetPlayerIgnoreNote(playerName)
    local playerNote = nil
    for i = 1, GetNumIgnored() do
        local curDisplayName, curNote = GetIgnoredInfo(i)
        if playerName == curDisplayName then
            if curNote then
                playerNote = curNote
            else
                playerNote = ""
            end
            break
        end
    end
    return playerNote
end

function TP.GetPlayerBannedNote(playerName)
    if guildBlacklist[playerName] ~= nil then
      return guildBlacklist[playerName].note
    end
end

function TP.ToggleTargetIgnore(addNote)     
    if TP.CanUseIgnore() then
        local playerName = GetUnitDisplayName('reticleover')
    
        if IsUnitIgnored('reticleover') then
            RemoveIgnore(playerName)
        else
            if addNote then
                -- We can change note only after EVENT_IGNORE_ADDED is fired, so we save the note for now.
                local function IgnoreSelectedPlayerWithNote(playerName, playerNote)
                    AddIgnore(playerName)
                    editNote = playerNote
                    -- Resetting social timer, so the note is sure to be linked to the correct player.
                    latestEvent = GetGameTimeMilliseconds()
                end
                local data = {displayName = playerName, note = nil, changedCallback = IgnoreSelectedPlayerWithNote}
                
                if IsInGamepadPreferredMode() then
                    ZO_Dialogs_ShowGamepadDialog("GAMEPAD_SOCIAL_EDIT_NOTE_DIALOG", data)
                else
                    ZO_Dialogs_ShowDialog("EDIT_NOTE", data)
                end
            else
                -- else, we simply add the player to the ignore list
                AddIgnore(playerName)
            end
        end

        latestEvent = GetGameTimeMilliseconds()
    end
end

function TP.ReportTarget()
    -- Adding player to ignore as Zenimax is doing to avoid abuses. Do not report players already ignored.
    if TP.CanUseIgnore() and not IsUnitIgnored('reticleover') then        
        local playerName = GetUnitDisplayName('reticleover')
        
        local function IgnoreSelectedPlayer()
            AddIgnore(playerName)
        end

        ZO_HELP_GENERIC_TICKET_SUBMISSION_MANAGER:OpenReportPlayerTicketScene(playerName, IgnoreSelectedPlayer)
        latestEvent = GetGameTimeMilliseconds()
    end
end

function TP.IsSocialAllowed()
    if GetGameTimeMilliseconds() - latestEvent < SOCIAL_RATE_DELAY then
        -- Still in social cooldown
        -- ZO_Alert(UI_ALERT_CATEGORY_ERROR, SOUNDS.NEGATIVE_CLICK, GetString(SI_SOCIAL_REQUEST_ON_COOLDOWN))
        PlaySound(SOUNDS.NEGATIVE_CLICK)
        return false
    end
    
    return true
end

function TP.CanUseIgnore()
    -- No, no no. Do not report friends, group members or already blocked members.
    -- Add timer so we're not spamming
    return  TP.IsSocialAllowed() and IsUnitPlayer('reticleover') and not IsUnitFriend('reticleover') and not IsUnitGrouped('reticleover')
end

function TP.Whisper()
  if latestWisp ~= nil then
    StartChatInput("", CHAT_CHANNEL_WHISPER, latestWisp.playerName)
  end
end

function TP.InitGuildMates()
    guildMates = {}
    for i = 1, GetNumGuilds() do
        local guildId = GetGuildId(i)
        local guildName = GetGuildName(guildId)
        local numMembers = GetNumGuildMembers(guildId)
        for memberIndex = 1, numMembers do
            local displayName, note, _, _ = GetGuildMemberInfo(guildId, memberIndex)
            -- Keep just the first guild
            if guildMates[displayName] == nil then
                guildMates[displayName] = { note = note, guildName = guildName, guildId = guildId }
            end
        end
    end
end

function TP.InitGuildBlacklist()
    guildBlacklist = {}
    for i = 1, GetNumGuilds() do
        local guildId = GetGuildId(i)
        local guildName = GetGuildName(guildId)
        local numMembers = GetNumGuildBlacklistEntries(guildId)
        for memberIndex = 1, numMembers do
            local displayName, note = GetGuildBlacklistInfoAt(guildId, memberIndex)
            -- Keep just the first guild
            if guildBlacklist[displayName] == nil then
                guildBlacklist[displayName] = { note = note, guildName = guildName, guildId = guildId}
            end
        end
    end
end


function TP.SlashCommand( commandArgs )
  local options = { }
  -- Split words
  local searchResult = { string.match( commandArgs, "^((%S*)%s*)*$" ) }
  for w in commandArgs:gmatch("%S+") do
    options[ #options + 1 ] = string.lower( w )
  end

  -- Templates commands
  if options[1] == "info" or options[1] == nil then TP.GetPlayerInfo() end
  if options[1] == "whisp" or options[1] == "whisper" then TP.Whisper() end
end


function TP.OnAddOnLoaded(event, addonName)
  if addonName ~= TP.name then return end

  TP:Initialize()
end

function TP:Initialize()
    
    TP.accountSettings = ZO_SavedVars:NewAccountWide(TP.name .. "Variables", TP.defaultSettings.variableVersion, nil, TP.defaultSettings)
    TP.localSettings = ZO_SavedVars:NewCharacterIdSettings(TP.name .. "Variables", TP.defaultSettings.variableVersion, nil, TP.defaultSettings)
    
    -- Initial UI and variables
    TP:CreateAddonMenu()
    TP.InitGuildMates()
    TP.InitGuildBlacklist()
    TP.FixPositions()
    TP.SetReticleStyle(TPStyles.DEFAULT, "", true)

    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_RETICLE_TARGET_CHANGED, TP.OnTargetHasChanged)

    -- Update when updating the lists
    EVENT_MANAGER:RegisterForEvent(TP.name .. "Note", EVENT_IGNORE_ADDED, TP.UpdatePlayerNote)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_IGNORE_ADDED, TP.OnTargetHasChanged)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_IGNORE_REMOVED, TP.OnTargetHasChanged)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_FRIEND_ADDED, TP.OnTargetHasChanged)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_FRIEND_REMOVED, TP.OnTargetHasChanged)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_RETICLE_HIDDEN_UPDATE, TP.OnReticleHidden)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_GUILD_MEMBER_ADDED, TP.InitGuildMates)
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_GUILD_MEMBER_REMOVED, TP.InitGuildMates)    
    EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_GUILD_FINDER_BLACKLIST_RESPONSE, TP.InitGuildBlacklist)

    EVENT_MANAGER:UnregisterForEvent(TP.name, EVENT_ADD_ON_LOADED)

    SLASH_COMMANDS[ TP.command ] = TP.SlashCommand    
end

EVENT_MANAGER:RegisterForEvent(TP.name, EVENT_ADD_ON_LOADED, TP.OnAddOnLoaded)