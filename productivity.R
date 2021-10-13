library(tidyverse)

P.df <- read_csv("MFP_OECD.csv")

P.lite.df <- P.df %>%
  filter(LOCATION == "USA" | LOCATION == "AUS" | LOCATION == "DEU" | LOCATION == "GBR" 
          | LOCATION == "JPN" ) %>%
  filter(MEASURE == "AGRWTH")


P.lite.df %>%
  ggplot(aes(x = TIME,
             y = Value))+
  geom_line(aes(color = LOCATION))+
  labs(title = "Figure 3: Multifactor productivity growth",
       y = "Productivity growth (%)",
       x = "Year",
       color = "Country")+
  scale_x_continuous(name = "Year", breaks = c(1960,1970,1980,1990,2000,2010),
                     labels = c("1960","1970", "1980","1990","2000","2010"))+
  scale_color_hue(labels = c("Australia", "Germany", "Great Britain", "Japan",
                              "USA"))






 
 