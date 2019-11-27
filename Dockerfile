FROM inseefrlab/docklearn-base
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libssl-dev libxml2-dev make pandoc zlib1g-dev pandoc-citeproc
RUN R CMD build .
RUN R CMD INSTALL funcamp*.tar.gz
EXPOSE 3838
CMD  ["R", "-e", "funcampR::launch_learn(port=3838,host='0.0.0.0')"]
