# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

data <- get_data()
total_baltimore <- data %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png("plot2.png")
barplot(total ~ year, data = total_baltimore,
  xlab = "Year",
  ylab = "Total PM2.5 Emission in Baltimore City",
  main = "PM2.5 Emissions in Baltimore City")
dev.off()
