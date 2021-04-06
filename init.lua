local modchat_color_1 = "#FF0000"
local modchat_color_2 = "#FFA500"
local modchat_color_3 = "#FFFFFF"

minetest.register_privilege("modchat", {
  description = "Allow's to use the /mchat command.",
  give_to_singleplayer = false,
  give_to_admin = true
})

minetest.register_chatcommand("mchat", {
  description = "Send's a message to all players online with the modchat privilege.",
  params = "<text>",
  privs = {modchat = true},

  func = function(name, param)
    local message_1 = minetest.colorize(modchat_color_1, "Modchat> ")
    local message_2 = minetest.colorize(modchat_color_2, name .. "> ")
    local message_3 = minetest.colorize(modchat_color_3, param)

    local message = message_1 .. message_2 .. message_3
    local players = minetest.get_connected_players()

    for _, player in ipairs(players) do
      local playername = player:get_player_name()
      local is_moderator = minetest.check_player_privs(playername, {modchat = true})

      if is_moderator then
        minetest.chat_send_player(playername, message)
      end
    end
  end
})
