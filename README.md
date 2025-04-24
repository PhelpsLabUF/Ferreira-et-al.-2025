Welcome to the GitHub for the calcium analysis code and example data from Ferreira et. al 2025!

This repository contains 3 matlab codes used for calcium analysis of islets. 2 example .csv files have been included to see the formatting of the input data into the codes.

**Multi_Islet_Heatmap.m**
- This code takes in an input file of time in minutes and individual beta cell mean fluorescence intensities for an indivudal islet
- The code takes in a separate file for each islet
- The code will normalize the calcium data and output a heatmap for each beta cell based on its activation
- Beta cells will be grouped by input file (each islet)
- Example data is found in Mouse Islet Heatmap Example File.csv

**Active_Silent_Peak_Analysis_with_Amplitude.m**
- This code takes an input file of time in minutes and 
