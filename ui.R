## nav tabs: HOME, APPLICATION, ACKNOWLEDGEMENTS, SETTINGS (?? only if have extra time)
## HOME tab sidebar: Overview, NIBRS and UCR, Instructions, Additional Notes
## APPLICATION tab sidebar: Year slider, Crime selection drop down
## ACKNOWLEDGEMENTS tab sidebar: Instructors, Coursera, R Studio, Bootswatch, FBI UCR, NACJD, Shiny
## SETTINGS tab sidebar: ??
## themes: cerulean, lumen, simplex, spacelab
require(shiny)
require(googleVis)
x <- c("cerulean.bootstrap.css","lumen.bootstrap.css","simplex.bootstrap.css","spacelab.bootstrap.css")
y <- sample(1:4, 1)
selectTheme <- x[y]
shinyUI(navbarPage(theme = selectTheme,
                   a(img(src="bigorb.png", height = 35, width = 35), href="https://www.rstudio.com"),
                   tabPanel("HOME",
                            titlePanel("HOME"),
                            navlistPanel(
                              tabPanel("Overview",
                                       titlePanel("Overview"),
                                       p("This project is for the Coursera/ Johns Hopkins Bloomberg School 
                                         of Public Health course, Developing Data Products, part of the 
                                         Data Science Specialization track."),
                                       br(),
                                       p("While there are many subjects that can be chosen for the Shiny application, I personally
                                         wanted to choose something more on the serious side. As a father of of 2 wonderful
                                         children, one 5 year old daughter, and one 1.5 year old son (as of 2015), their safety 
                                         is a top priority for me. Having grown up seeing and experiencing the world 
                                         in its wonderful potential, the world also has its terrible potential. I want to protect 
                                         my children from this terrible part of the world as best I can."),
                                       br(),
                                       p("So, with preparation of any kind, I need the knowledge to be informed. And from the 
                                         appropriate lessons so far learned in this Specialization, I will use that knowledge to 
                                         collect the data and create simple statistical analysis,",
                                         tags$i("without conclusion,"), 
                                         "for this project. The data will be crime statistics data made available by the US Department 
                                         of Justice and the National Archive of Criminal Justice Data (NACJD).",
                                         tags$b("Please review the NACJD terms of use under the Acknowledgements tab above in the navigation pane.")),
                                       br(),
                                       p("More specifically, data is from the National Incident-Based Reporting System, or NIBRS. Follow
                                         the link on the left pane for more information."),
                                       br(),
                                       p("Before clicking on the Application tab above, please make sure you",
                                         tags$b("review the application instructions by clicking the Instructions link in the left panel.")) ## , style="font-size:16px"
                                       
                              ), 
                              tabPanel("NIBRS and UCR",
                                       titlePanel("NIBRS"),
                                       p("'National Incident-Based Reporting System (NIBRS) is an incident-based reporting system used by 
                                         law enforcement agencies in the United States for collecting and reporting data on crimes. Local, 
                                         state and federal agencies generate NIBRS data from their records management systems. Data is 
                                         collected on every incident and arrest in the Group A offense category. These Group A offenses 
                                         are 46 specific crimes grouped in 22 offense categories. Specific facts about these offenses 
                                         are gathered and reported in the NIBRS system. In addition to the Group A offenses, eleven Group B 
                                         offenses are reported with only the arrest information.' - ",
                                         a("Wikipedia definition", href="https://en.wikipedia.org/wiki/National_Incident_Based_Reporting_System")),
                                       br(),
                                       p("The data downloaded for this project was filtered for only Violent Crimes. There are much more criteria 
                                         and data that are available, such as victim information, age and sex categories."),
                                       titlePanel("Uniform Crime Reporting (UCR)"),
                                       p("'In response to law enforcement's need for more flexible, in-depth data, the UCR Program formulated 
                                         the National Incident-Based Reporting System (NIBRS). NIBRS presents comprehensive, detailed information 
                                         about crime incidents to law enforcement, researchers, governmental planners, students of crime, and the 
                                         general public. The South Carolina Law Enforcement Division conducted the pilot demonstration of this 
                                         program in 1987. Since then, implementation of NIBRS has been commensurate with the resources, abilities, 
                                         and limitations of the contributing law enforcement agencies. Although participation grows steadily, data 
                                         is still not pervasive enough to make broad generalizations about crime in the United States. However, 
                                         several NIBRS studies and monographs are available on this site that demonstrate the great utility of NIBRS.' -",
                                         a("FBI site link", href="https://www.fbi.gov/about-us/cjis/ucr/nibrs"))
                              ),
                              tabPanel("Instructions",
                                       titlePanel("Layout"),
                                       p("The layout is comprised of 2 main parts: the navigation tabs above (Home, Application, and Acknowledgements), and 
                                         the side panels on the left side. Within each navigation tab, you will find a side panel that contains links 
                                         to information, or inputs for the application."),
                                       titlePanel("Application Instructions"),
                                       p(tags$b("Inputs"),
                                         "- There are only 2 inputs that the application uses: a slider for year selection, and a drop down selection
                                         list to pick the crime. The selections available to you allow you to see crime statistics for a particular year
                                         between 2010 and 2012. The selectable crime rates from the drop down list are per 100,000 population. The application 
                                         will present to you a visual map of the United States, and a scatterplot."),
                                       p(tags$b("Map"),
                                         "- The visual map outlines each state and is shaded according to the statistics associated with the crime you picked. 
                                         Hovering your mouse over a state will give that state's specific statistic for the selections chosen."),
                                       p(tags$b("Scatterplot"),
                                         "- The scatterplot plots the population data against the data of the crime you selected, for the year that you selected. 
                                         It also shows the linear regression trend line to illustrate the correlation between population and the crime selected,
                                         for the year selected. Hovering your mouse over the points or the linear regression trend line will give you specific
                                         statistics for that point.")
                              ),
                              tabPanel("Additional Notes",
                                       titlePanel("Notes"),
                                       p("National or state offense totals are based on data from all reporting agencies and estimates for unreported areas."),
                                       p(tags$b("Alabama"),
                                         " - 2011 - because of changes in the state's reporting practices, figures are not comparable to previous years' data."),
                                       p(tags$b("Delaware"),
                                         " - Since complete 1995 data were not available from Delaware, standard estimation procedures were 
                                         applied to derive the 1995 state estimate. The state UCR Program was unable to provide 1998 forcible 
                                         rape figures in accordance with national UCR guidelines. The 1998 forcible rape total for Delaware was 
                                         estimated by reducing the number of reported offenses by the proportion of male forcible rape victims statewide."),
                                       p(tags$b("District of Columbia"),
                                         " - 1999-2008 District of Columbia data include reports from the Zoological Police. 2002-2008 data include reports 
                                         from the Metro Transit Police. 2012 data includes offenses reported by the Zoological Police and the Metro Transit Police."),
                                       p(tags$b("Florida"),
                                         " - Reporting problems at the state resulted in no usable 1988 data. The state total was estimated by updating previous valid 
                                         annual totals for individual jurisdictions, subdivided by population group. Percent changes for each offense within each 
                                         population group of the geographic division in which the state resides was applied to the previous valid annual totals. The 
                                         state total was compiled from the sums of the population group estimates. The state UCR Program was unable to provide complete 
                                         1996 offense figures in accordance with UCR guidelines. The state UCR Program was able to provide an aggregated state total 
                                         and data were received from 94 individual Florida agencies."),
                                       p(tags$b("Illinois"),
                                         " - The state UCR Program was unable to provide 1985-current forcible rape figures in accordance with national UCR Program 
                                         guidelines. The rape totals were estimated using national rates per 100,000 inhabitants within the eight population groups 
                                         and assigning the forcible rape volumes proportionally to the state. Rockford, Illinois, has provided valid forcible rape 
                                         counts as of 2006. For 1993 state NIBRS conversion efforts resulted in estimation for Illinois. Since valid annual totals were 
                                         available for approximately 60 Illinois agencies, those counts were maintained. The counts for the remaining jurisdictions were 
                                         replaced with the most recent valid annual totals or were generated using standard estimaton procedures. The results of all 
                                         sources were then combined to arrive at the 1993 state total for Illinois. For 1994 state NIBRS conversion efforts resulted 
                                         in estimation for Illinois. Illinois totals were generated using only the valid crime rates for the East North Central Division. 
                                         Within each population group, the state's offense totals were estimated based on the rate per 100,000 inhabitants within the 
                                         remainder of the division. For 1996-current, the state UCR Program was unable to provide complete offense figures in accordance 
                                         with UCR guidelines. Valid Part I counts were available for most of the largest cities (100,000 and over in population). For other 
                                         agencies, the only available counts generated by the Illinois State Program were state totals based upon an incident-level system 
                                         without indication of multiple offenses recorded within single incidents. Therefore, the UCR Hierarchy Rule could not be applied 
                                         in order to convert the state's data to Summary Reporting System data. (The Hierarchy Rule requires that only the most serious 
                                         offense in a multiple-offense criminal incident is counted.) To arrive at a comparable stae estimate to be included in national 
                                         compilations, the Illinois State Program's state totals (which were inflated because of the nonapplication of the Hierarchy Rule) 
                                         were reduced by the proportion of multiple offenses reported within single incidents in the NIBRS database. Valid totals for the 
                                         large cities were excluded from the reduction process."),
                                       p(tags$b("Iowa"),
                                         " - NIBRS conversion efforts resulted in estimation for Iowa in 1991. State totals were estimated by updating previous valid annual 
                                         totals for individual jurisdictions, subdivided by population group. Percent changes for each offense within each population group 
                                         of the West North Central Division were applied to the previous valid annual totals. The state totals were compiled from the sums 
                                         of the population group estimates."),
                                       p(tags$b("Kansas"),
                                         " - NIBRS conversion efforts resulted in estimation for Kansas in 1993. State totals were estimated by updating previous valid annual 
                                         totals for individual jurisdictions, subdivided by population group. Percent changes for each offense within each population group 
                                         of the West North Central Division were applied to the previous valid annual totals. The state totals were compiled from the sums 
                                         of the population group estimates. NIBRS conversion efforts resulted in estimation for Kansas in 1994. State totals were generated using 
                                         only the valid crime rates for the West North Central Division. Within each population group, the state's offense totals were estimated 
                                         based on the rate per 100,000 inhabitants within the remainder of the division. The state UCR Program was unable to provide complete 1995 
                                         offense figures in accordance with UCR guidelines. The state UCR Program was able to provide valid 1994 state totals which were then 
                                         updated using 1995 crime trends for the West North Central Division. The state UCR Program was unable to provide complete 1996 offense 
                                         figures in accordance with UCR guidelines. The Kansas state estimate was extrapolated from 1996 January-June state totals provided by the Kansas 
                                         State UCR Program. The state UCR Program was unable to provide complete 1997 offense figures in accordance with UCR guidelines. The Kansas 
                                         state estimate was extrapolated from 1996 January-June state totals provided by the Kansas State UCR Program. The state UCR Program was unable 
                                         to provide complete 1998 offense figures in accordance with UCR guidelines. To arrive at 1998 estimates, 1997 state totals supplied by the Kansas 
                                         State UCR Program were updated using 1998 crime trends for the West North Central Division. The state UCR Program was unable to provide complete 
                                         1999 offense figures in accordance with UCR guidelines. To arrive at the 1999 estimate for Kansas, the 1998 state total supplied by the state UCR 
                                         Program was updated using 1999 crime trends for the division in which Kansas is located. The state UCR Program was unable to provide complete 
                                         2000 offense figures in accordance with UCR guidelines. To arrive at the 2000 estimate for Kansas, the 1999 state estimate was updated using 
                                         2000 crime trends for the West North Central Division."),
                                       p(tags$b("Kentucky"),
                                         " - Reporting problems at the state resulted in no usable 1988 data. The state total was estimated by updating previous valid annual totals for individual 
                                         jurisdictions, subdivided by population group. Percent changes for each offense within each population group of the geographic division in which the state 
                                         resides was applied to the previous valid annual totals. The state total was compiled from the sums of the population group estimates. The state UCR 
                                         Program was unable to provide complete 1996 offense figures in accordance with UCR guidelines. The 1995 and 1996 percent changes within the geographic 
                                         division in which Kentucky is categorized were applied to the valid 1995 state total to generate the 1996 state total. The state UCR Program was 
                                         unable to provide complete 1997 offense figures in accordance with UCR guidelines. The 1996 and 1997 percent changes within the geographic division in which 
                                         Kentucky is categorized were applied to the valid 1996 state total to effect the 1997 state total. The state UCR Program was unable to provide complete 
                                         1998 offense figures in accordance with UCR guidelines. The state total was estimated by using 1997 figures for the nonreporting areas and applying 1997 
                                         versus 1998 percentage changes for the division in which Kentucky is located. The estimates for the nonreporting areas were then increased by any actual 
                                         1998 crime counts received. The state UCR Program was unable to provide complete 1999 offense figures in accordance with UCR guidelines. To arrive at the 1999 
                                         estimate for Kentucky, the 1998 state total supplied by the state UCR Program was updated using 1999 crime trends for the division in which Kentucky is located.
                                         The state UCR Program was unable to provide complete 2000 offense figures in accordance with UCR guidelines. To arrive at the 2000 estimate for Kentucky, 
                                         the 1999 state total supplied by the state UCR Program was updated using 2000 crime trends for the division in which Kentucky is located. The state UCR Program 
                                         was unable to provide complete 2001 offense figures in accordance with UCR guidelines. To arrive at the 2001 estimate for Kentucky, the 2000 state estimate 
                                         was updated using 2001 crime trends reported for the East South Central Division. The state UCR Program was unable to provide complete 2002 offense figures 
                                         in accordance with UCR guidelines. To obtain the 2002 state crime count, the FBI contacted the state UCR Program, and the state agency was able to provide 
                                         their latest state total, 2000. Therefore, the 2001 state estimate was updated for inclusion in the 2002 edition of Crime in the United States by using the 2001 
                                         crime trends for the division in which the state is located. To derive the 2002 state estimate, the 2002 crime trends for the division were applied to the adjusted 
                                         2001 state estimate. The state UCR Program was unable to provide complete 2003 offense figures in accordance with UCR guidelines. To obtain the 2003 estimate, 
                                         the 2003 crime trend for the East South Central Division was applied to an adjusted 2002 state estimate. The 2002 state count was reestimated by applying the 2002 
                                         crime trend for the East South Central Division using a more current figure, 2001 state totals, provided by the state UCR Program. The adjusted 2002 estimate 
                                         differs from the figure published in the 2002 edition of Crime in the United States which was originally estimated using 2002 state totals."),
                                       p(tags$b("Maine"),
                                         " - The state UCR Program was unable to provide complete 1999 offense figures in accordance with UCR guidelines. The Maine Department of Public Safety forwarded 
                                         monthly January through October crime counts for each law enforcement contributor; since 12 months of data were not received, the national Program estimated 
                                         for the missing data following standard estimation procedures to arrive at a 1999 state total."),
                                       p(tags$b("Michigan"),
                                         " - The state UCR Program was unable to provide 1993 forcible rape figures in accordance with UCR guidelines. The rape totals were estimated using national rates 
                                         per 100,000 inhabitants within the eight population groups and assigning the forcible rape volumes proportionally to the state."),
                                       p(tags$b("Minnesota"),
                                         " - All agencies 1993 and 2005-Present (with the exception of Minneapolis and St. Paul) - The data collection methodology for the offense of forcible rape used 
                                         by the State Uniform Crime Reporting (UCR) Program does not comply with national UCR Program guidelines. Consequently, their figures for forcible rape and violent 
                                         crime (of which forcible rape is part) are not included in this tool."),
                                       p(tags$b("Montana"),
                                         " - The state UCR Program was unable to provide complete 1994 offense figures in accordance with UCR guidelines. State totals were estimated by updating previous 
                                         valid annual totals for individual jurisdictions, subdivided by population group. Percent changes for each offense within each population group of the Mountain 
                                         Division were applied to the previous valid annual totals. The state totals were compiled from the sums of the population group estimates. The state UCR Program 
                                         was unable to provide complete 1995 offense figures in accordance with UCR guidelines. State estimates were computed by updating the previous valid annual totals 
                                         using the 1994 versus 1995 percent changes for the Mountain Division. The state UCR Program was unable to provide complete 1996 offense figures in accordance 
                                         with UCR guidelines. The 1995 and 1996 percent changes within the geographic division in which Montana is categorized were applied to the valid 1995 state total 
                                         to generate the 1996 state total. The state UCR Program was unable to provide complete 1997 offense figures in accordance with UCR guidelines. The 1996 and 1997 
                                         percent changes within the geographic division in which Montana is categorized were applied to the valid 1996 state total to effect the 1997 state total. The state 
                                         UCR Program was unable to provide complete 1998 offense figures in accordance with UCR guidelines. The state total was estimated by using 1997 figures 
                                         for the nonreporting areas and applying 1997 versus 1998 percentage changes for the division in which Montana is located. The estimates for the nonreporting areas 
                                         were then increased by any actual 1998 crime counts received. The state UCR Program was unable to provide complete 1999 offense figures in accordance with UCR 
                                         guidelines. To arrive at the 1999 estimate for Montana, the 1998 state total supplied by the state UCR Program was updated using 1999 crime trends for the division 
                                         in which Montana is located. The state UCR Program was unable to provide complete 2000 offense figures in accordance with UCR guidelines. To arrive at the 2000 
                                         estimate for Montana, the 1999 state total supplied by the state UCR Program was updated using 2000 crime trends for the division in which Montana is located. 2011 
                                         - because of changes in the state's reporting practices, figures are not comparable to previous years' data."),
                                       p(tags$b("New Hampshire"),
                                         " - The state UCR Program was unable to provide complete 1997 offense figures in accordance with UCR guidelines. The 1996 and 1997 percent changes within the geographic 
                                         division in which New Hampshire is categorized were applied to the valid 1996 state total to effect the 1997 state total. The state UCR Program was unable to provide 
                                         complete 1998 offense figures in accordance with UCR guidelines. The state total was estimated by using 1997 figures for the nonreporting areas and applying 1997 
                                         versus 1998 percentage changes for the division in which New Hampshire is located. The estimates for the nonreporting areas were then increased by any actual 1998 
                                         crime counts received. The state UCR Program was unable to provide complete 1999 offense figures in accordance with UCR guidelines. The state total for New Hampshire 
                                         was estimated by using the 1998 figures for the 1999 nonreporting areas and applying the 2-year percent change for the New England Division."),
                                       p(tags$b("New York"),
                                         " - 2012 - because of changes in the state/local agency's reporting practices, figures are not comparable to previous years' data."),
                                       p(tags$b("Oklahoma"),
                                         " - For 1995, the increase in murders was the result of the bombing of the Alfred P. Murrah Federal Building in Oklahoma City."),
                                       p(tags$b("Pennsylvania"),
                                         " - Since complete 1995 data were not available from Pennsylvania, standard estimation procedures were applied to derive the 1995 state estimate."),
                                       p(tags$b("Vermont"),
                                         " - The state UCR Program was unable to provide complete 1997 offense figures in accordance with UCR guidelines. The 1996 and 1997 percent changes within the geographic 
                                         division in which Vermont is categorized were applied to the valid 1996 state total to effect the 1997 state total."),
                                       p(tags$b("Wisconsin"),
                                         " - The state UCR Program was unable to provide complete 1998 offense figures in accordance with UCR guidelines. The state total was estimated by using 1997 figures 
                                         for the nonreporting areas and applying 1997 versus 1998 percentage changes for the division in which Wisconsin is located. The estimates for the nonreporting areas 
                                         were then increased by any actual 1998 crime counts received."),
                                       p("The murder and nonnegligent homicides that occurred as a result of the events of September 11, 2001, are not included."),
                                       p("Sources:	FBI, Uniform Crime Reports as prepared by the National Archive of Criminal Justice Data.")
                              )
                            )
                   ),
                   tabPanel("APPLICATION",
                            titlePanel("APPLICATION"),
                            sidebarLayout(
                              sidebarPanel(
                                sliderInput("Year", "Choose Year:", 
                                            min=2010, max=2012, value=2012,  step=1,
                                            animate=TRUE),
                                selectInput("crime", "Select the Crime:",
                                            choices = c("Total Crime" = "Violent.crime.total",
                                                        "Murder and Manslaughter" = "Murder.and.nonnegligent.Manslaughter",
                                                        "Forced Rape" = "Forcible.rape",
                                                        "Robbery" = "Robbery",
                                                        "Aggravated Assault" = "Aggravated.assault",
                                                        "Total Crime Rate" = "Violent.Crime.rate",
                                                        "Murder/Manslaughter Rate" = "Murder.and.nonnegligent.manslaughter.rate",
                                                        "Forced Rape Rate" = "Forcible.rape.rate",
                                                        "Robbery Rate" = "Robbery.rate",
                                                        "Aggravated Assault Rate" = "Aggravated.assault.rate"))
                              ),
                              mainPanel(
                                titlePanel(h3('VIOLENT CRIME MAP VISUALIZATION')),
                                htmlOutput("gvis"),
                                
                                titlePanel(h3('POPULATION VS. SELECTED CRIME')),
                                htmlOutput("myPlot")
                              )
                            )
                   ),
                   tabPanel("ACKNOWLEDGEMENTS",
                            titlePanel("ACKNOWLEDGEMENTS"),
                            navlistPanel(
                              tabPanel("Instructors",
                                       titlePanel(img(src = "Bloomberg.png", height=75, width=234)),
                                       p("The courses in the Data Science Specialization track are taught 
                                         by Dr. Roger Peng, Dr. Jeff Leek, and Dr. Brian Caffo, all excellent 
                                         professors at the",
                                         a("Johns Hopkins Bloomberg School of Public Health.", 
                                           href="http://www.jhsph.edu/")),
                                       br(),
                                       p(tags$b("Roger D. Peng"),
                                         "is an Associate Professor of Biostatistics at the Johns 
                                         Hopkins Bloomberg School of Public Health and a co-editor of the",
                                         a("Simply Statistics blog.", href="http://www.simplystatistics.org"),
                                         "He conducts research in the areas of air pollution, climate 
                                         change, and health risk assessment and statistical methods for spatial and 
                                         temporal data. Dr. Peng is the author of more than a dozen software packages 
                                         implementing statistical methods for environmental studies, methods for 
                                         reproducible research, and data distribution tools."),
                                       br(),
                                       p(tags$b("Jeff Leek"),
                                         "is an Assistant Professor of Biostatistics at the Johns Hopkins 
                                         Bloomberg School of Public Health and co-editor of the",
                                         a("Simply Statistics blog.", href="http://www.simplystatistics.org"),
                                         "He received his Ph.D. in Biostatistics from the University of Washington and 
                                         is recognized for his contributions to genomic data analysis and statistical 
                                         methods for personalized medicine."),
                                       br(),
                                       p(tags$b("Brian Caffo"),
                                         "is a professor at Johns Hopkins Biostatistics and co-directs the",
                                         a("SMART working group.", href="http://www.smart-stats.org"),
                                         "Learn more about Brian at his web site",
                                         a("www.bcaffo.com.", href="http://www.bcaffo.com"))
                              ),
                              tabPanel("Coursera",
                                       titlePanel(img(src = "Coursera_logo.PNG", height=55, width=211)),
                                       p(a("Coursera", href = "http://www.coursera.com"),
                                         "is an education platform that partners with top 
                                         universities and organizations worldwide, to offer courses online 
                                         for anyone to take, for free, whose mission is to provide universal 
                                         access to the world's best education.")
                              ),
                              tabPanel("R Studio",
                                       titlePanel(img(src="rstudio.png", height = 55, width = 157)),
                                       p(a("RStudio", href="https://www.rstudio.com"),
                                         "is a free and open source integrated development environment (IDE) 
                                         for",
                                         a("R,", href="http://www.r-project.org"),
                                         "a programming language for statistical computing and graphics, whose
                                         mission is to provide the most widely used open source and enterprise-ready 
                                         professional software for the R statistical computing environment. These tools 
                                         will further the cause of expanding the use of R and the field of data science.")
                              ),
                              tabPanel("Bootswatch",
                                       titlePanel(img(src="bootswatch.png", height = 55, width = 55)),
                                       p(a("Bootswatch", href="http://www.bootswatch.com"),
                                         "is a site that provides free themes for Bootstrap. 
                                         Bootstrap themes are released under the MIT License and maintained 
                                         by the community on",
                                         a("GitHub.", href="https://www.github.com"),
                                         "The current theme used by this site is called:", 
                                         br(),
                                         p(code(selectTheme))),
                                         br(),
                                         p("Cerulean is my personal favorite theme."),
                                       br(),
                                       p("Re-running this Shiny App will randomly pick from 4 saved themes
                                         (cerulean, lumen, simplex, spacelab).")
                              ),
                              tabPanel("FBI UCR",
                                       titlePanel(img(src="UCR.png", height = 60, width = 59)),
                                       p("FBI Uniform Crime Reporting (UCR) Program.")
                              ),
                              tabPanel("NACJD",
                                       titlePanel(img(src="nacjd.png", height = 55, width = 180)),
                                       p("National Archive of Criminal Justice Data, terms of use highlights:"),
                                       p("The intention of retrieving these datasets is to use these datasets solely for research 
                                         or statistical purposes and", tags$b("not"),"for investigation of specific RESEARCH SUBJECTS, except 
                                         when identification is authorized in writing by ICPSR (netmail@icpsr.umich.edu)"),
                                       br(),
                                       p("The data used will not be redistributed without the written agreement of the Inter-university Consortium 
                                         for Political and Social Research (ICPSR)."),
                                       br(),
                                       p("DISCLAIMER"),
                                       p("This acknowledges that the original collector of the data, ICPSR, and the relevant funding 
                                         agency bear no responsibility for use of the data or for interpretations or inferences based 
                                         upon such uses.")
                              ),
                              tabPanel("Shiny",
                                       titlePanel("Shiny by R Studio"),
                                       p("Created by R Studio, Shiny is a web application framework for",
                                         a("R,", href="http://www.r-project.org"),
                                         "which turns your analyses into interactive web applications, with no HTML, CSS, 
                                         or JavaScript knowledge required. To learn more about shiny, go",
                                         a("here.", href="http://shiny.rstudio.com"))
                              ),
                              tabPanel("Author",
                                       titlePanel(img(src="aqt.jpg", height = 75, width = 75)),
                                       p("Ambrosio Q. Tria"),
                                       p("You can view my profile on",
                                         a("LinkedIn", href="https://www.linkedin.com/in/ambrosiotria"))
                              )
                            )
                   )
))