get_plot_line_from_elevation <- function(elevation) {
  
  elevation <- test$london_exeter
  
  #trim the start and end of the elevation
  elevation <- elevation[10:(length(elevation)-10)]
  
  #reset start or end percents to 0
  min_reset <- elevation %>%
    .[c( (1:round(length(.)*0.01)) , (round(length(.)*0.99):length(.)) ) ] %>%
    min()
  
  elevation <- elevation - min_reset
  
}

Px <- 1:length(elevation)
Py <- elevation


par(mfrow=c(2,2))
plot(Px,Py,type="l")
plot(DouglasPeuckerNbPoints(Px,Py,200),type="l",col=4)
plot(DouglasPeuckerEpsilon(Px,Py,5),type="l",col=4)
#plot(DouglasPeuckerEpsilon(Px,Py,20),type="l",col=4)

points <- DouglasPeuckerNbPoints(Px,Py,500)
points$y_smooth <- points$y %>% smooth()

plot(points$x,points$y_smooth,type="l")

