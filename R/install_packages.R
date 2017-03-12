#' Install packages
#'
#' Install some subjectively useful packages
#' @export

install_packages <- function(){
  
  # Define packages
  pkgs <- c('tidyverse',
            'raster',
            'rgdal',
            'sp',
            'maptools',
            'rgeos',
            'ggmap',
            'tidyr',
            'RColorBrewer',
            'rmarkdown',
            'tufte',
            'data.table',
            'devtools',
            'leaflet',
            'ggthemes',
            'knitr')
  
  # Only install those which don't already have
  pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
  
  # Alphabetize
  pkgs <- sort(pkgs)
  
  if(length(pkgs) == 0){
    message('All packages already installed. No action being taken.')
  } else {
    the_message <-
      paste0('Installing the following packages:\n',
             paste0('--- ', pkgs, collapse = '\n'))
    message(the_message)
    for (i in 1:length(pkgs)){
      message('Installing ', pkgs[i])
      install.packages(pkgs[i])
    }
  }
}



