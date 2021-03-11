# 60201716 현선재

library(ggplot2)
library(dplyr)

mpg

# Q1
displ1 = mpg %>% filter(displ <= 4)
displ2 = mpg %>% filter(displ >= 5)

(hwy1 = mean(displ1$hwy))
(hwy2 = mean(displ2$hwy))
# 배기량이 4 이하인 차량이 고속도로 연비가 평균적으로 더 높다.

# Q2
US = mpg %>% filter(mpg$manufacturer %in% c("chevrolet", "dodge", "ford", "lincoln"))
JP = mpg %>% filter(mpg$manufacturer %in% c("honda", "nissan", "subaru", "toyota"))

US_mile = (US$cty + US$hwy) / 2
JP_mile = (JP$cty + JP$hwy) / 2

mean(US_mile)
mean(JP_mile)
# 일본 차량의 연비가 미국 차량의 연비보다 평균적으로 더 높다.

# Q3
# mpg$mileage = (mpg$cty + mpg$hwy) / 2
mpg = mpg %>% mutate(mileage=(mpg$cty + mpg$hwy)/2)

# Q3-1. 같은 모델이더라도 displ, year, cyl 등이 다르면 각자 다른 종류의 차량으로 계산했을 때
mpg %>% arrange(desc(mileage)) %>% head(1) %>% select(manufacturer, model, mileage)
# volkswagen 사의 new beetle 모델이 가장 연비가 높다.

# Q3-2. 같은 모델인 차량들의 연비 평균을 구하고 그 연비 평균을 기준으로 계산했을 때
mpg %>% group_by(model) %>% summarise(mileavg = mean(mileage), manufacturer = manufacturer) %>% 
  arrange(desc(mileavg)) %>% head(1) %>% select(manufacturer, model, mileavg)
# toyota 사의 corolla 모델이 가장 연비가 높다.
