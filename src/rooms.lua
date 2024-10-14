-- rooms.lua
local rooms = {
    start = {
        description = "You are in a dark room.",
        exits = { north = "hallway" },
        items = { key = true }
    },
    hallway = {
        description = "You are in a long hallway.",
        exits = { south = "start", east = "treasure_room" },
        items = {}
    },
    treasure_room = {
        description = "You found a treasure room filled with gold!",
        exits = { west = "hallway" },
        items = {}
    }
}

return rooms
