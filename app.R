#install.packages("rsconnect")
library(rsconnect)
rsconnect::setAccountInfo(name='rong0001', token='A31BFAAB3A1BD63AD1C93941CC41C5DF', secret='tdLPYIIzjtUMWjRQXdgYlC7UTWdNg86O/9dB+JEF')

# once rsconnect is configured, deploy you shiny app
rsconnect::deployApp("Exercise_1")

rsconnect::writeManifest()