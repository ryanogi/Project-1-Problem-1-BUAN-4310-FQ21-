#Load Data
Patents <-read.csv("E:/JoelPaul/Desktop/Rstudios/patents_6.csv")
View(Patents)
head(Patents)
tail(Patents)

install.packages("dplyr")

#Patents by country
library(dplyr)

patents_by_country <- Patents %>%
  group_by(ee_country) %>%
  summarize(count = n())

head(patents_by_country)
tail(patents_by_country)
View(patents_by_country)

#South Korea(KR) Subset
Patents_kr <- subset(patents_6, ee_country == "KR")

nrow(Patents_kr)
#1982 subsets in Japan

Patents_kr$time_to_approval <- Patents_kr$grantyear - Patents_kr$applyear

Patents_kr_aggregate <- aggregate(time_to_approval ~ ee_state, data = Patents_kr,FUN = mean)

#1. Country having the highest number of patent applications?
table(Patents$ee_country) 
# Ans. US with 14095

#2. Which filled up the majority of the role given?
table(Patents$ee_role_desc)
# Ans. Foreign company or corporation partial owner 

#3. Which year was most amount of patents applied for?
table(Patents$applyear)
# Ans.On 2014 there were 3132 applications

#4. Which year had the highest amount of Grant?
table(Patents$grantyear)
# Ans. 2019 with 3884

#5. Country with the highest and lowest grant duration
Patents$approval_time= Patents$grantyear - Patents$applyear
X=aggregate(approval_time ~ ee_country,data = Patents,FUN = mean)
which.min(X$approval_time)
which.max(X$approval_time)
#Ans. Highest grant duration is 76
#Ans. Lowest grant duration is 76

#6 Following queries are specific to KR(South Korea).
Patent_KR <- subset(Patents, ee_country == "KR")
View(Patent_KR)

#6A How many patents are there in KR(South Korea)
table(Patent_KR$ee_state)
#Ans. 1982

#6B Which city has the highest number of patents 
table(Patent_KR$ee_city)
#Ans. Siheung-si with 635

#6C How much is the lowest approval of time
min(X$approval_time)
#Ans. 1 year

#6D How much is the highest approval of time
max(X$approval_time)
#Ans. 6 years


