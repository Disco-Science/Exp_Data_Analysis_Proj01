###Codebook for Coursera Exploratory Data Analysis project 01 by Nathan Choi  
Author: Nathan Choi

Procedures: 

1. Data is read if a subfolder does not exist.
>This subfolder would contain the raw data file that is extracted from the compressed (.zip) file
2. The data is read into a table format and filtered for specific dates while removing timestamps that do not work well with lubridate
>Dates are written in the formate day/month/year as specified in README file
>Dates that are extracted are from 01/02/2007 and 02/02/2007 while the timestampes 00:00:00 are excluded
3. A series of mutations to change the data format from a character to a numeric
4. The data and time is converted into a single class 
5. Plots are created using the parameters defined for the base plot functions


