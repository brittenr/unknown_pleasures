# Libraries
#########
library(tidyverse)
library(plotKML)
library(ggridges)

# Config
########é

config <- yaml::read_yaml('config.yaml')

# Functions
########
sapply(
  paste0('R/functions/',list.files('R/functions'))
  ,source
)
