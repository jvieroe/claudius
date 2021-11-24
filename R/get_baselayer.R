#' Get lorem ipsum
#'
#' lorem ipsum
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

get_baselayer <- function() {

  base_layer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson") %>%
    sf::st_transform(crs = 4326) %>%
    sf::st_union()

  return(base_layer)

}
