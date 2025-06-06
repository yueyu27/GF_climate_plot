
#####################################
# Project: Drought adaptation project
#
# Part 1: Plot GF clim rank
#
# 2025 May 31st
# by: Yue Yu
#
#####################################

# Local Desktop R studio


#####################################
# Project: Drought adaptation project
#
# Part 1: Plot GF clim rank
#
# 2025 May 31st
# by: Yue Yu
#
#####################################

# Local Desktop R studio

setwd("/Users/yueyu/Desktop/GF_climate")

library(dplyr)
library(ggplot2)

a <- read.delim("GForest_Rank_Vars.txt", header = T, sep = "\t")

# Order Climate by Importance descending
a_plot <- a %>%
  arrange(desc(Predictor_Importance_by_GF)) %>%
  mutate(Climate = factor(Climate, levels = Climate))


# Custom colors for each type
type_colors <- c(
  "Temperature_related" = "indianred3",
  "Moisture_related" = "royalblue",
  "Both" = "sandybrown"
)

# Plot all 19 variables
ggplot(a_plot, aes(x = Climate, y = Predictor_Importance_by_GF, fill = Type)) +
         geom_col() +
         coord_flip() +
         scale_fill_manual(values = type_colors) +
         labs(x = "Climate Variable",
              y = "Importance Score",
              fill = "Variable Type") +
         theme_classic()
       
       
  
# Plot only Top 8 climate variables
ggplot(a_plot[1:8,], aes(x = Climate, y = Predictor_Importance_by_GF, fill = Type)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = type_colors) +
  labs(x = "Climate Variable",
       y = "Importance Score",
       fill = "Climate Type") +
  theme_classic() +
  theme(
    axis.text.x = element_text(color = "black"),
    axis.text.y = element_text(color = "black")
  )



# Plot DIRECT VARS climate variables - ADD LATER WHEN PLOT AGAIN
ggplot(a_plot[c(1,2,4,5,???,14,15),], aes(x = Climate, y = Predictor_Importance_by_GF, fill = Type)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = type_colors) +
  labs(x = "Climate Variable",
       y = "Importance Score",
       fill = "Climate Type") +
  theme_classic() +
  theme(
    axis.text.x = element_text(color = "black"),
    axis.text.y = element_text(color = "black")
  )



# END
