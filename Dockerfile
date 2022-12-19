FROM rocker/verse

RUN apt update && apt install -y openssh-client \
    python3 python3-pip

# R Packages
RUN R -e "install.packages(c('renv', 'here', 'markdown'))"

# Python Packages (including DVC)
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Rstudio Global Options
COPY --chown=rstudio:rstudio .config/rstudio/rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json