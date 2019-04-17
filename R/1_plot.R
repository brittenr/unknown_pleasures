gpx_files <- config$rides %>%
  map(~.$gpx) %>%
  map(~paste0('data/gpx/',.))

ridge_df <- config$rides %>%
  map_dfr( get_plot_data )


#max(ridge_df$elevation) #603.5

# set the `scale` to determine how much overlap there is among the plots
ggplot(ridge_df, aes(x=distance_percent, y=ride, height = elevation, group = ride)) +
  ggridges::geom_density_ridges(fill="white",scale=4,stat="identity",size=1.5)+
  theme_light()
