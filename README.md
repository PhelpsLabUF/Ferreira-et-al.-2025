Welcome to the GitHub for the calcium analysis code and example data from Ferreira et. al 2025!

This repository contains 3 matlab codes used for calcium analysis of islets. 2 example .csv files have been included to see the formatting of the input data into the codes.

**Multi_Islet_Heatmap.m**
- This code takes in an input file of time in minutes and individual beta cell mean fluorescence intensities for an indivudal islet
- The code takes in a separate file for each islet
- The code will normalize the calcium data and output a heatmap for each beta cell based on its activation
- Beta cells will be grouped by input file (each islet)
- Example data is found in Mouse Islet Heatmap Example File.csv

**Active_Silent_Peak_Analysis_with_Amplitude.m**
- This code takes an input file of time in minutes and F-F0 normalized calcium data for each islet listed in columns
- The code will detect peaks in the calcium data for the specific time and islet specified
- The code will output the oscillation period, duty cycle, active phase, silent phase, and amplitude for each detected oscillation
- Example data is found in Active Silent Example.csv

**Human_GABA_Applications_Avgs.m**
- This code takes an input file of time in minutes and F-F0 normalized calcium data for each islet listed in columns
- This code will calculate the average value of calcium data during minimum of GABA application as well as 3 minutes before and after application
- Averages are taken over 30 seconds
- Outputs are 
