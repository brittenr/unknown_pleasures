get_plot_data <- function(ride,path='data/gpx/') {

  gpx_file <- paste0(path,'/',ride$gpx)
  
  title <- ride$title

  print(title)    
  
  if(length(gpx_file)>1) {
    
    elevation <- c()
    
    for(i in 1:length(gpx_file)) {
      
      elevation <- c(elevation,get_gps_elevation(gpx_file))
      
    }
    
  }
  
  
  elevation <- get_gps_elevation(gpx_file) %>%
    get_plot_line_from_elevation()
  
  distance_percent <- 1:length(elevation)/length(elevation)*100
  
  cbind.data.frame(
    ride = rep(title,length(elevation))
    ,elevation = elevation
    ,distance_percent
  )
  
}
