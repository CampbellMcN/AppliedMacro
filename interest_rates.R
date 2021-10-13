library(tidyverse)


R.df <- read_csv("bond_yield.csv")

R.df$TIMENUM = as.numeric(R.df$TIME)

R.lite.df <- R.df %>%
  filter(FREQUENCY == "A")%>%
  filter(LOCATION == "AUS" | LOCATION == "USA" | LOCATION == "CHL" 
         | LOCATION == "DEU" | LOCATION == "GBR"| LOCATION == "IND" 
           | LOCATION == "JPN" | LOCATION == "MEX" | LOCATION =="ZAF")


R.lite.df %>%
  ggplot(aes(x = TIMENUM,
             y = Value))+
  geom_line(aes(color = LOCATION))+
  labs(title = "Figure 1: Long term interest rates",
       y = "Interest rate (%)",
       x = "Year",
       color = "Country")+
  scale_x_continuous(name = "Year", breaks = c(1960,1970,1980,1990,2000,2010),
                   labels = c("1960","1970", "1980","1990","2000","2010"))+
  scale_color_hue(labels = c("Australia", "Chile", "Germany", "Great Britain",
                             "India", "Japan", "Mexico", "USA", "South Africa"))
