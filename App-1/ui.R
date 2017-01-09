# titill
# 2 headerar
  # 2 málsgreinar
# kassi
  # header
  # mynd og texti

# bæti hundinum við
shinyUI(fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(h2("Installation"), 
                 p("Shiny is available on CRAN, so you can install it the usual way from your R console:", code("install.packages(\"shiny\")")),
                 img(src="bigorb.png", height=100, width=100)
                 ),
    mainPanel(h1("Introducing Shiny"),
              p("Shiny is a new package from RStudio that makes it", em("incredibly easy"), "to build interactive web applications with R"),
              p("For an introduction and live examples, visit the", a(href="www.google.it", "Shiny homepage")),

              h2("Features"),
              p("* Build useful web applications with only a few lines of code - no JavaScript required."),
              p("* Shiny applications are automatically \"live\" in the same way that", strong("spreadsheets"), "are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser"),
              img(src="api.png")
    )
  )
))
