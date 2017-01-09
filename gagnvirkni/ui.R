# gerum veður mánaða dæmið gagnvirkt,  haka við mánuð eða ar og líka hvað skoða skal

# má bæta við sunrise og sunset siðan!

manuds = vector(mode="list", length=13)

names(manuds) = c(month.name,"Year")

for(i in 1:length(manuds))
{
  manuds[[i]] = i;
}
manuds

# er með high, low, days, mm, hours

vedurs = vector(mode="list", length=5);
names(vedurs) = c("High", "Low", "Days", "mm", "Hours");
for(j in 1:length(vedurs))
{
  vedurs[[j]] = j;
}
vedurs

kostir = vector(mode="list", length=6);
names(kostir) = c("Cost.of.Living.Index", "Rent.Index", "Cost.of.Living.Plus.Rent.Index", "Groceries.Index", "Restaurant.Price.Index", "Local.Purchasing.Power.Index");
for(j in 1:length(kostir))
{
  kostir[[j]] = j;
}
kostir


hvortgrafid = vector(mode="list", length=2);
names(hvortgrafid) = c("Vedur", "Kostnadur");
for(j in 1:length(hvortgrafid))
{
  hvortgrafid[[j]] = j;
}
hvortgrafid




shinyUI(fluidPage(
  
    
    titlePanel("Weather in European Cities"),
    
    sidebarLayout(
      sidebarPanel(
        helpText("Create barplots that display weather averages for the main cities in Europe"),
        
        
        # hef radiobuttons fyrir variableið og mánuðinn
        # svo hægt að hafa slidera til að velja ur þær borgir sem eru með sólskin 50-100 daga a ari t.d.
       
        radioButtons("manudir", label = "Monthly or Yearly Average",
                     choices = manuds,
                     selected = 13
        )
        ,
        
        radioButtons("vedur", label = "Weather Variable",
                     choices = vedurs,
                     selected = 5
        ),
        
        radioButtons("kostir", label = "Cost Variable",
                     choices = kostir,
                     selected = 6
        ),
        
        radioButtons("efragraf", label = "Upper graph",
                     choices = hvortgrafid,
                     selected = 2
        ),
        
        radioButtons("nedragraf", label = "Lower graph",
                     choices = hvortgrafid,
                     selected = 2
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
