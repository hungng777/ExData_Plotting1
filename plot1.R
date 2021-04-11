
png(filename="plot1.png", width=480, height=480)


# 1/2/2007 data starts at line# 66638, so skip 66637 lines (header line included).  
# 1/2/2007 - 2/2/2007 data contain 2880 rows/lines
# Reference:
# https://stackoverflow.com/questions/23543825/how-can-i-read-the-header-but-also-skip-lines-read-table
#
header <- read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=1, stringsAsFactors = FALSE)
df <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880, na.strings="?")
colnames(df) <- unlist(header)

#
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#
dev.off()