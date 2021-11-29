
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

#' @noRd
check_input_get_ps <- function(spatial) {

  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

}


#' @noRd
check_input_get_constituency <- function(spatial,
                                         crs_transform,
                                         new_crs) {

  if(!spatial %in% c(TRUE, FALSE)) {
    stop("Invalid 'spatial' argument provided. Must be logical")
  }

  if(is.null(level)) {
    stop("No 'level' argument provided. Choose 'kreds' or 'storkeds'")
  }

  if(!is.null(level) && !level %in% c("kreds",
                                      "storkeds")) {
    stop("Invalid 'level' argument provided. Must be either 'kreds' or 'storkeds'")
  }

}



#' @noRd
check_input_get_baselayer <- function(new_crs) {

  if(!is.null(new_crs) && !is.numeric(new_crs)) {
    stop("Invalid 'new_crs' argument provided. Must be be a numeric EPSG code")
  }

  if(!is.null(new_crs) && !new_crs %in% c(rgdal::make_EPSG()$code)) {
    stop("Invalid 'new_crs' argument provided. Must be one of c(rgdal::make_EPSG()$code)")
  }

}

#' @noRd
check_read_baselayer <- function(as_sf) {

  if(!as_sf %in% c(TRUE, FALSE)) {
    stop("Invalid 'as_sf' argument provided. Must be logical")
  }

}
