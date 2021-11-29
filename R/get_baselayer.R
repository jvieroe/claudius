#' Get lorem ipsum
#'
#' lorem ipsum
#' @param crs_transform Transform the CRS? Default is `FALSE`, which maintains the CRS at 4326.
#' @param new_crs A valid EPSG code. Required when `crs_transform = TRUE`. Transform the CRS by specifying a valid EPSG-code (see `rgdal::make_EPSG()$code` for a list of valid EPSG codes)
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr readr rgdal
#' @export

get_baselayer <- function(crs_transform = FALSE,
                          new_crs = NULL) {

  base_layer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson")

  if (readr::parse_number(sf::st_crs(base_layer)[[1]]) != 4326) {

    base_layer <- base_layer %>%
      sf::st_transform(crs = 4326)

  } else if (readr::parse_number(sf::st_crs(base_layer)[[1]]) == 4326) {

    base_layer <- base_layer

  }

  base_layer <- base_layer %>%
    sf::st_union()

  if (crs_transform == TRUE) {

    check_input_get_baselayer(new_crs = new_crs)

    base_layer <- base_layer %>%
      sf::st_transform(crs = new_crs)

  } else if (crs_transform == FALSE) {

    base_layer <- base_layer

  }

  return(base_layer)

}
