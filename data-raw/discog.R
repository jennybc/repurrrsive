# pkg_install("ewenme/discogger")
library(discogger)

discog <- discogs_user_collection(user_name = "sharlagelfand")[["content"]]

View(discog)

usethis::use_data(discog, overwrite = TRUE)
