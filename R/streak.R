#' Identify streaks
#'
#' Identify chained repetitions (streak) of a value in a vector, and count the length of the streak
#' @param x A vector
#' @param value The value to be counted
#' @export
streak <- function(x, value = 0)  {
  x <- x == value
  rl <- rle(x)
  len <- rl$lengths
  v <- rl$values
  cumLen <- cumsum(len)
  z <- x
  # replace the 0 at the end of each zero-block in z by the
  # negative of the length of the preceding 1-block....
  iDrops <- c(0, diff(v)) < 0
  z[ cumLen[ iDrops ] ] <- -len[ c(iDrops[-1],FALSE) ]
  # ... to ensure that the cumsum below does the right thing.
  # We zap the cumsum with x so only the cumsums for the 1-blocks survive:
  x*cumsum(z)
}

# # Examples
#
# # Character vector
# x = c('joe', 'joe', 'ben', 'joe', 'joe', 'joe', 'ben', 'ben', 'ben', 'ben', 'joe')
# streak(x, value = 'ben')
# streak(x, value = 'joe')
#
# # Numeric vector
# streak(c(0,0,0,1,0,0,1,1,1,1,1,0,1,1,0,0,0,0), value = 0)
# streak(c(0,0,0,1,0,0,1,1,1,1,1,0,1,1,0,0,0,0), value = 1)
#
# # Boolean vector
# streak(c(T, T, T, F, T, F, F, F), value = F)
# streak(c(T, T, T, F, T, F, F, F), value = T)
