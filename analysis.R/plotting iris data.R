# lets install some packages
#renv::install(c('tidyverse', 'ggpubr'))


# lets plot some data
library(tidyverse)
library(ggpubr)

head(iris)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth()


# per group
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth()
