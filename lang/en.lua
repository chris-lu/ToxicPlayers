--[[

--Code below is commented out, because english strings was added in strings.lua.
--This is just an example how localization file should look like.

SafeAddString(TOXICPLAYERS_IGNORED, "Ignored", 1)
SafeAddString(TOXICPLAYERS_MUTED,   "Muted", 1)
SafeAddString(TOXICPLAYERS_FRIEND,  "Friend", 1)
SafeAddString(TOXICPLAYERS_GUILD,   "Guild", 1)
SafeAddString(TOXICPLAYERS_GUILD_BLACKLIST,   "Blacklisted", 1)

SafeAddString(TOXICPLAYERS_POSITION_LEFT, "Left", 1)
SafeAddString(TOXICPLAYERS_POSITION_RIGHT,   "Right", 1)
SafeAddString(TOXICPLAYERS_POSITION_TOP,  "Top", 1)
SafeAddString(TOXICPLAYERS_POSITION_BOTTOM,   "Bottom", 1)

SafeAddString(TOXICPLAYERS_SI_DISPLAY_NAME_ID, "UserID", 1)
SafeAddString(TOXICPLAYERS_SI_DISPLAY_CHARACTER_NAME, "Character name", 1)
SafeAddString(TOXICPLAYERS_SI_DISPLAY_BOTH, "UserID and Character name", 1)

SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_NAME,                "Display Name", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_NAME_TOOLTIP,        "Determines which name should be displayed most prominently when viewing other players. ", 1)
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
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_DESCRIPTION,   "Activate ToxicPlayer over guild banned players", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_TOOLTIP,       "If deactivated, ToxicPlayers will not notify you about the guild blacklisted you encounter", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_DESCRIPTION, "Save the info of the latest player encountered", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_TOOLTIP,     "If activated, ToxicPlayers will save the information of the latest unknown encountered player to display them back with the key [Display info about the latest target]", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_DESCRIPTION,   "Position of the status text", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_TOOLTIP,       "", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_DESCRIPTION,   "Position of the status icon", 1)
SafeAddString(TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_TOOLTIP,       "", 1)
SafeAddString(TOXICPLAYERS_OPTION_ACCOUNT_WIDE,   "Use Account Wide Profile", 1)
SafeAddString(TOXICPLAYERS_OPTION_ACCOUNT_WIDE_TOOLTIP,       "Switching between local and global profiles will reload the interface.", 1)

SafeAddString(TOXICPLAYERS_SI_UNKNOWN_PLAYER_INFO,     "You met <<1>><<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_FRIEND_PLAYER_INFO,      "You met your friend <<1>><<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_MUTED_PLAYER_INFO,       "You met <<1>><<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_GUILD_PLAYER_INFO,       "You met <<1>><<2>> from [<<3>>]", 1)
SafeAddString(TOXICPLAYERS_SI_IGNORE_NOTE,             "Ignore note for <<1>><<2>>: <<3>>", 1)
SafeAddString(TOXICPLAYERS_SI_BANNED_NOTE,             "Ban note for <<1>><<2>>: <<3>>", 1)
SafeAddString(TOXICPLAYERS_SI_NO_IGNORE_NOTE,          "No ignore note for <<1>><<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_NO_BANNED_NOTE,          "No ban note for <<1>><<2>>", 1)
SafeAddString(TOXICPLAYERS_SI_WITH_CHAR,               " with <<1>>", 1)

SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED,             "Add/remove target from ignore list", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED_WITH_NOTE,   "Add/remove target from ignore list and edit ignore note", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_GET_NOTE,                   "Display info about the latest target", 1)
SafeAddString(SI_BINDING_NAME_TOXICPLAYERS_KEY_REPORT,                     "Report the targeted player", 1)

--]]