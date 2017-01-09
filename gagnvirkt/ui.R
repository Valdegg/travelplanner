# gerum veður mánaða dæmið gagnvirkt,  haka við mánuð eða ar og líka hvað skoða skal

# PÆLING hvort það eigi að vera selectInput eða radioButtons fyrir breyturnar. Hallast að radioButtons til að sjá hvað er hægt að velja úr, en prófum bæði. selectInput er fyrirferðaminna

# má bæta við sunrise og sunset siðan!

manuds = vector(mode="list", length=13)   #+1 fyrir ekkert default í bili til að vita að það hafi ekki verið valið 

names(manuds) = c(month.name,"Year")

for(i in 1:length(manuds))
{
  manuds[[i]] = i;
}
manuds

# er með high, low, days, mm, hours

vedurs = vector(mode="list", length=6);
names(vedurs) = c("High", "Low", "Days", "mm", "Hours", "Daylight");
for(j in 1:length(vedurs))
{
  vedurs[[j]] = j;
}


kostir = vector(mode="list", length=6);
names(kostir) = c("Cost.of.Living.Index", "Rent.Index", "Cost.of.Living.Plus.Rent.Index", "Groceries.Index", "Restaurant.Price.Index", "Local.Purchasing.Power.Index");
for(j in 1:length(kostir))
{
  kostir[[j]] = j;
}



breytaSkodud = vector(mode="list", length=2);
names(breytaSkodud) = c("Vedur", "Verd");
for(j in 1:length(breytaSkodud))
{
  breytaSkodud[[j]] = j;
}
breytaSkodud

viddir = vector(mode="list", length=3);
names(viddir) = c("1", "2", "3");
for(j in 1:length(viddir))
{
  viddir[[j]] = j;
}



shinyUI(fluidPage(
  
  
  titlePanel("Weather in European Cities"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create barplots that display data for the main cities in Europe"),

      # condition 1d
conditionalPanel(
  condition = "input$viddir == \"1\"",
      # hef radiobuttons fyrir variableið og mánuðinn
      # svo hægt að hafa slidera til að velja ur þær borgir sem eru með sólskin 50-100 daga a ari t.d.
      column(3,
             conditionalPanel(
               condition = "input.breytaSkodud1 == \"Vedur\"",
               selectInput("vedur1", label = "Weather Variable",
                            choices = vedurs
                            #selected = length(vedurs)
               ),
               selectInput("manudir1", label = "Monthly or Yearly Average",
                           choices = manuds,
                           selected = length(manuds)
               )
             ),
             conditionalPanel(
                condition = "input.breytaSkodud2 == \"Vedur\"",
                selectInput("vedur2", label = "Weather Variable",
                         choices = vedurs
                         # selected = length(vedurs)
                ),
                selectInput("manudir2", label = "Monthly or Yearly Average",
                            choices = manuds,
                            selected = length(manuds)
                )
             )
      ),
      
        column(2,
             conditionalPanel(
               condition = "input.breytaSkodud1 == \"Verd\"",
               selectInput("kostir1", label = "Cost Variable",
                           choices = kostir
                           #selected = length(kostir)
                          ),
                
               
               checkboxInput("allarborgir1", label="All cities")
             
             ),
             conditionalPanel(
               condition = "input.breytaSkodud2 == \"Verd\"",
               selectInput("kostir2", label = "Cost Variable",
                           choices = kostir,
                           selected = length(kostir)
               ),
               checkboxInput("allarborgir2", label="All cities")
              )
            )
          )

      # hvaða breyta er skoðuð
        # háð hve margar víddir eru skoðaðar
      column(2,
             radioButtons("breytaSkodud1", label = "Type of data",
                         choices = breytaSkodud
                         #selected = length(breytaSkodud)
             ),
             radioButtons("breytaSkodud2", label = "Type of data",
                         choices = breytaSkodud
                         #selected = length(breytaSkodud)
             )
      ),
      
      # víddirnar
      column(2,
             radioButtons("dimension", label = "Number of dimensions",
                          choices = viddir
                          # 1d default
             )
      ),
      
      conditionalPanel(
        condition = "input$viddir == \"1\"",
        
        # highlight fyrir graf 1
        column(2,
               selectInput("higlight1_1", label = "Highlight cities",
                           choices =  borgir,
                           selected = match("Reykjavik, Iceland", borgir)),       # segja hvaða borgir þetta eru,   hitinn$Cities, sirka. og hvar reykjavikliggur
               # borgir er háð input$breytaSkodud
               selectInput("higlight1_2", label = "",
                           choices =  borgir,
                           options = list(
                             placeholder = 'Select city',
                             onInitialize = I('function() { this.setValue(""); }')
                             )
                           ), 
               selectInput("higlight1_3", label = "",
                           choices =  borgir,
                           options = list(
                             placeholder = 'Select city',
                             onInitialize = I('function() { this.setValue(""); }')
                             )
                           )
               
        ),
      # highlight fyrir graf 2
        column(2,
            selectInput("higlight2_1", label = "Highlight cities",
                        choices =  borgir,
                        selected = match("Reykjavik, Iceland", borgir)),       # segja hvaða borgir þetta eru,   hitinn$Cities, sirka. og hvar reykjavikliggur
            # borgir er háð input$breytaSkodud
            selectizeInput("higlight2_2", label = "",
                        choices =  borgir,
                        options = list(
                          placeholder = 'Select city',
                          onInitialize = I('function() { this.setValue(""); }')
                        )), 
            selectInput("higlight2_3", label = "",
                        choices =  borgir,
                        options = list(
                        placeholder = 'Select city',
                        onInitialize = I('function() { this.setValue(""); }')
                        )
            )
        )  
    )
      
    ),
    
    mainPanel(
      #plotOutput("barplot")
      
      tabsetPanel(
        #tabPanel("Summary"),
        tabPanel("Plot",
                 # fluidRow(...)
                 plotOutput("barplot1"),
                 plotOutput("barplot2")
        )
      )
    )
  )
))
