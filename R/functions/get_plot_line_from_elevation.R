get_plot_line_from_elevation <- function(elevation) {
  
  #trim the start and end of the elevation
  elevation <- elevation[10:(length(elevation)-10)]
  
  #reset start or end percents to 0
  min_reset <- elevation %>%
    .[c( (1:round(length(.)*0.01)) , (round(length(.)*0.99):length(.)) ) ] %>%
    min()
  
  elevation <- elevation - min_reset
  
}