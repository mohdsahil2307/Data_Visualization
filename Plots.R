library(tidyverse)
library(ggplot2)
library(hrbrthemes)

planets <- readr::read_csv("data/planets.csv")
planets


# This plot gets the planets with shortest year !
planets |>
  arrange(pl_orbper)|>
  slice(1:30)|>
  ggplot()+
  aes(x=pl_orbper*24,y=pl_hostname , colour=pl_discmethod)+
  labs(y = "Hostname", x = "Orbital Period (Earth Hours)")+
  geom_point(size=5)+
  scale_fill_ipsum() +
  theme_ft_rc(14)

#Show the temperatures of planets with shortest year
planets |>
  arrange(pl_orbper)|>
  slice(1:30)|>
  ggplot()+
  aes(y=pl_hostname , x=st_teff-273.15 , colour=pl_discmethod)+
  labs(x = "Temperature (C)", y = "hostname")+
  geom_point()


planets |>
  arrange(desc(pl_orbper))|>
  slice(1:30) |>
  ggplot()+
  aes(x=pl_orbper,y=pl_hostname , colour=pl_discmethod)+
  labs(y = "Hostname", x = "Orbital Period (Earth Days)")+
  geom_point() -> resulting_plot
library(scales)
resulting_plot + scale_x_continuous(labels = label_comma())


planets |>
  arrange(desc(pl_orbper))|>
  slice(1:30) |>
  ggplot()+
  aes(y=pl_hostname,x=st_teff-273.15 , colour=pl_discmethod)+
  labs(x = "Temperature (C)", y = "hostname")+
  geom_point() 
