
library(package = RNetCDF)
library(package = ncdf.tools)

pathFile <- "D:\\OneDrive\\Teaching\\RCourse\\nc\\AgMERRA_2010_tmax.hdf"


ncOpen <- RNetCDF::open.nc(con = pathFile)

ncData <- RNetCDF::read.nc(ncfile = ncOpen)

RNetCDF::print.nc(x = ncOpen)

class(ncData)

ncData[["longitude"]]

convertDateNcdf2R(time.source=ncData[["time"]],
                  units = "days",
                  origin = as.POSIXct("1980-01-01", tz = "UTC"),
                  time.format = c("%Y-%m-%d"))

i <- which(x = 1 < ncData$longitude & ncData$longitude < 2)
j <- which(x = 10 < ncData$latitude & ncData$latitude < 12)

typeof(ncData$tmax)
class(ncData$tmax)

ncData$tmax[i, j, 1:2]
