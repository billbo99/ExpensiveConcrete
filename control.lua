local constant = require("constant")
local colors = constant.colors

local function starts_with(str, start)
    return str:sub(1, #start) == start
end

local function OnConfigurationChanged(e)
    if e.mod_changes and e.mod_changes["ExpensiveConcrete"] then
        for _, force in pairs(game.forces) do
            local recipes = force.recipes
            local tech = "concrete-2"
            if force.technologies[tech] and force.technologies[tech].researched then
                for _, effect in pairs(force.technologies[tech].effects) do
                    if effect.type and effect.type == "unlock-recipe" then
                        if recipes[effect.recipe] then
                            recipes[effect.recipe].enabled = true
                            recipes[effect.recipe].reload()
                        end
                    end
                end
            end
        end
    end
end

local function order_deconstruction(surface, force, position, typ)
    local tile = surface.find_entities_filtered {
        position = position,
        radius = 1,
        type = typ
    }
    if tile and #tile > 0 then
        for _, entity in pairs(tile) do
            if entity.minable then
                entity.order_deconstruction(force)
            end
        end
    end

end

local function RobotTileBuilt(e)
    if not (settings.global["ExpensiveConcrete-decom_crap"].value) then return end
    if e.tile.name ~= "tefloncrete" and not (starts_with(e.tile.name, "plascrete")) then return end

    local surface = game.get_surface(e.surface_index)

    if surface then
        for _, tile in pairs(e.tiles) do
            order_deconstruction(surface, e.robot.force, tile.position, { "tree", "simple-entity", "cliff" })
        end
    end
end

local function PlayerTileBuilt(e)
    if not (settings.global["ExpensiveConcrete-decom_crap"].value) then return end
    if e.tile.name ~= "tefloncrete" and not (starts_with(e.tile.name, "plascrete")) then return end

    local surface = game.get_surface(e.surface_index)
    local player = game.get_player(e.player_index)

    if surface and player then
        for _, tile in pairs(e.tiles) do
            order_deconstruction(surface, player.force, tile.position, { "tree", "simple-entity", "cliff" })
        end
    end
end

local function FlyingText(text, position, color)
    color = color or { r = 1, g = 1, b = 1 }

    -- local surface = game.surfaces.nauvis
    return game.surfaces.nauvis.create_entity {
        name = "tutorial-flying-text",
        text = text,
        position = { x = position.x, y = position.y - 1 },
        color = color
    }
end

script.on_event(
    "concrete-rotate",
    function(e)
        local player = game.players[e.player_index]
        if player.cursor_stack and player.cursor_stack.valid_for_read then
            local color, name
            if string.match(player.cursor_stack.name, "plascrete%-(%a+)") then
                color = string.match(player.cursor_stack.name, "plascrete%-(%a+)")
                name = "plascrete"
            end
            if string.match(player.cursor_stack.name, "(%a+)%-refined%-concrete") then
                color = string.match(player.cursor_stack.name, "(%a+)%-refined%-concrete")
                name = "refined-concrete"
            end
            if colors[color] then
                FlyingText(colors[color].next, player.position, colors[colors[color].next].chat_color)
                if name == "plascrete" then name = "plascrete-" .. colors[color].next end
                if name == "refined-concrete" then name = colors[color].next .. "-refined-concrete" end
                player.cursor_stack.set_stack {
                    name = name,
                    count = player.cursor_stack.count
                }
            end
        end
    end
)

script.on_event(defines.events.on_player_built_tile, PlayerTileBuilt)
script.on_event(defines.events.on_robot_built_tile, RobotTileBuilt)
script.on_configuration_changed(OnConfigurationChanged)
