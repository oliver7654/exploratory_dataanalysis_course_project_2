# Of the four types of sources indicated by the
# type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions
# from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

data <- get_data()
total_baltimore_bytype <- data %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(total = sum(Emissions))

ggplot(total_baltimore_bytype, aes(x = factor(year), y = total, fill = type)) +
  geom_col(position = "dodge", width = 0.5) +
  labs(x = "Year", y = "Total PM2.5 Emission", fill = "Type")
ggsave("plot3.png")
