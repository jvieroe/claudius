
#' @noRd
check_input_get_admin <- function(spatial,
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
    stop("Invalid 'level' argument provided. Must be one of names(claudius::admin_levels)")
  }

}


check_input_get_baselayer <- function(new_crs) {

  if(!is.null(new_crs) && !is.numeric(new_crs)) {
    stop("Invalid 'new_crs' argument provided. Must be be a numeric EPSG code")
  }

  if(!is.null(new_crs) && !new_crs %in% c(rgdal::make_EPSG()$code)) {
    stop("Invalid 'new_crs' argument provided. Must be one of c(rgdal::make_EPSG()$code)")
  }

}
