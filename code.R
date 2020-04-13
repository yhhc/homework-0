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

# Ch 04
# Programming basics: conditionals

#Example 1
a <- 0
if(a!=0){print(1/a)}else{print("No reciprocal for 0.")}

#Example 2
murder_rate <- murders$total/murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind]<0.1){print(murders$state[ind])}else{print("No state has murder rate that low")}

#Example 3
a <- 0
ifelse(a!=0,1/a,NA)

#Example 4
a <- c(0,1,2,-4,5)
ifelse(a!=0,1/a,NA)

#Example 5
data(na_example)
sum(is.na(na_example))

#Example 6
no_nas <- ifelse(is.na(na_example),0,na_example)
sum(is.na(no_nas))

#Example 7
z <- c(TRUE,TRUE,FALSE)
any(z)
all(z)

# Programming basics: functions:

#Example 1
avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}
x <- 1:100
avg(x)

identical(mean(x),avg(x))

#Example 2
avg <- function(x,arithmetic=TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}
x <- 1:10
avg(x,arithmetic=FALSE)

# Programming basics: for loops

# Example 1
compute_s_n <- function(n){
  x <-1:n
  sum(x)
}

# Example 2
for(i in 1:5){
  print(i)
}

# Example 3

# Define a function
compute_s_n <- function(n){
  x <-1:n
  sum(x)
}

m <- 25
# Create an empty vector
s_n <- vector(length = m)

# Apply a for loop
for(n in 1:m){
  s_n[n] <- compute_s_n(n)
}

n <- 1:m
plot(n,s_n)
lines(n, n*(n+1)/2)

# DataCamp Assessment 4.0 Programming Basics

# Q1
x <- c(1,2,-3,4)
if(all(x>0)){
  print("All Positives")
}else{
  print("Not all positives")
}

# Q2
x <- c(TRUE,FALSE)
all(!x)

# Q3 ifelse
#char_len <- nchar(murders$state)
#head(char_len)

new_names <- ifelse(nchar(murders$state)>8,murders$abb,murders$state)

# Q4 function
sum_n <- function(n){
  x<-1:n
  sum(x)}

# Q5 function
altman_plot <- function(x,y){
  plot(y+x,y-x)
}
# Q6
  compute_s_n <- function(n){
    x<-1:n
    sum(x^2)
  }

