# 60201716 현선재

# Burger Data Frame 생성 (1-1)

brand = c("M", "L", "B")

menu = c("빅맥", "불고기버거", "치즈와퍼")
kcal = c(514, 533, 566)
na = c(917, 817, 920)
fat = c(15, 13, 12)

burger = data.frame(Menu=menu, Kcal=kcal, Na=na, Fat=fat)
rownames(burger) = brand
burger


# 2-1
burger["M", "Na"]

# 2-2
burger[, "Kcal"]

# 2-3
burger[-2, "Menu"]
