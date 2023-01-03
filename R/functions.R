# export figures
## x = rmd names
## i = analysis
## z = plot
#######
# non-linear model export
export.nonlinear <- function(z, i, x){
  dir=file.path("../results", "non-linear-models", paste(x ,"_",i,".tiff",  sep = ""))
  file <- z
  ggsave(dir, plot = file, width = 12, height = 5, units = "in", compression = "lzw")
}
# non-linear model for controls export
export.nonlinear_control <- function(z, i, x){
  dir=file.path("../results", "non-linear-models","control-models" , paste(x ,"_",i,".tiff",  sep = ""))
  file <- z
  ggsave(dir, plot = file, width = 12, height = 5, units = "in", compression = "lzw")
}
# non-linear model for abx export
export.nonlinear_abx <- function(z, i, x){
  dir=file.path("../results", "non-linear-models", "abx-models", paste(x ,"_",i,".tiff",  sep = ""))
  file <- z
  ggsave(dir, plot = file, width = 12, height = 5, units = "in", compression = "lzw")
}
# linear model export
export.linear <- function(z, i){
  dir=file.path("../results", "linear-models",  paste(x ,"_",i,".tiff",  sep = ""))
  file <- z
  ggsave(dir, plot = file, width = 12, height = 5, units = "in", compression = "lzw")
}
