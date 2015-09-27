### Collect and clean the data set

The run_analysis.R script reads train set and test set of features, its activity, subject and combines them together into a one set. 

The script also selects the subset of the combined data set with either mean or std columns. The head description of the data frame representing the subset is also updated with the descriptive name read from features.txt file. 

The feature vector data frame is added columns from subject data frame and activity data frame. Then aggregate mean function is applied to the final data frame with group by subject and activity, which yeids to the result data frame that can be saved into the output file. 
