# Early-life gut microbiome development in rhesus monkeys

The data and code used in the analysis for the manuscript can be found in this repo.

-   [Complete blood counts](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/01_cbcs.pdf)
-   [Composition](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/02_composition.pdf)
-   [Longitudinal analysis](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/03_spline-regressions.pdf)
-   [Taxa plots](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/04_taxa-plots.pdf)
-   [Weight analysis](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/05_weights.pdf)
-   [Metabolomics analysis](https://github.com/nasiegel88/2021-early-life-gut-microbiome/blob/master/documents/06_metabolomics.pdf)

Steps to reproduce:

## 1. Clone this repo

```bash
git clone git@github.com:nasiegel88/2021-early-life-gut-microbiome.git
cd 2021-early-life-gut-microbiome
```
2. Create a repo2docker conda environment

> It is assumed that [conda](https://docs.conda.io/projects/conda/en/latest/user-guide/install/index.html) (or [mamba](https://github.com/mamba-org/mamba)) and [docker](https://docs.docker.com/engine/install/) are installed on the system.
```bash
mamba create -n repo2docker -c conda-forge jupyter-repo2docker
conda activate repo2docker
```

## 3. Launch the notebook

> This analysis involved a lot of packages thus it will take up to 20 minutes to build the docker image. Once the image is build select `RStudio` from the Jupyter Launcher.
```bash
jupyter-repo2docker --editable .
```

## 4. Run the full analysis

> In order to run the full analysis once `Rstudio` is launched open the console
```r
# Once in the console, run the script to knit all rmarkdown files used in the analysis
source('render_all_rmd.R')
```

Directory layout

All output figures and tables are located in the `figures` and `tables` directories respectively. The data used to run the analyis in located in the `data/20210603` directory.
```
.
├── 01_cbcs.rmd
├── 02_composition.rmd
├── 03_spline-regressions.rmd
├── 04_taxa-plots.rmd
├── 05_weights.rmd
├── 06_metabolomics.rmd
├── 07_lefse-galaxy.R
├── data
├── documents
├── environment.yml
├── figures
├── postBuild
├── R
├── README.md
├── render_all_rmd.R
├── start
├── style.sty
└── tables
```

All output PDFs will be located within the [documents](https://github.com/nasiegel88/2021-early-life-gut-microbiome/tree/master/documents) directory.
