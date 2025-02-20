# Coding Challenge 3 - Data Visualization 2

# Question 1

data <- read.csv("MycotoxinData.csv", na.strings = "na") # reading in the data, specifying to not include the na values
library(ggplot2) # loading ggplot

cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") # created vector for colorblind colors

q1 <- ggplot(data = data, aes(x = Treatment, y = DON, fill = Cultivar)) + # setting plot type and axes
  geom_boxplot(position = position_dodge(width = 0.9), aes(color = Cultivar)) +  # boxplot with cultivar colors
  stat_summary(fun = mean, position = "dodge") + # adding means 
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+ # adding error bars and setting dodge
  geom_point(position = position_jitterdodge(dodge.width = 0.9), shape = 21, color = "black", alpha = 0.6) +  # jittered data points, added transparency
  xlab("") + # x axis label
  ylab("DON (ppm)") + # y axis label
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) + # setting color outline
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) + # setting color fill
  theme_classic() +  # classic theme for plot
  facet_wrap(~Cultivar) # separate plots by subtype of cultivar
q1

# Question 2
data$Treatment <- factor(data$Treatment, levels = c("NTC", "Fg", "Fg + 37", "Fg + 40", "Fg + 70")) # changing from default levels to ones specified

ggplot(data = data, aes(x = Treatment, y = DON, fill = Cultivar)) +
  geom_boxplot(position = position_dodge(width = 0.9), aes(color = Cultivar)) +  # boxplot with cultivar colors
  stat_summary(fun = mean, position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  geom_point(position = position_jitterdodge(dodge.width = 0.9), shape = 21, color = "black", alpha = 0.6) +  # jittered data points, added transparency
  xlab("") +
  ylab("DON (ppm)") +
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) + 
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) +
  theme_classic() +  # classic theme for plot
  facet_wrap(~Cultivar)

# Question 3 
# plotting X15ADON
q3a <- ggplot(data = data, aes(x = Treatment, y = X15ADON, fill = Cultivar)) + # changed y variable
  geom_boxplot(position = position_dodge(width = 0.9), aes(color = Cultivar)) +  # boxplot with cultivar colors
  stat_summary(fun = mean, position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  geom_point(position = position_jitterdodge(dodge.width = 0.9), shape = 21, color = "black", alpha = 0.6) +  # jittered data points, added transparency
  xlab("") +
  ylab("15ADON") + # changed label
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) + 
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) +
  theme_classic() +  # classic theme for plot
  facet_wrap(~Cultivar)
q3a

# plotting massperseed
q3b <- ggplot(data = data, aes(x = Treatment, y = MassperSeed_mg, fill = Cultivar)) + # changed y variable
  geom_boxplot(position = position_dodge(width = 0.9), aes(color = Cultivar)) +  # boxplot with cultivar colors
  stat_summary(fun = mean, position = "dodge") +
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  geom_point(position = position_jitterdodge(dodge.width = 0.9), shape = 21, color = "black", alpha = 0.6) +  # jittered data points, added transparency
  xlab("") +
  ylab("Seed Mass (mg)") + # changed y label to be accurate
  scale_color_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) + 
  scale_fill_manual(values = c("Ambassador" = "#56B4E9", "Wheaton" = "#F0E442")) +
  theme_classic() +  # classic theme for plot
  facet_wrap(~Cultivar)
q3b

# Question 4
# loading required packages
library(tidyverse)
library(ggpubr)
library(ggrepel)

figure <- ggarrange(
  q1,     # first plot
  q3a,    # second plot
  q3b,    # third plot
  labels = c("A", "B", "C"), # manually specify capital labels
  nrow = 1,  # arrange plots in one row
  ncol = 3,   # three columns
  common.legend = T
)
figure

# common legend makes it to where there is one legend for all of the plots in the figure, whereas without it, the legend is displayed inside each subplot. 

# Question 5
q5a <- q1 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance
q5a

q5b <- q3a +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance
q5b

q5c <- q3b +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance
q5c

# arranging plots again
q5figure <- ggarrange(
  q5a,     # first plot
  q5b,    # second plot
  q5c,    # third plot
  labels = c("A", "B", "C"), # manually specify capital labels
  nrow = 1,  # arrange plots in one row
  ncol = 3,   # three columns
  common.legend = T
)
q5figure

