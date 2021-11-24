
#' @noRd
check_input_cc_get_admin <- function(spatial,
                                     level) {

  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

  if(is.null(level)) {
    stop("No 'level' argument provided")
  }

  if(!is.null(level) && !level %in% c("municipality",
                                      "region",
                                      "parish",
                                      "constituency",
                                      "zip")) {
    stop("Invalid 'level' argument provided. Must be one of names(cclavus::admin_levels)")
  }

}
