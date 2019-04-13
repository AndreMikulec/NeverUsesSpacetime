 

#' relative scaling
#'
#' @export
## #' @importFrom DMwR LinearScaling
Run <- function() {
 # spacetime::eof (something indirectly loads package spacetime: not mine!)
 spacetime::eof
 ## summary(DMwR::LinearScaling(DMwR::algae[,'NO3']))
 print(str(methods::getClass("xts")))
}
