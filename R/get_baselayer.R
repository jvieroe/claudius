#' Get lorem ipsum
#'
#' lorem ipsum
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr readr rgdal
#' @export

get_baselayer <- function(new_crs = NULL) {

  base_layer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson")

  if (readr::parse_number(sf::st_crs(base_layer)[[1]]) != 4326) {

    base_layer <- base_layer %>%
      sf::st_transform(crs = 4326)

  } else if (readr::parse_number(sf::st_crs(base_layer)[[1]]) == 4326) {

    base_layer <- base_layer

  }

  base_layer <- base_layer %>%
    sf::st_union()

  if (!is.null(new_crs)) {

    check_input_get_baselayer(new_crs = new_crs)

    base_layer <- base_layer %>%
      sf::st_transform(crs = new_crs)

  } else if (is.null(new_crs)) {

    base_layer <- base_layer

  }

  return(base_layer)

}
