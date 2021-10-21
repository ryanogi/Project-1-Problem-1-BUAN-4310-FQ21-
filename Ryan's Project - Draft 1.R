# 1. Load Data

patents_6 <- read.csv("C:/Users/Rogio/Downloads/patents_6.csv")

head(patents_6)

# 2. Patents by country

library(dplyr)

patents_by_country <- patents_6 %>%
  group_by(ee_country) %>%
  summarize(count = n())

head(patents_by_country)

# 3.A US Subset

patents_us <- subset(patents_6, ee_country == "US")

nrow(patents_us)

patents_us$time_to_approval <- patents_us$grantyear - 
  patents_us$applyear

patents_us_aggregate <- aggregate(time_to_approval ~ ee_state,
          data = patents_us, 
          FUN = mean)



# 3.B Japan Subset 

patents_jp <- subset(patents_6, ee_country == "JP")

nrow(patents_jp)

patents_jp$time_to_approval <- patents_jp$grantyear - 
  patents_jp$applyear

patents_jp_aggregate <- aggregate(time_to_approval ~ ee_state,
          data = patents_jp, 
          FUN = mean)