FROM rocker/rstudio

RUN apt update && apt install -y \
    openssh-client libxt-dev libpoppler-cpp-dev libudunits2-dev libproj-dev libgdal-dev\
    # Python
    python3 python3-pip

# R Package
RUN R -e "install.packages(c('renv'))"

# DVC Path
ENV PATH $PATH:/home/rstudio/.cache/pip/bin

# Package Cahce & Permission
RUN cd /home/rstudio && mkdir .cache && \
    chown rstudio:rstudio .cache