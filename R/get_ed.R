#' Get lorem ipsum
#'
#' lorem ipsum
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @param level lorem ipsum
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

get_ed <- function(spatial = TRUE,
                   level = NULL) {

  check_input_get_ed(spatial = spatial,
                     level = level)

  if (level == "kreds"){

    url <- "https://api.dataforsyningen.dk/afstemningsomraader?format=geojson"

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

  } else if (level == "storkreds") {

    url <- "https://api.dataforsyningen.dk/storkredse?format=geojson"

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

  }



  return(data)

}
