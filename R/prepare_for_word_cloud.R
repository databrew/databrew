#' Prepare for word cloud
#'
#' Prepare a character vector for use with wordcloud2
#' @param x A character vector 
#' @import dplyr
#' @export

prepare_for_word_cloud <- function(x){
  # Clean x
  x <- tolower(x)
  x <- gsub("([.-])|[[:punct:]]", "", x)
  x <- x[!is.na(x)]
  # Parse x
  x_parsed <- strsplit(x, ' ')
  # unlist
  x <- unlist(x_parsed)
  # Remove a, for, the
  x <- x[! x %in% c('a', 'for', 'the', 'and')]
  # Make dataframe
  x <- data_frame(word = x)
  # Get counts
  x <- x %>%
    group_by(word) %>%
    summarise(freq = n()) %>%
    arrange(desc(freq))
  x <- data.frame(x)
  row.names(x) <- x$word
  return(x)
}

