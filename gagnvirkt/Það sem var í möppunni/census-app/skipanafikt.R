# census-app skipanir


install.packages("plyr");
library(plyr);

counties[counties$name=="maryland,baltimore",]
asiancounties = arrange(counties,asian)
asiancounties = arrange(counties,asian)
View(asiancounties)
asiancounties = arrange(counties,desc(asian))
View(asiancounties)

subset(counties, grepl("new york",name))