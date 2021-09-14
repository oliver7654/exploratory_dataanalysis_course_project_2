# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

data <- get_data()
total <- data %>% group_by(year) %>% summarise(total = sum(Emissions))

png("plot1.png")
barplot(total ~ year, data = total,
  xlab = "Year",
  ylab = "Total PM2.5 Emission",
  main = "PM2.5 Emissions across USA")
dev.off()
