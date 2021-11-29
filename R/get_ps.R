#' Get lorem ipsum
#'
#' lorem ipsum
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @param level lorem ipsum
#' @param crs_transform Transform the CRS? Default is `FALSE`, which maintains the CRS at 4326.
#' @param new_crs A valid EPSG code. Required when `crs_transform = TRUE`. Transform the CRS by specifying a valid EPSG-code (see `rgdal::make_EPSG()$code` for a list of valid EPSG codes)
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

get_ps <- function(spatial = TRUE,
                   level = NULL,
                   crs_transform = FALSE,
                   new_crs = NULL) {

  check_input_get_ps(spatial = spatial,
                     level = level,
                     crs_transform = crs_transform,
                     new_crs = new_crs)

  if (level == "kreds"){

    url <- "https://api.dataforsyningen.dk/afstemningsomraader?format=geojson"

  } else if (level == "storkreds") {

    url <- "https://api.dataforsyningen.dk/storkredse?format=geojson"

  }

  data <- sf::read_sf(url)

  if (readr::parse_number(sf::st_crs(base_layer)[[1]]) != 4326) {

    data <- sf::read_sf(url) %>%
      sf::st_transform(crs = 4326)

  } else if (readr::parse_number(sf::st_crs(base_layer)[[1]]) == 4326) {

    data <- data

  }

  df_get_baselayer <- claudius::read_baselayer(as_sf = TRUE)

  data <- data %>%
    sf::st_intersection(df_get_baselayer)

  return(data)

}
