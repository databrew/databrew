#' Score sentiment
#'
#' Score the positivity / negativity of a statement
#' @param x A character vector of phrases to be scored
#' @import dplyr
#' @export

score_sentiment <- function(x){
  # Get the afinn data
  af <- databrew::af
  # Clean x
  x <- tolower(x)
  x <- gsub("([.-])|[[:punct:]]", "", x)
  # Parse x
  x_parsed <- strsplit(x, ' ')
  # Go through each element of x
  out <- rep(NA, length(x))
  for (i in 1:length(out)){
    # Get this element of x
    this_element <- x[i]
    # parse the words of this element
    this_element_parsed <- x_parsed[[i]]
    # Keep only the components of af that match the parsed words
    af_small <- af %>%
      filter(word %in% this_element_parsed)
    # If no score, 0
    if(nrow(af_small) == 0){
      out[i] <- 0
    } else {
      # If a score, sum it
      out[i] <- sum(af_small$score)
    }
  }
  return(out)
}

