complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  df = data.frame(matrix(vector(), 0, 2, dimnames=list(c(), c("id", "nobs"))))
  for (i in id){
    d<-read.csv(file.path(directory, paste(sprintf("%03d", i), '.csv', sep='')))
    row = data.frame(id=i, nobs=nrow(subset(d, is.na(sulfate) == FALSE & is.na(nitrate)==FALSE)))
    df <- rbind(df, row)
  }
  df
}