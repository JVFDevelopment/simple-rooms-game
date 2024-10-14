-- game.lua
local rooms = require("rooms")
local items = require("items")

local currentRoom = "start"
local inventory = {}

local function printInventory()
    if #inventory == 0 then
        print("You have nothing in your inventory.")
    else
        print("You have: " .. table.concat(inventory, ", "))
    end
end

local function takeItem(item)
    if rooms[currentRoom].items[item] then
        table.insert(inventory, item)
        rooms[currentRoom].items[item] = nil
        print("You picked up " .. item .. ".")
    else
        print("There's no " .. item .. " here!")
    end
end

local function handleInput(input)
    local command, argument = input:match("(%w+) (%w+)")
    if command == "go" then
        if rooms[currentRoom].exits[argument] then
            currentRoom = rooms[currentRoom].exits[argument]
            print("You are in " .. currentRoom .. ".")
        else
            print("You can't go that way!")
        end
    elseif command == "take" then
        takeItem(argument)
    elseif command == "inventory" then
        printInventory()
    else
        print("Unknown command.")
    end
end

-- Game loop
print("Welcome to the Text-Based Adventure Game!")
print("You are in " .. currentRoom .. ".")
while true do
    print("What would you like to do?")
    local input = io.read()
    handleInput(input)
end
