all: output/heart_disease_analysis.html

output/heart_disease_analysis.html: src/analysis.Rmd data/heart.csv src/tables.R src/figures.R
	Rscript -e "rmarkdown::render('src/analysis.Rmd', output_dir = 'output')"