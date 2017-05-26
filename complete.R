# Write a function that reads a directory full of files and reports the number of completely 
# observed cases in each data file. The function should return a data frame where the first 
# column is the name of the file and the second column is the number of complete cases

complete <- function(directory, id=1:332) {
        files_complete <- list.files(directory, full.names = TRUE)
        file_id_list <- c(id)
        file_val_list <- c()
        increment <- 1
        for (file in id){
                read_file <- read.csv(files_complete[file])
                file_val_list[increment] <- nrow(na.omit(read_file))
                increment <- increment +1
                
        }
        output_data <- data.frame(id=file_id_list, nobs = file_val_list)
        output_data
}

# unit test
# complete ("specdata", 1)
# complete("specdata", c(2, 4, 8, 10, 12))
# complete("specdata", 30:25)
# complete("specdata", 3)
