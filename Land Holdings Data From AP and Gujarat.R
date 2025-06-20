# Here I attempt to make some bar charts utilizing the little data we could get from
# the 2011 Indian Census survey, ideally to gain a visual depiction of the rates of 
# land ownership differences between Sc/ST households and uppercaste households. 
# While this suffers from not yet having checked and corrected for ratio, this is merely
# a beginning attempt at providing data-led visuals for this paper.

library(ggplot2)
library(tidyr)

# Uploading our data; please feel free to view the tables from this.
gujarat <- read.csv("gujarat_land_distribution.csv")

gujarat_long <- pivot_longer(gujarat, cols = -Group, names_to = "Size", values_to = "Percent")

ggplot(gujarat_long, aes(x = Group, y = Percent, fill = Size)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Land Access Disparities in Gujarat by Caste (NSS 2009–10)",
       y = "Percentage of Households", x = "Social Group") +
  theme_minimal()

# Now let us do Andhra Pradesh (AP):

library(ggplot2)

ap <- read.csv("ap_mean_landholdings.csv")

ggplot(ap, aes(x = Group, y = Mean.Land.Holding..ha., fill = Group)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Land Holdings by Caste in Coastal Andhra Pradesh",
       y = "Land in Hectares", x = "") +
  theme_minimal()