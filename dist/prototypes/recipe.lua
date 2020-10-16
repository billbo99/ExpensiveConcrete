data:extend(
    {
        {
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 20,
            ingredients = {
                {"refined-concrete", 20},
                {"steel-plate", 8},
                {"plastic-bar", 1},
                {amount = 100, name = "water", type = "fluid"}
            },
            name = "plascrete",
            result = "plascrete",
            result_count = 10,
            type = "recipe"
        },
        {
            category = "crafting-with-fluid",
            enabled = false,
            energy_required = 25,
            ingredients = {
                {"plascrete", 20},
                {amount = 100, name = "lubricant", type = "fluid"}
            },
            name = "tefloncrete",
            result = "tefloncrete",
            result_count = 10,
            type = "recipe"
        }
    }
)
