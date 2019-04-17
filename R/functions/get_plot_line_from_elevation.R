get_plot_line_from_elevation <- function(elevation) {
  
  #trim the start and end of the elevation
  stripped_elevation <- elevation[10:(length(elevation)-10)]
  
  #reset start or end percents to 0
  min_reset <- stripped_elevation %>%
    .[c( (1:round(length(.)*0.05)) , (round(length(.)*0.95):length(.)) ) ] %>%
    smooth() %>%
    min()
  
  reset_elevaton <- stripped_elevation - min_reset
  
  #extend elevation
  extended_elevation <- reset_elevaton
  
  #smooth
  smoothed_elevation <- smooth(extended_elevation)
  
  plot_elevation <- pmax(0,smoothed_elevation)
  
  return(plot_elevation)
  
}
