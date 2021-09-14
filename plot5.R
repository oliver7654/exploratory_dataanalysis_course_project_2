# How have emissions from motor vehicle sources changed from
# 1999–2008 in Baltimore City?

library(stringr)

data <- get_data()
motor_vehicle_sources <- get_classes() %>%
  filter_all(any_vars(grepl("Vehicle", .)))

motor_vehicle_scc <- motor_vehicle_sources$SCC

total_motor_vehicle_baltimore <- data %>%
  filter(fips == "24510") %>%
  filter(SCC %in% motor_vehicle_scc) %>%
  group_by(year) %>%
  summarise(total = sum(Emissions))

png("plot5.png")
barplot(total ~ year, data = total_motor_vehicle_baltimore,
  xlab = "Year", ylab = "PM2.5 Emission",
  main = "PM2.5 Emissions from Motor Vehicles in Baltimore City")
dev.off()
