#' Get lorem ipsum
#'
#' lorem ipsum
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @param level lorem ipsum
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

get_admin <- function(spatial = TRUE,
                      level = NULL) {

  check_input_cc_get_admin(spatial = spatial,
                           level = level)

  base_url1 <- "https://api.dataforsyningen.dk/"
  base_url2 <- "?format=geojson"

  if (level == "municipality") {

    url <- base::paste0(base_url1,
                        "kommuner",
                        base_url2)

  } else if (level == "region") {

    url <- base::paste0(base_url1,
                        "regioner",
                        base_url2)

  } else if (level == "parish") {

    url <- base::paste0(base_url1,
                        "sogne",
                        base_url2)

  } else if (level == "constituency") {

    url <- base::paste0(base_url1,
                        "afstemningsomraader",
                        base_url2)

    # tilfoej storkreds

  } else if (level == "zip") {

    url <- base::paste0(base_url1,
                        "postnumre",
                        base_url2)

  }

  data <- sf::read_sf(url) %>%
    sf::st_transform(crs = 4326)

  df_get_baselayer <- claudius::get_baselayer()

  data <- data %>%
    sf::st_intersection(df_get_baselayer)

  return(data)

}
