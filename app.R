#install.packages("rsconnect")
# library(rsconnect) #comment out after deploy the app, as it cause runtime error in publish it on cloud 
rsconnect::setAccountInfo(name='rong0001', token='A31BFAAB3A1BD63AD1C93941CC41C5DF', secret='tdLPYIIzjtUMWjRQXdgYlC7UTWdNg86O/9dB+JEF')

# once rsconnect is configured, deploy you shiny app
rsconnect::deployApp("Exercise_1")

#rsconnect::writeManifest() # run after deploy the app to create the dependency file