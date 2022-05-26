WORKDIR /usr
RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y r-base
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('reshape')"
RUN Rscript -e "install.packages('gplots')"
RUN Rscript -e "install.packages('ggplot2')"
COPY picard.jar /usr/picard.jar
