This is an example of an R code chunk.

``` r
library(knitr)
library(ggplot2)
library(markdown)

data("mtcars")
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_smooth(method = lm, se = FALSE) +
  geom_point(aes(color = wt)) +
  xlab("Weight") + 
  ylab("Miles per gallon") +
  scale_colour_gradient(low = "forestgreen", high = "black") + 
  geom_smooth()
```

    ## `geom_smooth()` using formula = 'y ~ x'
    ## `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

![](Coding-notes-markdown_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

R markdown formatting options

# First level header

## Second level header

### Third level header

`*italic*` `_italic_` `**bold**` `__bold__`

Blockquotes: \> “I thoroughly disapprove of duels. If a man should
challenge me, I would take him kindly and forgivingly by the hand and
lead him to a quiet place and kill him.” \> \> — Mark Twain
