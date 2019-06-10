local TP = ToxicPlayers

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
        }
    }
  
    LAM:RegisterOptionControls(TP.name .. "Options", optionsData)  
end