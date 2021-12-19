-----------------
# Project Group 6
-----------------

## Context

In the last decades, with the rise of global warming and natural disasters, there is an urgent need to reduce our individual ecological footprint. By now, we are aware that by reducing our overall consumption, shift our purchasing habits and so on, we can globally contribute to a common goal: a cleaner planet.

## Folder Hierarchy

The *project--G6.Rproj* contains three main folders and a README.md file:

* G6 contains the package folder (package and shiny app)
* Project Proposal contains the proposal of the project
* Website contains all the relevant folders and files used to create the website (or generated by its creation)
* README contains an overview of the hierarchy of the project folder and some indications and notes about its content and results

## Website 

By copying and pasting the following link you will access our website: https://ptds2021-g6.netlify.app/

To go back to the main page of the website you can click on the top left logo. 

----------------------
# G6 (package folder)
----------------------

## Data

Our package provides tools to better understand the impact of production on a country's ecological footprint over the years. To be able to provide an exploratory tool (shiny app), we uploaded a relevant data set providing us all the necessary observations found on the following link https://data.world/footprint/nfa-2019-edition. 

## Package Content

The following piece of work creates a package called **G6** providing five functions (four functions are specific to our package  and one function is to launch the shiny app) and a shiny app:

* G6_stats: The function returns a table displaying statistics for one or more selected countries. 

* map_overview: The function returns an interactive World map (of available countries) displaying the total ecological footprint of different production sites by selected record type. 

* sustainability: The function returns a bar plot showing the yearly difference between the biocapacity (in gha) per capita and the ecological footprint of production (in gha) per capita.

* timeseries: The function returns times series of the evolution of different production surface areas' ecological footprints over the years for one or more selected countries. The plot can display some forecasting if the user selects the option to do so.

* start_shiny: The function calls the shiny app once the package is loaded

### Documentation

The documentation of each function was generated by running **roxygen** using the *devtools::document()* function and produced five corresponding .Rd files and a NAMESPACE file. 

### Check

If you run the *devtools::check()* function in the console you obtain the result of the full R CMD check of the package **G6**. The results show that there are no errors and no warnings, indicating that the package works well without any significant issue. However, the result indicates one note telling us that the *installed size is 7.1Mb* and that the *sub-directories of 1Mb or more : extdata 7.0Mb*. Following some research on this note, we learn that it has to do with the size of the data imported which exceeds a certain accepted threshold. Therefore, we will try to reduce the size of the .csv file in **/extdata**. Note that if the note remains when you run the check it means we did not manage to solve the issue. 

### Test

The **/tests** folder contains files that test each function of the package. Since each function provides a visual output we only test whether the functions return a visual one. 

### Running Time

Please note that due to the large data set we use and the functionalities we created, it can take a little bit of time before you see a graphical visualization appear on your screen. For this specific reason, we advise you to click on the *Worldmap Overview* after exploring the other tabs since it requires the longest computing effort. 

--------------
# Improvements
--------------




