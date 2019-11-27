FROM inseefrlab/docklearn-base
RUN Rscript -e 'remotes::install_github("InseeFrLab/funcampR",ref="package")'
EXPOSE 3838
CMD  ["R", "-e", "funcampR::launch_learn(port=3838,host='0.0.0.0')"]
