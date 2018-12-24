get_plot_data <- function(gpx_file) {
  
  ride <- names(gpx_files)[gpx_files==gpx_file]
  elevation <- get_gps_elevation(gpx_file) %>%
    get_plot_line_from_elevation()
  
  distance_percent <- 1:length(elevation)/length(elevation)*100
  cbind.data.frame(
    ride = rep(ride,length(elevation))
    ,elevation = elevation
    ,distance_percent
  )
  
}
