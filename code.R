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
