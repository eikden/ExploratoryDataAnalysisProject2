# Exploratory Data Analysis - Assignment 2 - #1
# By Yeoh Eik Den
setwd("~/Documents/R Project/Exploratory Data Analysis/")
# Loading provided datasets
NEI <- readRDS("~/Documents/R Project/Exploratory Data Analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("~/Documents/R Project/Exploratory Data Analysis/data/Source_Classification_Code.rds")

#Check Data
head(NEI)
head(SCC)

# Sampling
NEI_sampling <- NEI[sample(nrow(NEI), size=2000, replace=F), ]
head(NEI_sampling)
# Aggregate
Emissions <- aggregate(NEI[, 'Emissions'], by=list(NEI$year), FUN=sum)
Emissions$PM <- round(Emissions[,2]/1000,2)

# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# Generate the graph in the same directory as the source code
png(filename='~/Documents/R Project/Exploratory Data Analysis/plot1.png')

barplot(Emissions$PM, names.arg=Emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))

dev.off()