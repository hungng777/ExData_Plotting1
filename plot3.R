
png(filename="plot3.png", width=480, height=480)


# 1/2/2007 data starts at line# 66638, so skip 66637 lines (header line included).  
# 1/2/2007 - 2/2/2007 data contain 2880 rows/lines
# Reference:
# https://stackoverflow.com/questions/23543825/how-can-i-read-the-header-but-also-skip-lines-read-table
#
header <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=1, stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880, na.strings="?")
colnames(df) <- unlist(header)


# Create a new column by concatenating the $Date and $Time columns
# Reference: 
# https://www.marsja.se/how-to-concatenate-two-columns-or-more-in-r-stringr-tidyr/#:~:text=How%20do%20I%20concatenate%20two,B)
#
df$timestamp <- paste(df$Date, df$Time, sep=" ")

# Function strptime returns POSIXlt dates.
#
df$timestamp <- strptime(df$timestamp, "%d/%m/%Y %H:%M:%S")

# Select line chart via type="l".
# Note x-axis label is empty.
#
with(df, plot(timestamp, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(df, lines(timestamp, Sub_metering_1, type="l", col="black"))
with(df, lines(timestamp, Sub_metering_2, type="l", col="red"))
with(df, lines(timestamp, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#
dev.off()
