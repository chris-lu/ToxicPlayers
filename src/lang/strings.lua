local strings = {

  TOXICPLAYERS_IGNORED = "Ignored",
  TOXICPLAYERS_MUTED = "Muted",
  TOXICPLAYERS_FRIEND = "Friend",
  TOXICPLAYERS_GUILD = "Guild",
  TOXICPLAYERS_GUILD_BLACKLIST = "Blacklisted",

  TOXICPLAYERS_POSITION_LEFT = "Left",
  TOXICPLAYERS_POSITION_RIGHT = "Right",
  TOXICPLAYERS_POSITION_TOP = "Top",
  TOXICPLAYERS_POSITION_BOTTOM = "Bottom",
  
  TOXICPLAYERS_SI_DISPLAY_NAME_ID = "UserID",
  TOXICPLAYERS_SI_DISPLAY_CHARACTER_NAME = "Character name",
  TOXICPLAYERS_SI_DISPLAY_BOTH = "UserID and Character name",

  TOXICPLAYERS_OPTION_DISPLAY_NAME =  "Display Name",
  TOXICPLAYERS_OPTION_DISPLAY_NAME_TOOLTIP =  "Determines which name should be displayed most prominently when viewing other players. ",
  TOXICPLAYERS_OPTION_DESCRITPION = "ToxicPlayers is adding visual information to your reticle when targeting a muted or ignored player.",
  TOXICPLAYERS_OPTION_RETICLE_TEXT_DESCRIPTION = "Display a status text for the targeted players",
  TOXICPLAYERS_OPTION_RETICLE_TEXT_TOOLTIP = "If activated, ToxicPlayers will display the status of the targeted player (muted, ignored, guild, banned or friends)",
  TOXICPLAYERS_OPTION_RETICLE_ICON_DESCRIPTION = "Display icon over the targeted players",
  TOXICPLAYERS_OPTION_RETICLE_ICON_TOOLTIP = "If activated, ToxicPlayers will display an icon under the targeted player (muted, ignored, guild, banned or friends)",
  TOXICPLAYERS_OPTION_RETICLE_MARKER_DESCRIPTION = "Display a permanent marker over the targeted players",
  TOXICPLAYERS_OPTION_RETICLE_MARKER_TOOLTIP = "If activated, ToxicPlayers will activate the game marker icon above the targeted player (muted, ignored, guild, banned or friends)",
  TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_DESCRIPTION = "Activate ToxicPlayer over friends",
  TOXICPLAYERS_OPTION_DISPLAY_FRIENDS_TOOLTIP = "If deactivated, ToxicPlayers will not notify you about the friends you encounter",
  TOXICPLAYERS_OPTION_DISPLAY_MUTED_DESCRIPTION = "Activate ToxicPlayer over muted players",
  TOXICPLAYERS_OPTION_DISPLAY_MUTED_TOOLTIP = "If deactivated, ToxicPlayers will not notify you about the muted players you encounter (MuteList add-on is necessary)",
  TOXICPLAYERS_OPTION_DISPLAY_IGNORED_DESCRIPTION = "Activate ToxicPlayer over ignored players",
  TOXICPLAYERS_OPTION_DISPLAY_IGNORED_TOOLTIP = "If deactivated, ToxicPlayers will not notify you about the ignored players you encounter",
  TOXICPLAYERS_OPTION_DISPLAY_GUILD_DESCRIPTION = "Activate ToxicPlayer over guild players",
  TOXICPLAYERS_OPTION_DISPLAY_GUILD_TOOLTIP = "If deactivated, ToxicPlayers will not notify you about the guildmates you encounter",
  TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_DESCRIPTION = "Activate ToxicPlayer over guild banned players",
  TOXICPLAYERS_OPTION_DISPLAY_GUILDBLACKLIST_TOOLTIP = "If deactivated, ToxicPlayers will not notify you about the guild blacklisted you encounter",
  TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_DESCRIPTION = "Save the info of the latest player encountered",
  TOXICPLAYERS_OPTION_DISPLAY_UNKNOWN_TOOLTIP = "If activated, ToxicPlayers will save the information of the latest unknown encountered player to display them back with the key [Display info about the latest target]",
  TOXICPLAYERS_OPTION_AUTOMATIC_PLAYER_INFO_DESCRIPTION = "Automatically display encountered player information",
  TOXICPLAYERS_OPTION_AUTOMATIC_PLAYER_INFO_TOOLTIP = "Enable to display player information automatically, no binding required",
  TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_DESCRIPTION = "Position of the status text",
  TOXICPLAYERS_OPTION_DISPLAY_POSITION_TEXT_TOOLTIP = "",
  TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_DESCRIPTION = "Position of the status icon",
  TOXICPLAYERS_OPTION_DISPLAY_POSITION_ICON_TOOLTIP = "",
  TOXICPLAYERS_OPTION_ACCOUNT_WIDE = "Use Account Wide Profile",
  TOXICPLAYERS_OPTION_ACCOUNT_WIDE_TOOLTIP = "Switching between local and global profiles will reload the interface.",

  TOXICPLAYERS_SI_UNKNOWN_PLAYER_INFO = "You met <<1>><<2>>",
  TOXICPLAYERS_SI_FRIEND_PLAYER_INFO = "You met your friend <<1>><<2>>",
  TOXICPLAYERS_SI_MUTED_PLAYER_INFO = "You met <<1>><<2>>",
  TOXICPLAYERS_SI_GUILD_PLAYER_INFO = "You met <<1>><<2>> from [<<3>>]",
  TOXICPLAYERS_SI_IGNORE_NOTE = "Ignore note for <<1>><<2>>: <<3>>",
  TOXICPLAYERS_SI_BANNED_NOTE = "Banned note for <<1>><<2>>: <<3>>",
  TOXICPLAYERS_SI_NO_IGNORE_NOTE = "No ignore note for <<1>><<2>>",
  TOXICPLAYERS_SI_WITH_CHAR =" with <<1>>",

  MOUTON_AUTHOR_FEEDBACK_MAIL = "In-game mail feedback",
  MOUTON_AUTHOR_FEEDBACK_MAIL_HEADER = "Feedback for <<1>> (<<2>>)",
  MOUTON_AUTHOR_FEEDBACK_ESOUI = "ESOUI comments",
  MOUTON_AUTHOR_DONATE_GOLD = "Donation in gold",
  MOUTON_AUTHOR_DONATE_GOLD_HEADER = "Donation for <<1>>",
  MOUTON_AUTHOR_DONATE_ESOUI = "ESOUI donation page",
  MOUTON_AUTHOR_DONATE_CROWNS = "Donation in crowns",

  SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED = "Add/remove target from ignore list",
  SI_BINDING_NAME_TOXICPLAYERS_KEY_TOGGLE_IGNORED_WITH_NOTE = "Add/remove target from ignore list and edit ignore note",
  SI_BINDING_NAME_TOXICPLAYERS_KEY_GET_NOTE = "Display info about the latest target",
  SI_BINDING_NAME_TOXICPLAYERS_KEY_REPORT = "Report the targeted player",
  SI_BINDING_NAME_TOXICPLAYERS_WHISPER_TARGET = "Whisper to the latest targeted player"

}

for stringId, stringValue in pairs(strings) do
  ZO_CreateStringId(stringId, stringValue)
  SafeAddVersion(stringId, 1)
end
