#!/usr/bin/bash -l
git clone https://github.com/biodataprog/2022_hw2-M0BILEUSER.git #downloaded file

cut -d, -f2 calfires_2021.csv | sort -n #Print out the range of years that occur in this file (2017, 2018, 2019, 2020, 2021)

cut -d, -f2 calfires_2021.csv | sort -n | tail -n +2 | wc -l #gives you number of fires in the database (134)

awk -F, '{print $13,$6}' calfires_2021.csv | sort -n | tail -n 1 #gives you the name of the largest fire acre (1032699.6 AUGUEST COMPLEX)

cut -d, -f2 calfires_2021.csv | sort -n | uniq -c | tail -n 5 #print out the number of fires that occur each year (39 in 2017, 21 in 2018, 11 in 2019, 44 in 2020, 19 in 2021)

#Print out the total acreage burned in each year.

cut -d, -f2,13 calfires_2021.csv > total.csv

#I went into the file and further cleaning the data by deleting the letters

#shell script name is total.sh

for YEAR in 2017 2018 2019 2020 2021
   do
      TOTAL=$(grep $YEAR total.csv | awk -F',' '{sum+=$2;} END{print sum;}')
      echo "In Year $YEAR, Total was $TOTAL"
   done

bash total.sh
#In Year 2017, Total was 1.20042e+06
#In Year 2018, Total was 1.48253e+06
#In Year 2019, Total was 207643
#In Year 2020, Total was 4.10884e+06
#In Year 2021, Total was 2.1875e+06
