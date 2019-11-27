FROM inseefrlab/docklearn-base as build  
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libssl-dev libxml2-dev make pandoc zlib1g-dev pandoc-citeproc
ADD . /app
RUN cd /app && R CMD build .

FROM inseefrlab/docklearn-base
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libssl-dev libxml2-dev make pandoc zlib1g-dev pandoc-citeproc
COPY --from=build /app/funcamp*.tar.gz funcamp.tar.gz
RUN Rscript -e 'install.packages("funcamp.tar.gz",repos = NULL,type="source")'
EXPOSE 3838
CMD  ["R", "-e", "funcampR::launch_learn(port=3838,host='0.0.0.0')"]
