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

# prófa annað með gaedi
# núna er þetta dict sem tekur inn nafn og skilar tölu, en inputið eru tölur right? það er ástæðan fyrir því að ég er með revDict, til að fá 
# það meikar sense í UI að hafa dict á milli nafns og tölu, en í server þá vil ég taka inn tölu (input) og gefa nafn sem fer síðan inn í teiknifallið
# gæti því haft andhverft dict í server við það sem er í UI,          en hef bara sama dict og flippa þeim.

gaedi = vector(mode="list", length=(length(names(lifsgaedi))-2)); # fjöldi dálka sem ekki eru borgarheiti eða rank
names(gaedi) = names(lifsgaedi)[3:length(names(lifsgaedi))]
for(j in 1:length(gaedi))
{
  gaedi[[j]] = j;
}
gaedi
revDict = function(dict)
{
  inverse = names(dict);
  names(inverse) = dict;
  return(inverse)
}

# held að invBorgirnarsnid og þar með borgirnarsnid sé óþarfi (borgirsnid dugi)
if(0){
  borgirnarsnid = vector(mode="list",length=length(borgirsnid))
  names(borgirnarsnid) = borgirsnid
  for(j in 1:length(borgirnarsnid))
  {
    borgirnarsnid[[j]] = j;
  }
}

invManuds = revDict(manuds);
invVedur = revDict(vedurs);
invKostir = revDict(kostir);
#invBorgirnarsnid = revDict(borgirnarsnid);
invGaedi = revDict(gaedi);

shinyServer( 
  function(input,output){
    output$barplot1_cost = renderPlot({
      #veður  - þarf að laga teiknadagsljos, eða nota bara teiknamanud... nei þá vantar dagsljos!
      if(0){
        data = switch(invVedur[[input$vedur1]],
                      "High" = hitinn, 
                      "Low"= hitinn, 
                      "Days" = regnid, 
                      "mm" = regnid, 
                      "Hours" = solskin,
                      "dagsljos" = hitinn)
        print(input$vedur1); print(input$manudir1);
        print(invVedur[[input$vedur1]]); print(invManuds[[input$manudir1]]);
        teiknadagsljos(data,invVedur[[input$vedur1]],invManuds[[input$manudir1]])
      }
      
      #print(names(nyrkostnadur)); 
      print("")
      print(input$kostnadur1); print(invKostir[[input$kostnadur1]]); 
      print("highlight:");print(input$highlight1_kost);
      print("allarborgir:");print(input$allarborgir1)
      #kostnaður
      if(input$allarborgir1){
        teiknadagsljos(nyrkostnadur,invKostir[[input$kostnadur1]],"",c(input$highlight1_kost_allar))
      }else{
        teiknadagsljos(nyrkostnadur[nyrkostnadur$City %in% borgirsnid,],invKostir[[input$kostnadur1]],"",c(input$highlight1_kost))
      }
      
    })
    
    output$barplot1_gaedi = renderPlot({
      
      print(revDict(gaedi)[[input$gaedi1]])
      teiknadagsljos(lifsgaedi,revDict(gaedi)[[input$gaedi1]],"",input$highlight1_gaedi)
      
    })
  }
)
