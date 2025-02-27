The data for this document is accessible here: [Manuscript with
data](https://doi.org/10.1094/PDIS-06-21-1253-RE) Here is the full
citation for this data: Noel, Z.A., Roze, L.V., Breunig, M., Trail, F.
2022. Endophytic fungi as promising biocontrol agent to protect wheat
from Fusarium graminearum head blight. Plant
Disease.https://doi.org/10.1094/PDIS-06-21-1253-RE

## Question 1

A YAML header is present at the top of a Markdown file that gives the
title, author, and date of when the file was created. It also indicates
what the format of the output should be, with common choices including
pdf, word doc, and HTML files.

Literate programming is a mixture of input and output code that allow
for fully reproducible documents.

## Question 2

This is the code chunk for the DON data.

``` r
data <- read.csv("MycotoxinData.csv", na.strings = "na") # reading in the data, specifying to not include the na values
library(ggplot2) # loading ggplot
library(tinytex)

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
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).
    ## Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).

    ## Warning: Width not defined
    ## ℹ Set with `position_dodge(width = ...)`

    ## Warning: Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).
    ## Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

![](Coding-Challenge-4_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->
This is the code chunk for 15ADON data.

``` r
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
```

This is the code chunk for Seedmass.

``` r
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
```

This is the code chunk for arranging the three figures using ggarrange.

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ lubridate 1.9.4     ✔ tibble    3.2.1
    ## ✔ purrr     1.0.4     ✔ tidyr     1.3.1
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(ggpubr)
library(ggrepel)


# common legend makes it to where there is one legend for all of the plots in the figure, whereas without it, the legend is displayed inside each subplot. 

# Question 5
q5a <- q1 + 
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance

q5b <- q3a +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance

q5c <- q3b +
  geom_pwc(aes(group = Treatment), method = "t_test", label = "p.adj.signif") # adding * for significance

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
```

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).
    ## Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Width not defined
    ## ℹ Set with `position_dodge(width = ...)`

    ## Warning: Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).
    ## Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).
    ## Removed 8 rows containing non-finite outside the scale range
    ## (`stat_summary()`).

    ## Warning: Removed 8 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Width not defined
    ## ℹ Set with `position_dodge(width = ...)`

    ## Warning: Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).
    ## Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).

    ## Warning: Removed 8 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_summary()`).
    ## Removed 10 rows containing non-finite outside the scale range
    ## (`stat_summary()`).

    ## Warning: Removed 10 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Width not defined
    ## ℹ Set with `position_dodge(width = ...)`

    ## Warning: Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).
    ## Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).

    ## Warning: Removed 10 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_boxplot()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_summary()`).
    ## Removed 2 rows containing non-finite outside the scale range
    ## (`stat_summary()`).

    ## Warning: Removed 2 rows containing non-finite outside the scale range
    ## (`stat_pwc()`).

    ## Warning: Width not defined
    ## ℹ Set with `position_dodge(width = ...)`

    ## Warning: Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).
    ## Removed 5 rows containing missing values or values outside the scale range
    ## (`geom_segment()`).

    ## Warning: Removed 2 rows containing missing values or values outside the scale range
    ## (`geom_point()`).

``` r
q5figure
```

![](Coding-Challenge-4_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
