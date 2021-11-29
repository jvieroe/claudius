## code to prepare `baselayer` dataset goes here
baselayer <- sf::read_sf("https://api.dataforsyningen.dk/regioner?format=geojson")
baselayer <- sf::st_transform(baselayer,
                              crs = 4326)
baselayer <- sf::st_union(baselayer)


# # ----- SHAPEFILE
# usethis::use_data(baselayer, overwrite = TRUE, compress = "xz")
#
# # ----- GEOJSON
# baselayer_json <- geojsonio::geojson_json(baselayer)
#
# usethis::use_data(baselayer_json, overwrite = TRUE, compress = "xz")

baselayer <- geojsonio::geojson_json(baselayer)

usethis::use_data(baselayer, overwrite = TRUE, compress = "xz")


# tools::resaveRdaFiles(paths = "C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/claudius/data/baselayer.rda",
#                       compress = "auto")
#
# CheckLazyDataCompression <- function(pkg)
# {
#   pkg_name <- sub("_.*", "", pkg)
#   lib <- tempfile(); dir.create(lib)
#   zs <- c("gzip", "bzip2", "xz")
#   res <- integer(3); names(res) <- zs
#   for (z in zs) {
#     opts <- c(paste0("--data-compress=", z),
#               "--no-libs", "--no-help", "--no-demo", "--no-exec", "--no-test-load")
#     install.packages(pkg, lib, INSTALL_opts = opts, repos = NULL, quiet = TRUE)
#     res[z] <- file.size(file.path(lib, pkg_name, "data", "Rdata.rdb"))
#   }
#   ceiling(res/1024)
# }
#
# CheckLazyDataCompression(pkg = "C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/claudius")



## code to prepare `vs` dataset goes here
vs <- read.csv("/Users/jeppeviero/Dropbox/github/Geografiske_stamdata.csv")



tools::add_datalist(pkgpath = "C:/Users/jevi/OneDrive - Epinion/Documents/GitHub/claudius")
