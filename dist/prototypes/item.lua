data:extend(
    {
        {
            type = "item",
            name = "plascrete",
            icon = "__ExpensiveConcrete__/graphics/icons/concrete.png",
            icon_size = 64,
            icon_mipmaps = 1,
            subgroup = "ExpensiveConcrete",
            order = "00",
            stack_size = 100,
            place_as_tile = {
                result = "plascrete",
                condition_size = 1,
                condition = {"water-tile"}
            }
        },
        {
            type = "item",
            name = "tefloncrete",
            icon = "__ExpensiveConcrete__/graphics/icons/teflon3.png",
            icon_size = 64,
            icon_mipmaps = 1,
            subgroup = "ExpensiveConcrete",
            order = "00",
            stack_size = 100,
            place_as_tile = {
                result = "tefloncrete",
                condition_size = 1,
                condition = {"water-tile"}
            }
        }
    }
)
