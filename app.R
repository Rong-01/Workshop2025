#install.packages("rsconnect")
#install.packages("shiny")
#library(shiny)
#install.packages(c('ggplot2','Hmisc'))
#library(Hmisc)

#congiure rsconnect
rsconnect::setAccountInfo(name='rong0001', token='0FC5C9FADEE8615C6F0C06F8AF0A0D39', secret='0uUnmrf1xlY6Y+rTqmJuwfXFz/x1SsTgVTf+tHYa')

#deploy app
#library(rsconnect)
rsconnect::deployApp("Exercise_1")
# why do I get this message while I am demploying exercise 1???
# e-deploying "exercise_2" using "server: shinyapps.io / username: rong0001"
# ℹ Looking up application with id "15302302"...✔ Found application <https://rong0001.shinyapps.io/exercise_2/>
shinyApp(ui = ui, server = server)

# create dependency file after running the deployment
rsconnect::writeManifest()