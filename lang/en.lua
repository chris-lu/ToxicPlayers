--[[

--Code below is commented out, because english strings was added in strings.lua.
--This is just an example how localization file should look like.

SafeAddString(TOXICPLAYERS_IGNORED, "Ignored", 1)
SafeAddString(TOXICPLAYERS_MUTED,   "Muted", 1)
SafeAddString(TOXICPLAYERS_FRIEND,  "Friend", 1)
SafeAddString(TOXICPLAYERS_GUILD,   "Guild", 1)

SafeAddString(TOXICPLAYERS_OPTION_DESCRITPION,                 "ToxicPlayers is adding visual information to your reticle when targeting a muted or ignored player.", 1)
SafeAddString(TOXICPLAYERS_OPTION_RETICLE_TEXT_DESCRIPTION,    "Display a status text for the targeted players", 1)
SafeAddString(TOXICPLAYERS_OPTION_RETICLE_TEXT_TOOLTIP,        "If activated, ToxicPlayers will display the status of the targeted player (muted, ignored, guild or friends)", 1)
SafeAddString(TOXICPLAYERS_OPTION_RETICLE_ICON_DESCRIPTION,    "Display icon over the targeted players", 1)
SafeAddString(TOXICPLAYERS_OPTION_RETICLE_ICON_TOOLTIP,        "If activated, ToxicPlayers will display an icon under the targeted player (muted, ignored, guild or friends)", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_DESCRIPTION, "Activate ToxicPlayer over friends", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_TOOLTIP,     "If deactivated, ToxicPlayers will not notify you about the friends you encounter", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_MUTED_DESCRIPTION,   "Activate ToxicPlayer over muted players", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_MUTED_TOOLTIP,       "If deactivated, ToxicPlayers will not notify you about the muted players you encounter (MuteList add-on is necessary)", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_IGNORED_DESCRIPTION, "Activate ToxicPlayer over ignored players", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_IGNORED_TOOLTIP,     "If deactivated, ToxicPlayers will not notify you about the ignored players you encounter", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_GUILD_DESCRIPTION,   "Activate ToxicPlayer over guild players", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_GUILD_TOOLTIP,       "If deactivated, ToxicPlayers will not notify you about the guildmates you encounter", 1)

SafeAddString(TOXICPLAYERS_SI_FRIEND_PLAYER_INFO,      "You met your friend [<<1>>]", 1)
SafeAddString(TOXICPLAYERS_SI_MUTED_PLAYER_INFO,       "You met [<<1>>]", 1)
SafeAddString(TOXICPLAYERS_SI_GUILD_PLAYER_INFO,       "You met [<<1>>] from [<<2>>]", 1)
SafeAddString(TOXICPLAYERS_SI_IGNORE_NOTE,             "Ignore note for <<1>>: <<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_NO_IGNORE_NOTE,          "No ignore note for <<1>>", 1)

SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED,             "Add/remove target from ignore list", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED_WITH_NOTE,   "Add/remove target from ignore list and edit ignore note", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_GET_NOTE,                   "Display info about the latest target", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_REPORT,                     "Report the targeted player", 1)

--]]