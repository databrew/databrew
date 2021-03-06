% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_simple.R
\name{theme_simple}
\alias{theme_simple}
\title{Simple databrew theme}
\usage{
theme_simple(
  base_size = 14,
  base_family = "Ubuntu Light",
  y_comma = FALSE,
  subtitle_family = "Ubuntu Light",
  axis_family = "Ubuntu Light",
  black = TRUE
)
}
\arguments{
\item{base_size}{The size of the base font}

\item{base_family}{The font used in the legend and title}

\item{y_comma}{Whether to add comma seperators every 3 digits to a continuous
y axis}

\item{subtitle_family}{The font used in the subtitle}

\item{axis_family}{The font used in the axes}

\item{font}{The font}
}
\value{
A list of options compatible with \code{ggplot()}
}
\description{
Apply the databrew look to a ggplot2-generated visualization
}
