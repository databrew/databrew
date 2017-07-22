#' Visualize location
#'
#' Visualize location of a dataframe with lat/lon columns
#' @param data A dataframe
#' @param use_leaflet Whether to use leaflet
#' @param spdf A spatial polygons dataframe
#' @return A map
#' @import dplyr
#' @import leaflet
#' @import sp
#' @import ggmap
#' @import maps
#' @import ggplot2
#' @import ggthemes
#' @export

visualize_location <- function(x,
                               use_leaflet = FALSE,
                               spdf = NULL){
  
  # Arrange by date
  x <- x %>%
    arrange(date)
  
  if(use_leaflet){
    # Make spatial 
    coordinates(x) <- ~longitude + latitude
    
    # Create leaflet map
    l <- leaflet() %>%
      addProviderTiles(provider = 'Stamen.Toner')
    
    # Add points
    l <- l %>%
      addCircles(data = x)
    
    return(l)
  } else {
  
    # Get world
    if(is.null(spdf)){
      world <- map_data('world')
      world <- world %>%
        filter(region != 'Antarctica')
    } else {
      world <- map_data(spdf)
    }

    ggplot() +
      geom_polygon(data = world,
                   aes(x = long,
                       y = lat, 
                       group = group),
                   color = 'white',
                   lwd = 0.2,
                   fill = 'black') +
      geom_path(data = x,
                aes(x = longitude,
                    y = latitude),
                alpha = 0.4,
                color = 'red') +
      geom_point(data = x,
                 aes(x = longitude,
                     y = latitude),
                 alpha = 0.3,
                 color = 'red',
                 size = 0.2) +
      theme_map() #+
      # coord_proj("+proj=wintri")
  } 
    
    # # Plot a ggmap
    # maptile <- get_map(location = c(min(x$longitude),
    #                                 min(x$latitude),
    #                                 max(x$longitude),
    #                                 max(x$latitude)),
    #                    maptype = 'hybrid')
    # 
    # # Build map
    # m <- ggmap(maptile) + 
    #   geom_path(data=x, 
    #             aes(x = longitude, 
    #                 y = latitude), 
    #             size=1.1,
    #             color = 'darkred',
    #             alpha = 0.3) +
    #   theme_void()
}



