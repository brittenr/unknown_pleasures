gpx_files <- config$rides %>%
  map(~.$gpx) %>%
  map(~paste0('data/gpx/',.))

ridge_df <- config$rides %>%
  map_dfr( get_plot_data )


# set the `scale` to determine how much overlap there is among the plots
base_plot <- ggplot(ridge_df, aes(x=distance_percent, y=ride, height = elevation, group = ride))

# light theme
light_plot <- base_plot +
  ggridges::geom_density_ridges(fill="white",scale=config$plot_vars$scale,stat="identity",size=config$plot_vars$line_size)+
  theme(
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(), # no tick lines
    panel.background = element_rect(fill = "white",colour = "white")
  )

# dark theme
dark_plot <- ggplot(ridge_df, aes(x=distance_percent, y=ride, height = elevation, group = ride)) +
  ggridges::geom_density_ridges(colour = "white", fill = "black",scale=config$plot_vars$scale,stat="identity",size=config$plot_vars$line_size)+
  theme(
    panel.grid.major = element_blank(), panel.grid.minor = element_blank(), # no tick lines
    panel.background = element_rect(fill = "black",colour = "black")
  )

ggsave(filename = 'light_plot.jpeg', plot = light_plot, width = 21, height =9, units = "cm")
ggsave(filename = 'dark_plot.jpeg', plot = dark_plot, width = 21, height =9, units = "cm")
