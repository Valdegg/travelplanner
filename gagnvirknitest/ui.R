# prufu umhverfi fyrir gagnvirknina, prófa hér þætti forritsins 

manuds = vector(mode="list", length=13)
names(manuds) = c(month.name,"Year")
for(i in 1:13)
{
  manuds[[i]] = i;
}

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

borgir = nyrkostnadur$City;
# vil fallgera sem tekur sniðmengi af 2 listum,
borgirsnid = nyrkostnadur$City[nyrkostnadur$City %in% hitinn$City]

revDict = function(dict)
{
  inverse = names(dict);
  names(inverse) = dict;
  return(inverse)
}

invManuds = revDict(manuds);
invVedur = revDict(vedurs);
invKostir = revDict(kostir);

sidebarlengd = 2;
plotlengd = 12-sidebarlengd;

shinyUI(fluidPage(
  
  fluidRow("efra",
    column(sidebarlengd,"control1",
          # conditionalPanel(
          #   condition = "input.tabs==\"vedur1\"",
          #   selectInput("vedur1", label = "Weather Variable",
           #              choices = vedurs
          #               #selected = length(vedurs)
          #   ),
          #   radioButtons("manudir1", label = "Monthly or Yearly Average",
          #               choices = manuds,
          #               selected = length(manuds)
          #   )
          # ),
# Kostnaður
          # conditionalPanel(
          #   condition = "input.tabs==\"kostnadur1\"",
          radioButtons("kostnadur1", label = "Cost Variable",
                      choices = kostir
                      #selected = length(vedurs)
          ),
          checkboxInput("allarborgir1", label="All cities"),
          checkboxInput("borgirirod1", label="Cities ordered",value=TRUE),
          
          # ),
          # highlight, allarborgir==TRUE
  #        column(2,
   #              conditionalPanel(
    #               condition = "input.allarborgir1 == TRUE",
     #              selectInput("highlight1_kost_allar", label = "Highlight cities",
      #                         choices =  borgir,
       #                        selected = match("Reykjavik, Iceland", borgir)),       # segja hvaða borgir þetta eru,   hitinn$Cities, sirka. og hvar reykjavikliggur
        #           # borgir er háð input$breytaSkodud
 
                #   )
                # )
                 
          #)
                    # highlight, allarborgir==FALSE
                    #column(2,
                    # conditionalPanel(
                    #  condition = "input.allarborgir1 == FALSE",
                    selectInput("highlight1_kost", label = "Highlight cities",
                                choices =  borgirsnid,
                                selected = c("Reykjavik, Iceland"),
                                multiple=TRUE) ,
                    
                    
                    #              )
                    
                    #)
  # Gæði
  selectInput("highlight1_gaedi", label = "Highlight cities",
              choices =  lifsgaedi$City,
              selected = c("Reykjavik, Iceland"),
              multiple=TRUE),
radioButtons("gaedi1", label = "Quality Variable",
             choices = gaedi
             #selected = length(vedurs)
             )
  
  
# }  #vantarkommu

                 
          #)
          
          ),
    column(plotlengd,"plot1",
           # tabset með id
           tabsetPanel(
             tabPanel("Cost of Living", id = "kostnadur1", plotOutput("barplot1_cost")),
             tabPanel("Quality of Life", id = "gaedi1", plotOutput("barplot1_gaedi"))
             
           )
          )
    
    
    ),
  
  hr(),         # seinna þarf kannske að færa þetta til til að þetta sé samhverft um miðju
  fluidRow("nedra",
   column(6,"control2"),
   column(6,"plot2")
          
  )
    
  )
)

