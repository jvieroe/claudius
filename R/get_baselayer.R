#' Get lorem ipsum
#'
#' lorem ipsum
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr
#' @export

get_baselayer <- function() {

  base_layer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson")
  base_layer <- sf::st_transform(base_layer,
                                 crs = 4326)
  base_layer <- sf::st_union(base_layer)

  return(base_layer)

}
