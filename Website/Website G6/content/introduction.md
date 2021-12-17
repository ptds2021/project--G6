---
title: "Introduction"
date: "2021-12-12"
---
# Goals and Impact 

All of us are aware of the urgent need to reduce our individual ecological footprint by reducing our overall consumption, shift our purchasing habits, recycle more, invest in renewable energies and globally contribute to a common goal: a cleaner planet. Even though world leaders gather to unify and work as a united front towards sustainable changes with the ultimate goal to slow climate change, we still currently detect many problems surrounding the topic of sustainability. 

First, we understand that many aspects of sustainability are not well understood. Indeed, it is associated with many difficult terms (e.g. bio capacity, life-cycle analysis, embodied energy, footprint intensity, etc.) that non-specialists do not necessarily understand. Because, the average layman does not necessarily understand these terms and is sometimes overwhelmed by the overload of information in the News regarding achieving sustainability, individuals tend to completely turn away from thinking about it. 

Second, it is not immediately obvious how our personal immediate actions (e.g. limit water use waste, riding a bike over driving a car) fit the overall picture of the community, country and the world. 

Third, sustainability data is scattered among all kinds of media in a "fuzzy" way. Oftentimes, when doing research about the topic, one ends up being constantly redirected to more and more sources that are not necessarily mutually exclusive and collectively exhaustive.

To address the above points and challenges, we want to create the S(ust)hinybility app based on a reliable database. This app aims at gathering worldwide data on carbon emissions caused by different types of production lands and exploit the information to produce visual outcomes enabling a user to look for specific information by country and by year. Therefore, the shiny app will provide visualization to compare carbon emissions on a country (or region) level and understand the gravity and urgency of undertaking immediate long-lasting actions against climate change. 

We try to have the impact on three different levels. First, the individuals are nudged to learn about ecological footprints. This, increases knowledge and awareness and helps to make more informed decisions later on. Second, making ecological footprints comparable between countries helps to filter certain criteria and makes research more convenient. Here, the impact is a higher satisfaction of researchers looking for countries' involvement and responsibility towards sustainable changes. Third, the interactive app helps to track and trace developments. This tool could be a fact checker and used against wrongly spread information over the Internet in either way.  

# Plan 

Our approach is to explore a data set of more than 70,000 entries to investigate carbon emissions by country (and region) over time and, provide some visualization (*map*, *ggplot2* packages). To investigate the evolution over time of CO2 emissions, we will use time series (*tsibble* package) and ultimately, we will forecast (*package FPP3*) emissions for an horizon of time t, to be determined. To explore the data set and provide several features to our shiny app, we will use packages enabling us to manipulate the data (*dplyr*, *tidyverse*) to add features using built-in and our own functions before visually present (*map*, *ggplot2*) our findings.

In order to insure that the app is interactive, we will use features such as checkboxes, filter buttons, flags to let the user be as active as possible. 

Our source of inspiration came from one of our brainstorming sessions about the semester project. Indeed, we wanted to create a shiny app providing information on our carbon footprint. Unfortunately, we couldn't find nor create (lack of time) a data set providing us with the exact information needed. Therefore, we decided to focus on countries' carbon emissions since 1961 and study the magnitude differences between them regarding certain criteria. 

It is very likely that such application is already existing but our focus is to apply notions learnt in class to this specific data set through an interactive shiny app enabling the users to select different features (e.g. checkboxes, filter button...) and have a customized output. 

Our data collection strategy was to look for official websites providing reliable data on carbon emissions by country. We chose this approach to rely on well collected and organized data. 

We found and downloaded a data set containing more than 70,000 entries ordered by country and by year on the following website: https://data.world/footprint. We uploaded the data set in r and saved in the **read_data.R** file. Moreover we might enrich this data with other variables such as population, GDP or others.    


Interactive Shiny App: Carbon Emissions by Country and by Year

In the last decades, with the rise of global warming and natural disasters, there is an urgent need to reduce our individual ecological footprint by reducing our overall consumption, shift our purchasing habits and so on, in order to globally contribute to a common goal: a cleaner planet. The following piece of work aims to create a Shiny app that will gather worldwide data on carbon emissions caused by different types of production lands and exploit the information to produce visual outcomes enabling a user to look for specific information by country and by year, and allowing comparisons by country or region.

This tool will be able to help spreading awareness and understand the gravity and urgency of undertaking immediate long-lasting actions against climate change, as well as making data research more convenient for those needing it.

This project is still at its starting point, only the Project Proposal has been made for now.