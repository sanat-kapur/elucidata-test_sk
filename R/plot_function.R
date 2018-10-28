pca_plot = function(metadata_file, gene_data_file) {
  #read in metadata
  metadata = tryCatch(read.csv(metadata_file, colClasses = "character",
                      stringsAsFactors = F),
  error=function(e) {
    print("There was an error reading in the metadata CSV file. Please check error below.")
  })
  
  #read in gene data
  gene_data = tryCatch(read.csv(gene_data_file, colClasses = "character",
                                stringsAsFactors = F),
                       error=function(e) {
                         print("There was an error reading in the Gene Data CSV file. Please check error below.")
                       })
  
  #convert all data columns to numeric
  for (i in 3:32) {
    gene_data[,i] = as.numeric(gene_data[,i])
  }
  
  #remove all rows with NAs
  gene_data = gene_data[complete.cases(gene_data),]
  
  #generate pca
  gene_data_pca = prcomp(gene_data[,3:32],
                         center = T,
                         scale. = T)
  
  #data frame with PCA values 
  gene_data_pca_vales = as.data.frame(gene_data_pca$x)
  
  theme<-theme(panel.background = element_blank(),panel.border=element_rect(fill=NA),panel.grid.major = element_blank(),panel.grid.minor = element_blank(),strip.background=element_blank(),axis.text.x=element_text(colour="black"),axis.text.y=element_text(colour="black"),axis.ticks=element_line(colour="black"),plot.margin=unit(c(1,1,1,1),"line"))
  
  plot = ggplot(gene_data_pca_vales,aes(x=PC1,y=PC2 )) + geom_point() + theme
  
  return(plot)
}
 













