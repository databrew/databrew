#' Install packages
#'
#' Install some subjectively useful packages
#' @param re_install Whether to re-install already installed packages (
#' default = FALSE)
#' @return Nothing, but packages will be installed
#' @import data.table
#' @import devtools
#' @import ggmap
#' @import ggthemes
#' @import knitr
#' @import leaflet
#' @import maptools
#' @import raster
#' @import RColorBrewer
#' @import rgdal
#' @import rgeos
#' @import rmarkdown
#' @import sp
#' @import tidyr
#' @import tidyverse
#' @import tufte
#' @export

install_packages <- function(re_install = FALSE){

  # Define packages
  pkgs <- c('data.table',
            'devtools',
            'ggmap',
            'ggthemes',
            'knitr',
            'leaflet',
            'maptools',
            'raster',
            'RColorBrewer',
            'rgdal',
            'rgeos',
            'rmarkdown',
            'sp',
            'tidyr',
            'tidyverse',
            'tufte')

  # Only install those which don't already have
  if(!re_install){
    pkgs <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]
  }

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



