#05/15/2021
#


library(tidyverse)
library(hrbrthemes)



NOAA <- read.csv("./NOAA_data_RAW.csv")

head(NOAA)

NOAA$DATE <- as.Date(NOAA$DATE)
head(NOAA)
class(NOAA$DATE)

UMN1 <- NOAA %>% 
  filter(STATION == "USC00214106")
head(UMN1)

head(set)
class(set$longdate)

mygraph <- ggplot() +
  geom_line(data = set, aes(x = as.Date(longdate), y =meantemp), color = "red", lwd = .5)  +  # must include argument label "data"
  geom_line(data = UMN1, aes(x = as.Date(DATE), y = SNWD))

mygraph = mygraph + scale_x_date(date_breaks = "2 weeks", date_labels = "%m/%d/%y") + 
  scale_y_continuous(breaks = seq(-20,30,5), minor_breaks = NULL)
mygraph = mygraph + theme(axis.text.x = element_text(angle = 45, vjust = 0.9,
                                                     hjust = 0.9, size = rel(1.5))) +
  theme(axis.text.y = element_text(size = rel(2)))+
  coord_cartesian(xlim = c(start, end), ylim = c(-30, 35))

mygraph = mygraph + theme(plot.title = element_text(hjust = 0.5, size = rel(2.5))) +
  theme(axis.title = element_text(size = rel(2.25)))  



print(mygraph)



