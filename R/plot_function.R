pca_plot = function(metadata_file, gene_data_file) {
  #read in metadata
  metadata = tryCatch(read.csv(metadata_filepath, colClasses = "character",
                      stringsAsFactors = F),
  error=function(e) {
    print("There was an error reading in the metadata CSV file. Please check error below.")
  })
  
  #read in gene data
  gene_data = tryCatch(read.csv(gene_data_filepath, colClasses = "character",
                                stringsAsFactors = F),
                       error=function(e) {
                         print("There was an error reading in the Gene Data CSV file. Please check error below.")
                       })
  
  return(nrow(gene_data))
  }













