# Group member names: Sarah Batten, Alexandra Neff, Katie Clouse


z <- c(1:200) # creating vector
mean(z) # finding mean of vector z
sd(z) # finding standard deviation
zlog <- z > 30 # creating new column that assigns TRUE to values over 30 
zdf <- data.frame(z, zlog) # making dataframe  with the two vectors
colnames(zdf) <- c("zvec", "zlogic") # naming the columns 
zdf$zsquared <- z^2 # creating new column that is the vector z squared
subset(zdf, zsquared > 10 & zsquared < 100) # subsetting using the function and logical operator &
zdf[zdf$zsquared > 10 & zdf$zsquared < 100, ] # subsetting using indexing and logical operator
zdf[26,] # subsetting only the 26th row and all its corresponding columns
zdf$zsquared[180] # subsetting by looking within the zsquared column at the 180th row
