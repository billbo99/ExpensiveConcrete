local constant = require("constant")
local colors = constant.colors

require("prototypes.item-subgroup")
require("prototypes.tile")
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.technology")

local concrete_tile = data.raw.tile["plascrete"]
local concrete_item = data.raw.item["plascrete"]
local concrete_recipe = data.raw.recipe["plascrete"]
local tech = data.raw.technology["concrete-2"]

for color_name, color in pairs(colors) do
    local new_tile = table.deepcopy(concrete_tile)
    new_tile.name = new_tile.name .. "-" .. color_name
    new_tile.localised_name = { "", { "color." .. color_name }, " ", { "tile-name." .. concrete_tile.name } }
    new_tile.minable.result = new_tile.name
    new_tile.tint = color.chat_color
    new_tile.order = "a-e-" .. color_name
    new_tile.layer = concrete_tile.layer + (color.i * 3)
    new_tile.map_color = color.player_color
    data:extend { new_tile }

    local new_item = table.deepcopy(concrete_item)
    new_item.name = new_item.name .. "-" .. color_name
    new_item.localised_name = { "", { "color." .. color_name }, " ", { "tile-name." .. concrete_tile.name } }
    new_item.place_as_tile.result = new_item.name
    new_item.icons = { { icon = "__ExpensiveConcrete__/graphics/icons/concrete.png", icon_size = 64, icon_mipmaps = 1, tint = color.chat_color } }
    new_item.order = concrete_tile.name .. '-' .. color_name
    data:extend { new_item }

    local new_recipe = table.deepcopy(concrete_recipe)
    new_recipe.name = new_recipe.name .. "-" .. color_name
    new_recipe.localised_name = { "", { "color." .. color_name }, " ", { "tile-name." .. concrete_tile.name } }
    new_recipe.ingredients = { { "plascrete", settings.startup["ExpensiveConcrete-coloured-plascrete-cost"].value } }
    new_recipe.result_count = 1
    new_recipe.result = new_recipe.name
    new_recipe.order = concrete_tile.name .. '-' .. color_name
    data:extend { new_recipe }

    table.insert(tech.effects, { recipe = new_recipe.name, type = "unlock-recipe" })
end

local refined_concrete_tile = data.raw.tile["refined-concrete"]
local refined_concrete_item = data.raw.item["refined-concrete"]
local refined_concrete_recipe = data.raw.recipe["refined-concrete"]
for color_name, color in pairs(colors) do
    local tile = data.raw.tile[color_name .. "-" .. refined_concrete_tile.name]
    tile.minable = table.deepcopy(refined_concrete_tile.minable)
    tile.minable.result = tile.name

    local new_item = table.deepcopy(refined_concrete_item)
    new_item.name = color_name .. "-" .. new_item.name
    new_item.localised_name = { "", { "color." .. color_name }, " ", { "tile-name." .. refined_concrete_tile.name } }
    new_item.place_as_tile.result = new_item.name
    new_item.icons = { { icon = refined_concrete_item.icon, icon_size = 64, icon_mipmaps = 4, tint = color.chat_color } }
    new_item.order = refined_concrete_tile.name .. '-' .. color_name
    data:extend { new_item }

    local new_recipe = table.deepcopy(refined_concrete_recipe)
    new_recipe.name = color_name .. "-" .. new_recipe.name
    new_recipe.localised_name = { "", { "color." .. color_name }, " ", { "tile-name." .. refined_concrete_tile.name } }
    new_recipe.ingredients = { { "refined-concrete", settings.startup["ExpensiveConcrete-coloured-refined-concrete-cost"].value } }
    new_recipe.result_count = 1
    new_recipe.result = new_recipe.name
    new_recipe.order = refined_concrete_tile.name .. '-' .. color_name
    data:extend { new_recipe }

    table.insert(tech.effects, { recipe = new_recipe.name, type = "unlock-recipe" })
end



data:extend(
    {
        {
            type = "custom-input",
            name = "concrete-rotate",
            key_sequence = "R"
        }
    }
)

log(serpent.block(data.raw))
