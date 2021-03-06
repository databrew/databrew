% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_databrew.R
\name{theme_databrew}
\alias{theme_databrew}
\title{databrew theme}
\usage{
theme_databrew(
  base_size = 15,
  base_family = "Sawasdee",
  y_comma = TRUE,
  subtitle_family = "Sawasdee",
  axis_family = "Sawasdee"
)
}
\arguments{
\item{base_size}{The size of the base font}

\item{base_family}{The font used in the legend and title}

\item{y_comma}{Whether to add comma seperators every 3 digits to a continuous
y axis}

\item{subtitle_family}{The font used in the subtitle}

\item{axis_family}{The font used in the axes}
}
\value{
A list of options compatible with \code{ggplot()}
}
\description{
Apply the databrew look to a ggplot2-generated visualization
}
