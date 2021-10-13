library(tidyverse)

I.df <- read_csv("inflation.csv") %>%
  pivot_longer(5:65, names_to = "year", values_to = "Value")
  
I.df$year = as.numeric(I.df$year)

I.lite.df <- I.df %>%
  filter(`Country Code` == "AUS" | `Country Code` == "USA" |`Country Code` == "GBR" |
           `Country Code` == "DEU" |`Country Code` == "JPN" |
           `Country Code` == "ZAF" |`Country Code` == "IND" | 
           `Country Code` == "CHN")

I.lite.df %>%
  ggplot(aes(x = year,
             y = Value))+
  geom_line(aes(color = `Country Code`))+
  labs(title = "Figure 2: Annual inflation",
       y = "Inflation Rate (%)",
       x = "Year",
       color = "Country")+
  scale_x_continuous(name = "Year", breaks = c(1960,1970,1980,1990,2000,2010),
                     labels = c("1960","1970", "1980","1990","2000","2010"))+
  scale_color_hue(labels = c("Australia", "China", "Germany", "Great Britain",
                             "India", "Japan", "USA", "South Africa"))

