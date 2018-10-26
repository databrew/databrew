#' Make subtitles
#'
#' Generate a srt file
#' @param text
#' @param start_times
#' @param end_times
#' @param file
#' @import lubridate
#' @export


make_subtitles <- function(text = '',
                           start_times = 0,
                           end_times = NULL,
                           file = 'subtitles.srt'){

  numbers <- 1:length(text)
  st <- seconds_to_period(start_times)
  st <- sprintf('%02d:%02d:%02d', st@hour, minute(st), second(st))
  st <- paste0(st, ',000')
  et <- seconds_to_period(end_times)
  et <- sprintf('%02d:%02d:%02d', et@hour, minute(et), second(et))
  et <- paste0(et, ',000')

  out <-
    paste0(
      numbers, '\n',
      st, ' --> ', et, '\n',
      text, '\n\n'
    )
  
  fileConn<-file(file)
  writeLines(out, fileConn)
  close(fileConn)
    
}