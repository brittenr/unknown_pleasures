

config <- yaml::read_yaml('config.yaml')

get_gps_elevation(file.path(config$set_up$gpx_dir,config$rides$france_bike_coeur$gpx)) %>%
  plot()

