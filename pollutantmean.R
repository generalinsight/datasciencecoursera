# Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
#across a specified list of monitors. The function 'pollutantmean' takes three 
#arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
#'pollutantmean' reads that monitors' particulate matter data from the directory 
#'#specified in the 'directory' argument and returns the mean of the pollutant 
#'across all of the monitors, ignoring any missing values coded as NA. 
#'A prototype of the function is as follows



pollutantmean <- function(directory, pollutant, id=1:332) {
        files <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        
        for (i in id){
                dat <- rbind(dat, read.csv(files[i]))
        }
        
        mean_data <- mean(dat[,pollutant], na.rm = TRUE)
        round(mean_data, digits = 3)
        
}

# unit test
# print(R.version.string)
# source("pollutantmean.R")
# pollutantmean("specdata", "sulfate", 1:10)
# pollutantmean("specdata", "nitrate", 70:72)
# pollutantmean("specdata", "nitrate", 23)