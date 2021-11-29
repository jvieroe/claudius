## code to prepare `DATASET` dataset goes here
baselayer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson")
baselayer <- sf::st_transform(baselayer,
                              crs = 4326)
baselayer <- sf::st_union(baselayer)
baselayer <- geojsonio::geojson_json(baselayer)

usethis::use_data(baselayer, overwrite = TRUE, compress = "xz")

tools::resaveRdaFiles(paths = "C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/claudius/data/baselayer.rda",
                      compress = "auto")

tools::add_datalist(pkgpath = "C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/claudius")
