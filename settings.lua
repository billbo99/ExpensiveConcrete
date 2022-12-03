data:extend(
    {
        -- runtime-global
        { name = "ExpensiveConcrete-decom_crap", type = "bool-setting", default_value = true, setting_type = "runtime-global", order = "0100" },
        -- per player
        -- startup
        { name = "ExpensiveConcrete-coloured-plascrete-cost", type = "int-setting", default_value = 20, minimum_value = 1, maximum_value = 100, setting_type = "startup", order = "0100" },
        { name = "ExpensiveConcrete-coloured-refined-concrete-cost", type = "int-setting", default_value = 1, minimum_value = 1, maximum_value = 100, setting_type = "startup", order = "0110" },
    }
)
