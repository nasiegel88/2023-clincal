# Early-life gut microbiome development in rhesus monkeys

The data and code used in the analysis for the manuscript can be found in this repo.

-   [Complete blood counts](https://github.com/nasiegel88/2023-clincal/blob/main/documents/1_cbcs.pdf)
-   [Weight analysis](https://github.com/nasiegel88/2023-clincal/blob/main/documents/2_weights.pdf)

Steps to reproduce:

## 1. Clone this repo

```bash
git clone git@github.com:nasiegel88/2023-clinical.git
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

All output PDFs will be located within the [documents](https://github.com/nasiegel88/2023-clincal/tree/main/documents) directory.
