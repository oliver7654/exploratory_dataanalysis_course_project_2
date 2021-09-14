# Across the United States, how have emissions from
# coal combustion-related sources changed from 1999–2008?

library(stringr)

data <- get_data()
coal_combustion_sources <- get_classes() %>%
  filter(str_detect(Short.Name, "Coal"))
coal_combustion_scc <- coal_combustion_classes$SCC

total_coal_combustion <- data %>%
  filter(SCC %in% coal_combustion_scc) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png("plot4.png")
barplot(total ~ year, data = total_coal_combustion,
  xlab = "Year", ylab = "PM2.5 Emission",
  main = "PM2.5 Emissions from Coal Combustion across USA")
dev.off()
