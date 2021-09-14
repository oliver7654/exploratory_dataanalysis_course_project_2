# Compare emissions from motor vehicle sources in Baltimore City
# with emissions from motor vehicle sources in Los Angeles County, California.
# Which city has seen greater changes over time in motor vehicle emissions?

library(stringr)
library(ggplot2)

data <- get_data()
motor_vehicle_sources <- get_classes() %>%
  filter_all(any_vars(grepl("Vehicle", .)))

motor_vehicle_scc <- motor_vehicle_sources$SCC

total_motor_vehicle_bc_or_la <- data %>%
  filter(fips == "24510" | fips == "06037") %>%
  filter(SCC %in% motor_vehicle_scc) %>%
  group_by(year, fips) %>%
  summarise(total = sum(Emissions))

ggplot(total_motor_vehicle_bc_or_la,
  aes(x = factor(year), y = total, fill = fips)) +
  geom_col(position = "dodge", width = 0.5) +
  scale_fill_manual(
    labels = c("Los Angeles County", "Baltimore City"),
    values = c("red", "blue")
  ) +
  labs(x = "Year", y = "Total PM2.5 Emission", fill = "County")

ggsave("plot6.png")
