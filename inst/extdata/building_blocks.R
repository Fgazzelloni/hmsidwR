## Create a package
## R-Packages - https://r-pkgs.org/
## check the package's name availability
library(available)
available::available("hmsidwR")
suggest(text = "health metrics") # diseasesr
pak::pkg_name_check("hmsidwR")


library(devtools)
library(usethis)
usethis::create_package("~/Documents/R/AAA_packages/hmsidwR")
usethis::use_git()

## Function Documentation
usethis::use_r("lmforecast")
# then position the cursor at the top of the script and
# code-->insert roxygen skeleton

## restart and load the function
devtools::load_all()

## check the package status
devtools::check()

## type ctrl . to access the DESCRIPTION file to customize
## add the licence
# usethis::use_mit_license()

## add documentation of the function
# head over the function file and --> code--> Insert roxygen skeleton
devtools::document()

## Install the package (Cmd + Shift + B)
devtools::install()

## install testthat to check functions
# usethis::use_testthat()
# then fill up the test_that() function with expected output
devtools::test()

## use github
# usethis::use_github()
## use RStudio - this function set all files on the main directory of the prject
usethis::use_rstudio()
usethis::proj_sitrep() # check


## add a readme
# usethis::use_readme_rmd()

## build the readme
# devtools::build_readme()
## then check and install


## Data
## Raw data
usethis::use_data_raw() # create the data_raw/ folder
usethis::use_data_raw("my_pkg_data")

## Data is saved in data/ folder and is usually type .rda
usethis::use_data()
usethis::use_data(my_pkg_data)
# to compress
tools::resaveRdaFiles("data/")
# to check what type of
tools::checkRdaFiles()

## Internal data
usethis::use_data(internal = TRUE) # create R/sysdata.rda
usethis::use_data(internal_this,
                  internal_that,
                  internal = TRUE)


## load packages on DESCRPTION
usethis::use_package("your-package")
# in suggest are packages not absolutely required
# reorder list
usethis::use_tidy_description()

## add a Vignette
usethis::use_vignette("hmsidwR")
# then subsequent vignettes
usethis::use_vignette("sdi90_19")
usethis::use_article("Case Study") # .Rbuildignored
usethis::use_article("Case Study/sdi90_19")
# or
devtools::install(build_vignettes = TRUE)
browseVignettes("hmsidwR")


# Repeat
devtools::load_all()
devtools::check()
devtools::document()
devtools::install()
devtools::build()


## Restyle -package - reshape code
styler::style_pkg()

## creates an inst/
usethis::use_rmarkdown_template()
# to add inst/extdata or inst/citation

usethis::use_citation()

## look at the dependencies in the DESCRIPTION file
pak::pkg_deps_tree("tibble")
pak::pkg_deps_explain("tibble", "rlang")

# set up for building the website
usethis::use_github_actions()

# Build a website for the vignette
usethis::use_pkgdown()

pkgdown::build_site()

# publish the website
usethis::use_pkgdown_github_pages()

# make a logo with the {hexSticker} pkg
usethis::use_logo()

# build references in the pkg
pkgdown::build_reference_index(pkg = ".")
# link all .rmd files
pkgdown::build_articles()


# Repeat
devtools::load_all()
devtools::document()
devtools::check()
devtools::install()
devtools::build()
pkgdown::build_site()


# customization documentation
vignette("pkgdown", package = "pkgdown")

# add the RCheck badge and select (1)
usethis::use_github_action()

# add NEWs
usethis::use_news_md()

## Submit on CRAN
# devtools::submit_cran()

# mish
# withr::defer()
