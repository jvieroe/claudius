#' Get lorem ipsum
#'
#' lorem ipsum
#' @param spatial a logical value. Return data of class `sf`? Defaults to `TRUE`
#' @return data lorem ipsum
#' @author Jeppe Vierø
#' @import sf dplyr labelled readr tibble lubridate janitor
#' @export

get_ps <- function(spatial = TRUE) {

  check_input_get_ps(spatial = spatial)

  url <- "https://api.dataforsyningen.dk/afstemningsomraader?format=geojson"

  ps <- sf::read_sf(url)

  labelled::var_label(ps) <- base::colnames(ps)

  ps <- ps %>%
    tibble::tibble() %>%
    janitor::clean_names() %>%
    dplyr::rename(dagi_id = .data$dagi_id,
                  number = .data$nummer,
                  name = .data$navn,
                  station = .data$afstemningsstednavn,
                  st_id = .data$afstemningsstedadresseid,
                  st_add = .data$afstemningsstedadressebetegnelse,
                  st_lon = .data$afstemningssted_adgangspunkt_x,
                  st_lat = .data$afstemningssted_adgangspunkt_y,
                  muni_code = .data$kommunekode,
                  muni = .data$kommunenavn,
                  regi_code = .data$regionskode,
                  regi = .data$regionsnavn,
                  kreds_id = .data$opstillingskredsnummer,
                  kreds = .data$opstillingskredsnavn,
                  stkreds_id = .data$storkredsnummer,
                  stkreds = .data$storkredsnavn,
                  valg_ld_l = .data$valglandsdelsbogstav,
                  valg_ld = .data$valglandsdelsnavn,
                  edit = .data$aendret,
                  geo_edit = .data$geo_aendret,
                  geo_v = .data$geo_version,
                  vcent_lon = .data$visueltcenter_x,
                  vcent_lat = .data$visueltcenter_y) %>%
    sf::st_as_sf() %>%
    sf::st_cast("MULTIPOLYGON")

  ps <- ps %>%
    dplyr::mutate(edit = lubridate::ymd_hms(.data$edit),
                  geo_edit = lubridate::ymd_hms(.data$geo_edit)) %>%
    dplyr::mutate(edit = base::as.character(.data$edit),
                  geo_edit = base::as.character(.data$geo_edit)) %>%
    dplyr::mutate(muni_code = as.numeric(.data$muni_code),
                  regi_code = as.numeric(.data$regi_code))

  ps <- ps %>%
    dplyr::left_join(claudius::vs,
                     by = c("name" = "Valgsted.navn",
                            "muni_code" = "KommuneNr")) %>%
    dplyr::select(c("dagi_id",
                    "ps_id",
                    base::setdiff(names(ps), c("dagi_id",
                                               "ps_id"))))

  if (spatial == TRUE) {

    if (readr::parse_number(sf::st_crs(ps)[[1]]) != 4326) {

      ps <- ps %>%
        sf::st_transform(crs = 4326)

    } else if (readr::parse_number(sf::st_crs(ps)[[1]]) == 4326) {

      ps <- ps

    }

  } else if (spatial == FALSE) {

    ps <- ps %>%
      tibble::tibble() %>%
      dplyr::select(-.data$geometry)

  }

  return(ps)

}
