# install specific versions of packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

if(!require(remotes)){
  install.packages("remotes")
  library(remotes)
}
if(!require(devtools)){
  install_version("devtools", "2.4.0")
  library(devtools)
}
if(!require(xlsx)){
  install_version("xlsx", "0.6.5")
  library("xlsx")
}
if(!require(renv)){
  install_version("renv", "0.12.5")
  library(renv)
}
if(!require(RColorBrewer)){
  install.packages("RColorBrewer")
  library("RColorBrewer")
}
if(!require(stringr)){
  install_version("stringr", "1.4.0")
  library(stringr)
}
if(!require(svglite)){
  install_version("svglite", "2.0.0")
  library(svglite)
}
if(!require(rstatix)){
  install_version("rstatix", "0.5.0")
  library(rstatix)
}
if(!require(ggpubr)){
  install_version("ggpubr", "0.3.0")
  library(ggpubr)
}
if(!require(ggsci)){
  install_version("ggsci", "2.9")
  library(ggsci)
}
if(!require(ggrepel)){
  install_version("ggrepel", "0.9.1")
  library(ggrepel)
}
if(!require(ape)){
  install_version("ape", "5.4-1")
  library(ape)
}
if(!require(igraph)){
  install_version("igraph", "1.2.6")
  library(igraph)
}
if(!require(phyloseq)){
  BiocManager::install("phyloseq")
  library(phyloseq)
}
if(!require(tidyverse)){
  install_version("tidyverse", "1.3.0")
  library(tidyverse)
}
if(!require(qiime2R)){
  remotes::install_github("jbisanz/qiime2R@0.99.20")
  library(qiime2R)
}
if(!require(splinectomeR)){
  remotes::install_github('RRShieldsCutler/splinectomeR@v0.9.3b')
  library(splinectomeR)
}
if(!require(reshape)){
  install_version("reshape", "0.8.8")
  library(reshape)
}
if(!require(data.table)){
  install_version("data.table", "1.13.6")
  library(data.table)
}
if(!require(microbiome)){
  remotes::install_github("microbiome/microbiome@e0e24cb") # Commits on Jan 14, 2022
  library(microbiome)
}
if(!require(redres)){
  devtools::install_github("goodekat/redres@714227e")
  library("redres")
}
if(!require(dplyr)){
  install_version("dplyr", "1.0.6")
  library(dplyr)
}
if(!require(readxl)){
  install_version("readxl", "1.3.1")
  library(readxl)
}
# easystats are dependencies for sjplot
 if(!require(parameters)){
   remotes::install_github("easystats/parameters@546d538")
   library(parameters)
 }
# if(!require(insight)){
#   remotes::install_github("easystats/insight@e104d8a95")
#   library(insight)
# }
# if(!require(datawizard)){
#   remotes::install_github("easystats/datawizard@c9aad9086")
#   library(datawizard)
# }
# if(!require(bayestestR)){
#   remotes::install_github("easystats/bayestestR@394982669")
#   library(bayestestR)
# }
# if(!require(performance)){
#   remotes::install_github("easystats/performance@429b7ffbd")
#   library(performance)
# }
# if(!require(effectsize)){
#   remotes::install_github("easystats/effectsize@8175e17")
#   library(effectsize)
# }
# if(!require(sjPlot)){
#   remotes::install_github("strengejacke/sjPlot@208c9af", dependencies = TRUE)
#   library(sjPlot)
# }
if(!require(sjPlot)){
  install_version("sjPlot", '2.8.9')
  library(sjPlot)
}
if(!require(kableExtra)){
  install_version("kableExtra", "1.3.2")
  library(kableExtra)
}
if(!require(svglite)){
  install_version("svglite", "2.0.0")
  library(svglite)
}
if(!require(tinytex)){
  install_version("tinytex", "0.39")
  library(tinytex)
}
if(!tinytex::is_tinytex()){
  tinytex::install_tinytex()
}
if(!require(lmerTest)){
  install_version("lmerTest", '3.1-3')
  library(lmerTest)
}
# base packages
library("splines")
library("lme4")
