<!-- README.md is generated from README.Rmd. Please edit that file -->

# docklearn

<!-- badges: start -->

[![Build Status](https://travis-ci.org/InseeFrLab/funcampR.svg?branch=master)](https://travis-ci.org/InseeFrLab/funcampR)

<!-- badges: end -->

The goal of funcampR is to deploy shiny_prerendered rmd from R packages
and/or docker

## As an R package

### install the packages

```r
remotes::install_github("InseeFrLab/funcampR")
```

### launch function

```r
funcampR::launch_learn()
```

## Using Docker

from the package source ( for example using the Rsutio project)

### build the package

create `"docklearn_*.tar.gz"` file

```r
devtools::build()
```

### Create a Dockerfile

can be created using {golem} with golem::add_dockerfile() but, you have
to edit the CMD to have
`funcampR::launch_learn(port=3838,host='0.0.0.0')` and you can use
`inseefrlab/docklearn-base` as FROM.

```txt
FROM inseefrlab/docklearn-base
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libssl-dev libxml2-dev make pandoc zlib1g-dev pandoc-citeproc
RUN Rscript -e 'remotes::install_github("InseeFrLab/funcampR",ref="master",upgrade = "never")'
EXPOSE 3838
CMD  ["R", "-e", "funcampR::launch_learn(port=3838,host='0.0.0.0')"]
```

### build a docker image

from the folder containing the `Dockerfile` using terminal launch :

```bash
docker build -t funcampR .
```

you can now use your container

```bash
docker run -p 80:3838 funcampR
```

# Choisir le support à proposer :

    funcampR::launch_learn(port=3838,host='0.0.0.0',file=funcampR:::tous_les_programmes('02-Vis-Basics.Rmd'))

    funcampR::launch_learn(port=3838,host='0.0.0.0',file=funcampR:::tous_les_programmes('chapitre1.Rmd'))

    funcampR::launch_learn(port=3838,host='0.0.0.0',file=funcampR:::tous_les_programmes('chapitre2.Rmd'))
