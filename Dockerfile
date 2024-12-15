# Use a base R image with RMarkdown pre-installed
FROM rocker/verse:latest

# Set the working directory
WORKDIR /project

# Copy the project directory into the container
COPY . /project

# Install system dependencies for R packages
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    && apt-get clean

# Install renv
RUN Rscript -e "install.packages('renv')"

# Restore the R environment
RUN Rscript -e "renv::restore()"

# Command to render the R Markdown report
CMD ["Rscript", "-e", "rmarkdown::render('src/analysis.Rmd', output_dir = 'output')"]