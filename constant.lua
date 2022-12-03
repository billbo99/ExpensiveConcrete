local constant = {}

constant.colors = {
    ["red"] = { i = 1, next = "green", player_color = { r = 0.815, g = 0.024, b = 0.0, a = 0.5 }, chat_color = { r = 1.000, g = 0.266, b = 0.241 } },
    ["green"] = { i = 2, next = "blue", player_color = { r = 0.093, g = 0.768, b = 0.172, a = 0.5 }, chat_color = { r = 0.173, g = 0.824, b = 0.250 } },
    ["blue"] = { i = 3, next = "orange", player_color = { r = 0.155, g = 0.540, b = 0.898, a = 0.5 }, chat_color = { r = 0.343, g = 0.683, b = 1.000 } },
    ["orange"] = { i = 4, next = "yellow", player_color = { r = 0.869, g = 0.5, b = 0.130, a = 0.5 }, chat_color = { r = 1.000, g = 0.630, b = 0.259 } },
    ["yellow"] = { i = 5, next = "pink", player_color = { r = 0.835, g = 0.666, b = 0.077, a = 0.5 }, chat_color = { r = 1.000, g = 0.828, b = 0.231 } },
    ["pink"] = { i = 6, next = "purple", player_color = { r = 0.929, g = 0.386, b = 0.514, a = 0.5 }, chat_color = { r = 1.000, g = 0.720, b = 0.833 } },
    ["purple"] = { i = 7, next = "brown", player_color = { r = 0.485, g = 0.111, b = 0.659, a = 0.5 }, chat_color = { r = 0.821, g = 0.440, b = 0.998 } },
    ["brown"] = { i = 8, next = "cyan", player_color = { r = 0.300, g = 0.117, b = 0.0, a = 0.5 }, chat_color = { r = 0.757, g = 0.522, b = 0.371 } },
    ["cyan"] = { i = 9, next = "acid", player_color = { r = 0.275, g = 0.755, b = 0.712, a = 0.5 }, chat_color = { r = 0.335, g = 0.918, b = 0.866 } },
    ["acid"] = { i = 10, next = "black", player_color = { r = 0.559, g = 0.761, b = 0.157, a = 0.5 }, chat_color = { r = 0.708, g = 0.996, b = 0.134 } },
    ["black"] = { i = 11, next = "red", player_color = { r = 0.1, g = 0.1, b = 0.1, a = 0.5 }, chat_color = { r = 0.5, g = 0.5, b = 0.5 } },

}

return constant
