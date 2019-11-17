local TP = ToxicPlayers

ToxicPlayers.settings = {}
local settings = {}

function settings.__index(self, key) 
  local sets = TP.getSettings()
  return sets[key]
end

function settings.__newindex(self, key, value)
  local sets = TP.getSettings()
  sets[key] = value
end

setmetatable(TP.settings, settings)

function TP.getSettings()
  if(TP.accountSettings.accountWide) then
    return TP.accountSettings
  else
    return TP.localSettings
  end
end

function ToxicPlayers:CreateAddonMenu()
    local LAM = LibStub:GetLibrary("LibAddonMenu-2.0")

    LAM:RegisterAddonPanel(TP.name .. "Options", TP.options)
  
    local optionsData = {
        [1] = {
            type = "description",
            title = nil,
            text = GetString(TOXICPLAYERS_OPTION_DESCRITPION),
            width = "full",
        },
        [2] = {
            type = "header",
            name = "",
            width = "full",
        },
        [3] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_RETICLE_TEXT_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_RETICLE_TEXT_TOOLTIP),
            getFunc = function() return TP.settings.displayText end,
            setFunc = function(value) TP.settings.displayText = value end,
            width = "full"
        },
        [4] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_RETICLE_ICON_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_RETICLE_ICON_TOOLTIP),
            getFunc = function() return TP.settings.displayIcon end,
            setFunc = function(value) TP.settings.displayIcon = value end,
            width = "full"
        },
        [5] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_TOOLTIP),
            getFunc = function() return TP.settings.displayOnFriends end,
            setFunc = function(value) TP.settings.displayOnFriends = value end,
            width = "full"
        },
        [6] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_MUTED_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_MUTED_TOOLTIP),
            getFunc = function() return TP.settings.displayOnMuted end,
            setFunc = function(value) TP.settings.displayOnMuted = value end,
            width = "full",
            disabled = function() return MuteList == nil end,
        },
        [7] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_GUILD_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_GUILD_TOOLTIP),
            getFunc = function() return TP.settings.displayOnGuild end,
            setFunc = function(value) TP.settings.displayOnGuild = value end,
            width = "full"
        },
        [8] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_TOOLTIP),
            getFunc = function() return TP.settings.displayOnGuildBlacklist end,
            setFunc = function(value) TP.settings.displayOnGuildBlacklist = value end,
            width = "full"
        },  
        [9] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_IGNORED_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_IGNORED_TOOLTIP),
            getFunc = function() return TP.settings.displayOnIgnored end,
            setFunc = function(value) TP.settings.displayOnIgnored = value end,
            width = "full"
        },
        [10] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_TOOLTIP),
            getFunc = function() return TP.settings.displayOnUnknown end,
            setFunc = function(value) TP.settings.displayOnUnknown = value end,
            width = "full"
        },
        [11] = {
            type = "dropdown",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_NAME),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_NAME_TOOLTIP),
            getFunc = function() return TP.settings.displayName end,
            setFunc = function(value) TP.settings.displayName = value end,
            choices = { GetString(TOXICPLAYERS_SI_DISPLAY_NAME_ID), GetString(TOXICPLAYERS_SI_DISPLAY_BOTH) },
            choicesValues = { TP_DISPLAY_NAME_ID, TP_DISPLAY_NAME_BOTH },
            width = "full"
        },
        [12] = {
            type = "dropdown",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_TOOLTIP),
            getFunc = function() return TP.settings.positionName end,
            setFunc = function(value) 
              TP.settings.positionName = value
              TP.FixPositions() 
            end,
            choices = { GetString(TOXICPLAYERS_POSITION_TOP), GetString(TOXICPLAYERS_POSITION_BOTTOM), GetString(TOXICPLAYERS_POSITION_LEFT), GetString(TOXICPLAYERS_POSITION_RIGHT) },
            choicesValues = { TOP, BOTTOM, LEFT, RIGHT },
            width = "full"
        },
        [13] = {
            type = "dropdown",
            name = GetString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_DESCRIPTION),
            tooltip = GetString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_TOOLTIP),
            getFunc = function() return TP.settings.positionIcon end,
            setFunc = function(value) 
              TP.settings.positionIcon = value
              TP.FixPositions() 
            end,
            choices = { GetString(TOXICPLAYERS_POSITION_TOP), GetString(TOXICPLAYERS_POSITION_BOTTOM), GetString(TOXICPLAYERS_POSITION_LEFT), GetString(TOXICPLAYERS_POSITION_RIGHT) },
            choicesValues = { TOP, BOTTOM, LEFT, RIGHT },
            width = "full"
        },
        [14] = {
            type = "checkbox",
            name = GetString(TOXICPLAYERS_OPTION_ACCOUNT_WIDE),
            warning = GetString(TOXICPLAYERS_OPTION_ACCOUNT_WIDE_TOOLTIP),
            getFunc = function() return TP.accountSettings.accountWide end,
            setFunc = function(value) 
              TP.accountSettings.accountWide, TP.localSettings.accountWide = value, value
              if(TP.accountSettings.accountWide) then
                for k,v in pairs(TP.defaultSettings) do
                  TP.accountSettings[k] = TP.localSettings[k]
                end
              else
                for k,v in pairs(TP.defaultSettings) do
                  TP.localSettings[k] = TP.accountSettings[k]
                end
              end
              ReloadUI()
            end,
            width = "full"
        }

    }
  
    LAM:RegisterOptionControls(TP.name .. "Options", optionsData)  
end