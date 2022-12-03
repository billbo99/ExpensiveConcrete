local refined_concrete_entity = data.raw["tile"]["refined-concrete"]

data:extend(
    {
        {
            type = "tile",
            name = "plascrete",
            needs_correction = false,
            transition_merges_with_tile = "refined-concrete",
            minable = { hardness = 0.2, mining_time = 0.5, result = "plascrete" },
            mined_sound = refined_concrete_entity.mined_sound,
            collision_mask = { "ground-tile" },
            walking_speed_modifier = refined_concrete_entity.walking_speed_modifier + 0.2,
            layer = refined_concrete_entity.layer,
            decorative_removal_probability = 1,
            variants = {
                main = refined_concrete_entity.variants.main,
                inner_corner_mask = refined_concrete_entity.variants.inner_corner_mask,
                outer_corner_mask = refined_concrete_entity.variants.outer_corner_mask,
                side_mask = refined_concrete_entity.variants.side_mask,
                u_transition_mask = refined_concrete_entity.variants.u_transition_mask,
                o_transition_mask = refined_concrete_entity.variants.o_transition_mask,
                material_background = {
                    picture = "__ExpensiveConcrete__/graphics/terrain/concrete.png",
                    count = 8,
                    hr_version = {
                        picture = "__ExpensiveConcrete__/graphics/terrain/hr-concrete.png",
                        count = 8,
                        scale = 0.5
                    }
                }
            },
            walking_sound = refined_concrete_entity.walking_sound,
            map_color = { r = 60, g = 60, b = 60 },
            pollution_absorption_per_second = 0,
            vehicle_friction_modifier = refined_concrete_entity.vehicle_friction_modifier + 0.2
        },
        {
            type = "tile",
            name = "tefloncrete",
            needs_correction = false,
            -- transition_merges_with_tile = "refined-concrete",
            minable = { hardness = 0.2, mining_time = 0.5, result = "tefloncrete" },
            mined_sound = refined_concrete_entity.mined_sound,
            collision_mask = { "ground-tile" },
            walking_speed_modifier = 2,
            layer = refined_concrete_entity.layer * 2,
            decorative_removal_probability = 1,
            variants = {
                main = refined_concrete_entity.variants.main,
                inner_corner_mask = refined_concrete_entity.variants.inner_corner_mask,
                outer_corner_mask = refined_concrete_entity.variants.outer_corner_mask,
                side_mask = refined_concrete_entity.variants.side_mask,
                u_transition_mask = refined_concrete_entity.variants.u_transition_mask,
                o_transition_mask = refined_concrete_entity.variants.o_transition_mask,
                material_background = {
                    picture = "__ExpensiveConcrete__/graphics/terrain/teflon512.png",
                    count = 1,
                    hr_version = {
                        picture = "__ExpensiveConcrete__/graphics/terrain/teflon512.png",
                        count = 1,
                        scale = 0.5
                    }
                }
            },
            walking_sound = refined_concrete_entity.walking_sound,
            map_color = { r = 0.1, g = 0.1, b = 0.1, a = 0.1 },
            pollution_absorption_per_second = 0,
            vehicle_friction_modifier = 2
        }
    }
)
