#' databrew theme
#'
#' Apply the databrew look to a ggplot2-generated visualization

#' @param base_size The size of the base font
#' @param base_family The font used in the legend and title
#' @param subtitle_family The font used in the subtitle
#' @param axis_family The font used in the axes
#' @return A ggtheme object meant to be used in conjunction with a call to ggplot()
#' @import RColorBrewer
#' @import ggplot2
#' @import extrafont
#' @export

theme_databrew <-
  function (base_size = 18,
            base_family = "Roboto",
            subtitle_family = 'Roboto',
            axis_family = 'Roboto'){
    
    
    color_background = 'white'#grey(0.99)
    color_grid_major = 'grey'
    color_axis_text =  "#0d63c4"
    color_axis_title = color_axis_text
    color = 'darkgrey'
    color_title = color_axis_text
    color_subtitle = 'darkgrey'
    base_size1 = base_size
    theme_bw(base_size = base_size1) +
      theme(panel.background = element_rect(fill = color_background,
                                            color = color_background)) +
      theme(plot.background = element_rect(fill = color_background,
                                           color = color_background)) +
      theme(panel.border = element_rect(color = color_background)) +
      theme(panel.grid.major = element_line(color = adjustcolor(color_grid_major, alpha.f = 0.25),
                                            size = 0.25)) +
      theme(panel.grid.major = element_line(color = adjustcolor(color_grid_major, alpha.f = 0.4),
                                            size = 0.4)) +
      theme(panel.grid.minor = element_blank()) +
      theme(axis.ticks = element_blank()) +
      theme(legend.background = element_rect(fill = color_background)) +
      theme(legend.text = element_text(family = base_family,
                                       size = base_size * 0.7,
                                       color = color_axis_title)) +
      theme(plot.title = element_text(family = base_family,
                                      color = color_title,
                                      size = base_size * 1.2, vjust = 1.25)) +
      theme(plot.subtitle = element_text(family = subtitle_family,
                                         color = color_subtitle,
                                         size = base_size * 0.8, vjust = 1.25)) +
      theme(axis.text.x = element_text(family = axis_family,
                                       size = base_size * 0.7,
                                       color = color_axis_text)) +
      theme(axis.text.y = element_text(family = axis_family,
                                       size = base_size * 0.7,
                                       color = color_axis_text)) +
      theme(axis.title.x = element_text(family = axis_family,
                                        size = base_size * 0.9,
                                        color = color_axis_title,
                                        vjust = 0)) +
      theme(axis.title.y = element_text(family = axis_family,
                                        size = base_size * 0.9, color = color_axis_title, vjust = 1.25)) +
      theme(plot.margin = unit(c(0.35, 0.2, 0.3, 0.35), "cm")) +
      theme(complete = TRUE) +
      theme(legend.key = element_blank()) +
      theme(legend.position = 'bottom') +
      theme(strip.background = element_rect(fill=color_background),
            strip.text = element_text(size = base_size * 0.6),
            panel.spacing = unit(0, "lines"),
            panel.border = element_rect(colour = NA, fill=NA, size=0))
  }
