#
#
#
#
#
#
#
#
#
#| message: false
library(tidyverse)
library(broom)
#
#
#
read_csv("marketing_AB.csv/marketing_AB.csv", show_col_types = FALSE) |> 
  drop_na() |> 
  group_by(`test group`) |> 
  summarize(mean_conversion = mean(converted)) |> 
  ggplot(aes(x = `test group`, y = mean_conversion)) +
  geom_col() +
  scale_y_continuous(labels = scales::percent)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
