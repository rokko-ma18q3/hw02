# Data Folder setup ----
# 
# This script will download pwt90.dta under ~/Data
# so that you can read the file with haven::read_dta("~/Data/pwt90.dta") 
# regardless of your working directory.
#
# If you already have "Data" folder and if you don't want "pwt90.dta" 
# to be there, please choose an appropriate value for dir_name object below.

dir_name <- "Data"


# Create a new folder "Data" in home ----

data_dir <- file.path(Sys.getenv("HOME"), dir_name)
dir.create(data_dir, showWarnings = FALSE)


# Download Penn World Table ----

pwt_src <- "http://www.rug.nl/ggdc/docs/pwt90.dta"
pwt_dst <- file.path(data_dir, basename(pwt_src))

if (file.exists(pwt_dst)) {
  message(pwt_dst, " already exists.\n")
} else {
  download.file(url = pwt_src, destfile = pwt_dst, mode = "wb") 
}

message("To load the file, run\n\n", 
        'pwt90 <- haven::read_dta("~/Data/pwt90.dta")')

# Cleaning up

rm(data_dir, dir_name, pwt_dst, pwt_src)

