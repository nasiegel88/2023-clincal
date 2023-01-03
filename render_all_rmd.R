# Render all markdown files for manuscript
library(rmarkdown)

lapply(list.files(pattern = "[.]rmd$"), function(x) {
  rmarkdown::render(x, output_dir = 'documents')
  rm(list = ls())
  })