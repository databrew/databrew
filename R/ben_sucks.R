#' The "ben sucks" function
#' 
#' Print a message about how Ben sucks
#' @param all_caps Whether the message should be all caps
#' @param n How many times to print the message
#' @return A message
#' @export

ben_sucks <- 
  function(all_caps = FALSE,
           n = 1){
    # Define the message
    the_message <- 'ben sucks'
    
    # Capitalize if applicable
    if(all_caps){
      the_message <- toupper(the_message)
    }
    
    # Print as many times as necessary
    for (i in 1:n){
      message(the_message)
    }
  }