get_gps_elevation <- function(gpx_file) {
  
  if( length(gpx_file) == 1 ) {
    
    gpx <- plotKML::readGPX(gpx_file)
  
    return( gpx$tracks[[1]][[1]]$ele )
    
  } else {
  
    elevation <- numeric()
    
    for( i in seq_along(gpx_file) ) {
      
      gpx <- plotKML::readGPX(gpx_file[i])
      
      elevation <- c(elevation,gpx$tracks[[1]][[1]]$ele)
      
    }
  
  }
  
  return(elevation)
  
}
