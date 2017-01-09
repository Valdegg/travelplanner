
# föllin og gögnin hafa verið lesin inn

# Bæta við function að hafa allt í sömu röð
# ticks á ásana


manuds = vector(mode="list", length=13)

names(manuds) = c(month.name,"Year")
for(i in 1:13)
{
  manuds[[i]] = i;
}
manuds

# er með high, low, days, mm, hours

vedurs = vector(mode="list", length=6);
names(vedurs) = c("High", "Low", "Days", "mm", "Hours", "dagsljos");
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


# reverse dict
revDict = function(dict)
{
  inverse = names(dict);
  names(inverse) = dict;
  return(inverse)
}

invManuds = revDict(manuds);
invVedur = revDict(vedurs);
invKostir = revDict(kostir);
invHvortgraf = revDict(hvortgrafid)

shinyServer( 
  function(input,output){
    
    output$barplot1 = renderPlot({
      
      # þarf að gera eitt fall sem teiknar bæði veður og kostnað
      # get látið það kalla á teiknamanuds og teiknakostnað
      
      #eða
      
      # sendi tilheyrandi df inn með switch setningu
      # teikna(df, input$)
      # if df == nyrkostnadur teiknakostnað(df,input$kostir)
      # if df == lifsgaedi  teiknakostnað(df,input$gaedi)
      # else // df er veðurbreyta
      # teiknamanud(df,input$manudur,hvort)
      
      # gæti haft breytu sem er 0 upphaflega og uppfærist þegar eitthvað hefur verið valið 
      
      # prófa að hafa 14 staka lista en ekki 13 sem manuds í runapp("gagnvirkni") og hef 14. sem default value, sjá hvað gerist
      # ok þá er NA valið default, það er ágætt í bili
      # þá er vandamálið með hvað df er þegar teiknað er í fyrsta skipti leyst,  fer eftir hvort input$kostir eða input$lifsgaedi sé null
      #
      # hafa default hours of sunlight per year, þ.e. veður og manudir ekki default NA en hitt default NA
      # en almennt væri betra að hafa breytu sem heldur utan um hvað var valið síðast
      
      # -> reactive() til að búa til reactive expression,   
      # file:///home/valdegg/shiny.rstudio.com/tutorial/lesson6.3
      
      # leyst með input$breytaSkodud og conditionalPanel
      
      # g.r.f. að UIið virki eins og ég vil að það virki
      
      if(input$breytaSkodud1 == "Vedur")
      {
        # data getur verið hitinn, regnid eða solskin
        # ef valið er hi/lo þá hitinn, ef days/mm þá regnid ef hours þá solskin
        data = switch(invVedur[[input$vedur1]],
                      "High" = hitinn, 
                      "Low"= hitinn, 
                      "Days" = regnid, 
                      "mm" = regnid, 
                      "Hours" = solskin,
                      "dagsljos" = hitinn)

        teiknadagsljos(data,input$vedur1,input$manudir1)
        
      }
      if(input$breytaSkodud1 == "Verd")
      {
        if(input$allarborgir1)
        {
          teiknadagsljos(nyrkostnadur,input$kostir,"")  
        }else
        {
          
        }
      }
      
      
    })
    
    output$barplot2 = renderPlot({

      if(invHvortgraf[input$nedragraf] == "Vedur")
      {
        # data getur verið hitinn, regnid eða solskin
        # ef valið er hi/lo þá hitinn, ef days/mm þá regnid ef hours þá solskin
        data = switch(invVedur[[input$vedur]],
                      "High" = hitinn, 
                      "Low"= hitinn, 
                      "Days" = regnid, 
                      "mm" = regnid, 
                      "Hours" = solskin)
        hvort = switch(invVedur[[input$vedur]],
                       "High" = T, 
                       "Low"= F, 
                       "Days" = T, 
                       "mm" = F, 
                       "Hours" = T)    
        
        
        teiknamanud(data, invManuds[[input$manudir]],hvort)
        
      }else
      {
        teiknakostnad(nyrkostnadur, invKostir[[input$kostir]])  
      }
    
      
    })
  
    
  }
)