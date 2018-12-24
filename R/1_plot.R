gpx_files <- config$rides %>%
  map(~.$gpx) %>%
  map(~paste0('data/gpx/',.))

test <- gpx_files %>%
  map_dfr( get_plot_data )


# set the `scale` to determine how much overlap there is among the plots
ggplot(test, aes(x=distance_percent, y=ride, height = elevation, group = ride)) +
  ggridges::geom_density_ridges(fill="white",scale=4,stat="identity")
