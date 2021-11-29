#' Get Denmark baselayer shapefile
#'
#' lorem ipsum
#' @param as_sf A logical value. Return data as an object of class `sf`? Defauls to `TRUE`. If `FALSE`, data is imported as a GEOJSON of class `geomultipolygon`
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

read_baselayer <- function(as_sf = TRUE) {

  check_read_baselayer(as_sf = as_sf)

  baselayer <- claudius::baselayer

  if (as_sf == TRUE) {

    base_layer <- geojsonsf::geojson_sf(baselayer)

  } else if (as_sf == FALSE) {

    base_layer <- baselayer

  }

  return(base_layer)

}
