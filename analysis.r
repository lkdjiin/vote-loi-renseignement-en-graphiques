library(jsonlite)
library(dplyr)
library(RColorBrewer)

ABSTENTION <- 1 # Will be green.
CONTRE     <- 2 # Will be blue.
POUR       <- 3 # Will be orange.
TITLE      <- 8

source('r/build_data_frames.r')
source('r/barplots.r')
source('r/dotplots.r')
source('r/results.r')

build_data_frames()

colors <- brewer.pal(8, 'Accent')
col.vote <- c(colors[ABSTENTION], colors[CONTRE], colors[POUR])

m <- matrix(grouped2$total,
            nrow=3,
            dimnames=list(c('Abstention', 'Contre', 'Pour'),
                          c('Écolo', 'GDR', 'NI', 'RRDP', 'SRC', 'UDI', 'UMP')))

barplot_general()
barplot_per_group()
dotplots()
results()

print('Résultats:')
print(m)

# Tableau : pourcentage à l'intérieur de chaque groupe.
print('En pourcentage:')
print(round(prop.table(m, 2) * 100))

