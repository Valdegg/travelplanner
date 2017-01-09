
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

vedurs = vector(mode="list", length=5);
names(vedurs) = c("High", "Low", "Days", "mm", "Hours");
for(j in 1:5)
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
      if(invHvortgraf[input$efragraf] == "Vedur")
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