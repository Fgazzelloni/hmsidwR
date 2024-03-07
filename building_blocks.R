## Create a package
## R-Packages - https://r-pkgs.org/
## check the package's name availability
library(available)
available::available("hmsidwR")

library(devtools)
library(usethis)
usethis::create_package("~/Documents/R/AAA_packages/hmsidwR")
usethis::use_git()

## Function Documentation
usethis::use_r("lmforecast")

## restart and load the function
devtools::load_all()

## check the package status
devtools::check()

## type ctrl . to access the DESCRIPTION file to customize
## add the licence
usethis::use_mit_license()

## add documentation of the function
# head over the function file and --> code--> Insert roxygen skeleton
devtools::document()

## Install the package (Cmd + Shift + B)
devtools::install()

## install testthat to check functions
usethis::use_testthat()
# then fill up the test_that() function with expected output
devtools::test()

## use github
usethis::use_github()

## add a readme
usethis::use_readme_rmd()

## build the readme
devtools::build_readme()
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
usethis::use_data(internal_this, internal_that, internal = TRUE)


## load packages on DESCRPTION
usethis::use_package("your-package")
# in suggest are packages not absolutely required
# reorder list
usethis::use_tidy_description()




