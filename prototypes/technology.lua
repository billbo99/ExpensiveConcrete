local new_tech = table.deepcopy(data.raw.technology["concrete"])
new_tech.name = "concrete-2"
new_tech.prerequisites = {"concrete", "plastics", "steel-processing", "lubricant"}
new_tech.unit = {
    count = 250,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
    },
    time = 30
}
new_tech.effects = {
    {recipe = "plascrete", type = "unlock-recipe"},
    {recipe = "tefloncrete", type = "unlock-recipe"}
}

data:extend {new_tech}
