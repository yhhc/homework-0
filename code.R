# The first line of code
library(dslabs)
data(murders)
library(dplyr)

murders <- mutate(murders,rate=total/population*100000)
filter(murders,rate<=0.71)
new_table <- select(murders,state,region,rate)
filter(new_table,rate<=0.71)

murders %>% select(state,region,rate) %>% filter(rate <=0.71)

# The 3rd videos of Ch3: Creating a data frame
grades <- data.frame(names=c("John","Juan","Jean","Yao"),
                     exam_1=c(95,80,90,85),
                     exam_2=c(90,85,85,90),
                     stringsAsFactors = FALSE)

# The fourth videos of Ch3: basic plots
population_in_millions <- murders$population/10^6
total_gun_murders <- murders$total
plot(population_in_millions, total_gun_murders)
hist(murders$rate)
murders$state[which.max(murders$rate)]
boxplot(rate~region, data=murders)

# Section 3 Assessment
library(dslabs)
data("heights")
options(digits=3)

# Q1
avg_height <- mean(heights$height)
ind <- heights$height >= avg_height
sum(ind)

# Q2
ind <- (heights$height >= avg_height)&(heights$sex == "Female")
sum(ind)

# Q3
mean(heights$sex == "Female")

# Q4a
min(heights$height)

# Q4b
match(min(heights$height),heights$height)

# Q4c
heights$sex[match(min(heights$height),heights$height)]

# Q5a
max(heights$height)

# Q5b
x <- 50:82

# Q5c
not_in_dataset <- !x %in% heights$height
sum(not_in_dataset)

# Q6a
height2 <- mutate(heights,ht_cm=height*2.54)
height2$ht_cm[18]

# Q6b
mean(height2$ht_cm)

# Q7a
females=filter(height2,sex=="Female")
nrow(females)

# Q7b
mean(females$ht_cm)

# Q8
library(dslabs)
data(olive)
head(olive)

names(olive)
plot(olive$palmitic,olive$palmitoleic)

# Q9
hist(olive$eicosenoic)

# Q10
boxplot(olive$palmitic~region,data=olive)






