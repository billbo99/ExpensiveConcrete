local constant = require("constant")
local colors = constant.colors

local function FlyingText(text, position, color)
    color = color or {r = 1, g = 1, b = 1}

    -- local surface = game.surfaces.nauvis
    return game.surfaces.nauvis.create_entity {
        name = "tutorial-flying-text",
        text = text,
        position = {x = position.x, y = position.y - 1},
        color = color
    }
end

script.on_event(
    "concrete-rotate",
    function(e)
        local player = game.players[e.player_index]
        if player.cursor_stack and player.cursor_stack.valid_for_read then
            local color = string.match(player.cursor_stack.name, "plascrete%-(%a+)")
            if colors[color] then
                FlyingText(colors[color].next, player.position, colors[colors[color].next].chat_color)
                player.cursor_stack.set_stack {
                    name = "plascrete-" .. colors[color].next,
                    count = player.cursor_stack.count
                }
            end
        end
    end
)
