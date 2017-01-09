# utf-8
# Mætti bæta við meðaltölum á gröfin
# tengjast git  https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN



# install.packages("plyr"); install.packages("ggplot2"); install.packages("gridExtra"); install.packages("ggrepel");
# 
# install.packages("StreamMetabolism")
# 
# install.packages("shiny")

library(plyr);
library(ggplot2);
library(gridExtra);
#library(ggrepel);
#library(StreamMetabolism);
library(shiny);

# Föll
if(1)
{
  
  # tekur dataframe og skilar sama dataframe nema búið er að renamea fyrsta dálkinn    
  colnameredd = function(df){
    
    res = df;
    colnames(res)[1] = "manudir";
    return(res)
    
  }
  
  # tekur dataframe og skilar sama dataframe nema búið er að renamea 5. dálkinn ?? mm
  colnameredd_mm = function(df){
    
    res = df;
    colnames(res)[5] = "mm";
    return(res)
    
  }
  
  # tekur dataframe og skilar sama dataframe nema búið er að renamea 1. dálkinn ?? Rank
  colnameredd_rank = function(df){
    
    res = df;
    colnames(res)[1] = "Rank";
    return(res)
    
  }
  
  
  # tek inn data frame sem hefur dálk með mánaðaheitum sem heitir manudir, skila sama data frame raðað eftir mánuðum
  ordermonths = function(df){
    
    return(df[order(match(df$manudir, month.name)), ])
  }
  
  
  # tekur inn dataframe með manudir.href sem eigindi og eyðir þv?? út
  eydadalki = function(df){
    
    res = df;
    res$manudir.href = NULL;
    return(res);
    
  }
  
  # fyrir: df er data frame
  # eftir: nöfnin á istanbúl, reykjav??k og sarajevo hafa verið lagfærð þ.a. þau eru eins ?? kostnaðar- og veðurgögnum
  laganofn_nytt = function(df){
    
    res = data.frame(lapply(df, function(x){ if(typeof(x)=="character"){ gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)}})); # works
    res = data.frame(lapply(res, function(x) {if(typeof(x)=="character"){gsub("Reykja....", "Reykjavik", x)}}));
    res = data.frame(lapply(res, function(x) {if(typeof(x)=="character"){gsub("&", "And", x)}}));
    return(res);
    
  }
  
  # fyrir: df er data frame
  # eftir: nöfnin á istanbúl, reykjav??k og sarajevo hafa verið lagfærð þ.a. þau eru eins ?? kostnaðar- og veðurgögnum
  # nema þar sem gsub hefur verið beitt þá breytast tölurnar ?? factora
  laganofn = function(df){
    
    res = data.frame(lapply(df, function(x){  gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)})); # works
    res = data.frame(lapply(res, function(x) {gsub("Reykja....", "Reykjavik", x)}));
    res = data.frame(lapply(res, function(x) {gsub("&", "And", x)}));
    return(res);
    
  }
  
  # get breytt factorunum aftur ?? tölur
  # geymi gömlu framein og laga nöfnin og replacea nýju factora dálkana með gömlu int dálkunum
  
  
  # fall sem teiknar hitastig / urkomudaga / solskin per manud fyrir tiltekinn mánuð (eða year) á barplot 
  # hvort er T / F og segir hvort það sé High / Low,   Days / mm
  teiknamanud = function(df, manudur, hvort=T){
    
    novo = df[df$manudir==manudur,];
    
    if(identical(df,hitinn)){
      
      if(hvort){
        # skoðum high
        novo = arrange(novo,High);
        novo$City = factor(novo$City, levels = novo$City[order(novo$High)]);
        ggplot(novo, aes(x = City, y = High)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average temperature in",manudur, "°C"));    
      }
      else{
        # skoðum low
        novo = arrange(novo,Low);
        novo$City = factor(novo$City, levels = novo$City[order(novo$Low)]);
        ggplot(novo, aes(x = City, y = Low)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average temperature in",manudur, "°C"));    
      }
    }
    else if(identical(df,regnid)){
      if(hvort){
        # skoðum Days
        novo = arrange(novo,Days);
        novo$City = factor(novo$City, levels = novo$City[order(novo$Days)]);
        ggplot(novo, aes(x = City, y = Days)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Rain in",manudur));    
      }
      else{
        # skoðum mm
        novo = arrange(novo,mm);
        novo$City = factor(novo$City, levels = novo$City[order(novo$mm)]);
        ggplot(novo, aes(x = City, y = mm)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Rain in", manudur));    
      }
    }
    else if(identical(df,solskin)){
      # skoðum dagana
      novo = arrange(novo,Hours);
      novo$City = factor(novo$City, levels = novo$City[order(novo$Hours)]);
      ggplot(novo, aes(x = City, y = Hours)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Sun in",manudur));    
    }
    else{
      print("hvaða dataframe ertu með")
    }
    
    
  }
  
  
  
  # Fyrir: df er data frame sem lýsir borgum (með eigindi City), eigindi er strengur sem er eigindi ?? df
  # df er basically kostnadur en kannski viljum við alhæfa þetta seinna,   þarf að vera búið að laga nöfnin ?? kostnadur
  # Eftir: teiknað hefur verið súlurit með eigindi á móti nöfnum borga
  teiknakostnad = function(df,eigindi)
  {
    df2 = df;
    
    # g.r.f. að hitinn sé ?? environmentinu
    # þarf að henda út þeim borgum sem ekki eru ?? veðurgögnunum til að þær séu ekki of margar.
    vedrid = hitinn[hitinn$manudir=="November",];   # ?? þessu er listi af veður borgum
    vedrid = vedrid[vedrid$City %in% df2$City,];# tek þær veðurborgir sem eru ?? df
    df2 = df2[df2$City %in% vedrid$City,]; # geymi þær sem eru einnig ?? veðuborgum
    
    
    df2$City = factor(df2$City, levels = df2$City[order(df2[eigindi])]);
    #print(df2);
    ggplot(df2, aes_string(x = "City", y = eigindi)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1),plot.title = element_text(hjust = 0.5)) + ggtitle(paste(eigindi));  
    # return(df2);
  }
  
  
  
  # teiknar eigindi úr df á y-ás á móti cost of living index fyrir borgirnar
  # Fyrir: kostnadur er ?? environmentinu, eigindiV er strengur sem er eigindi úr veðurgögnum, eigindiC er cost of living, manudur er strengur (mánuður eða "Year")
  vedurogverd = function(df,eigindiV,eigindiC, manudur)
  {
    
    # http://stackoverflow.com/questions/2641653/pass-a-data-frame-column-name-to-a-function
    # snið borgirnar niður - hægt að gera snyrtilega en þetta virðist virka
    vedrid = df[df$manudir==manudur,];
    kostborgir = kostnadur[kostnadur$City %in% vedrid$City,]; # kostnaður fyrir þær borgir sem eru ?? kostnadur og ?? df
    # búið að henda þeim sem eru ?? kostnadur en ekki ?? df
    # á eftir að henda þeim sem eru ?? df en ekki ?? kostnadur
    # identical(sort(as.vector(vedrid[vedrid$City %in% vedurborgir$City,]$City)),  sort(as.vector(kostborgir$City)))
    vedurborgir = vedrid[vedrid$City %in% kostborgir$City,]$City;
    
    if (eigindiV=="High") {
      title = paste("Temperature in", manudur);
      breytaskodud = "Average High °C";
    } else if (eigindiV=="Low") {
      title = paste("Temperature in", manudur);
      breytaskodud = "Average Low °C";
    } else {
      if(eigindiV=="Days" | eigindiV=="mm"){
        title = paste("Rain in",manudur);
        breytaskodud = eigindiV;
        print(breytaskodud);
      }else{
        print(5);
        title = paste("Sunlight in", manudur);
        if(manudur=="Year"){
          df[eigindiV] = df[eigindiV]/365;
        } else
          df[eigindiV] = df[eigindiV]/30; 
        breytaskodud = "Average Hours per Day"
      }
    }
    
    
    blandan = merge(kostborgir,vedrid[vedrid$City %in% kostborgir$City,], by = "City");
    # töflunum hefur verið blandað
    # Þá vantar að endurnefna borgirnar
    blandan$City = gsub(",.*$","",blandan$City);
    # og stytta nöfnin (substring)
    # og capitalizea  (toupper)
    # en það getur verrið drullu misv??sandi!!!
    # geom_text_repel !!!!!! hurra
    
    # http://stats.stackexchange.com/questions/16057/how-do-i-avoid-overlapping-labels-in-an-r-plot
    
    
    # ggplot(blandan, aes_string(x="Cost.of.Living.Index", y=eigindiV)) + geom_point() + geom_text(aes(label=City),hjust=0,vjust=0) + xlab("Cost of Living (index)") + ylab(breytaskodud) + ggtitle(title);
    ggplot(blandan, aes_string(x=eigindiC, y=eigindi)) + geom_point() + geom_label_repel(aes(label=City),fontface = 'bold', box.padding = unit(0.35, "lines"), point.padding = unit(0.5, "lines")) + xlab("Cost of Living (index)") + ylab(breytaskodud) + ggtitle(title);
    
    # vantar enn að combinera Low og High ?? eitt tv??litað bar sem sýnir bæði
    
  }
  

}

# Ná i gögn og fixa 
if(1)
{
 
  
  hitastig = list(read.csv("Hitastig borgir Evropa/borgir_ar_ak.csv",TRUE),read.csv("Hitastig borgir Evropa/borgir_ar_lp.csv",TRUE), read.csv("Hitastig borgir Evropa/borgir_ar_rz.csv",TRUE));
  rigning = list(read.csv("Urkoma borgir Evropa/urkoma_ak.csv",TRUE),read.csv("Urkoma borgir Evropa/urkoma_lp.csv",TRUE), read.csv("Urkoma borgir Evropa/urkoma_rz.csv",TRUE));
  solskin = list(read.csv("Solskin borgir Evropa/solskin_ak.csv",TRUE),read.csv("Solskin borgir Evropa/solskin_lp.csv",TRUE), read.csv("Solskin borgir Evropa/solskin_rz.csv",TRUE));
  
  # laga dálkaheitin, breyti ?? "manudir"
  hitastig = lapply(hitastig,colnameredd)
  rigning = lapply(rigning,colnameredd)
  solskin = lapply(solskin,colnameredd)
  
  #þarf l??ka að laga millimeters
  rigning = lapply(rigning,colnameredd_mm)
  
  # raða eftir mánuðum
  hitastig = lapply(hitastig,ordermonths)
  rigning = lapply(rigning,ordermonths)
  solskin = lapply(solskin,ordermonths)
  
  
  # eyði út dálkinum með slóðinni
  # hitastig[[1]]$manudir.href = null
  # heitir manudir.href ?? öllum gögnunum
  
  hitastig = lapply(hitastig,eydadalki)
  rigning = lapply(rigning,eydadalki)
  solskin = lapply(solskin,eydadalki)
  
  
  # sameina hitastig ?? eitt dataframe
  
  hitinn = ordermonths(ldply(hitastig, rbind));
  regnid = ordermonths(ldply(rigning,rbind));
  solskin = ordermonths(ldply(solskin,rbind));
  
  
  
  
  # http://stackoverflow.com/questions/2329851/how-can-i-add-another-layer-new-series-to-a-ggplot
  
  
  
  # kostnaður borga ?? Evrópu
  
  kostnadur = read.csv("Kostnadur/cost_of_living.csv", T);
  kostnadur = colnameredd_rank(kostnadur); # laga nafn og raða eftir rank
  kostnadur = kostnadur[order(kostnadur$Rank),]
  
  
  
  # laga nöfnin
  tmphitinn = hitinn;
  tmpregnid = regnid;
  tmpsolskin = solskin;
  
  hitinn = laganofn(hitinn);
  hitinn$High = tmphitinn$High;  hitinn$Low = tmphitinn$Low;
  
  regnid = laganofn(regnid);
  regnid$Days = tmpregnid$Days;  regnid$mm = tmpregnid$mm;
  
  solskin = laganofn(solskin);
  solskin$Hours = tmpsolskin$Hours;
  
}

# 
# # Gamalt fikt dót
# if(1)
# {
#   
#   # hvaða borgir eru með ljót nöfn?  Istanbul, Reykjav??k,   & ?? stað and ?? Bosnia & Herzegovina
#   # skoða þær sem eru ?? hitinn en ekki ?? kostnadur
#   
#   '%!in%' <- function(x,y)!('%in%'(x,y));
#   novhiti[novhiti$City %!in% kostnadur$City,]$City
#   
#   # istanbul, reykjavik og sarajevo basically
#   novhiti = hitinn[hitinn$manudir == "November",];
#   novhiti = data.frame(lapply(novhiti, function(x){ gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)})); # works
#   novhiti = data.frame(lapply(novhiti, function(x) {gsub("Reykja....", "Reykjavik", x)}))
#   novhiti = data.frame(lapply(novhiti, function(x) {gsub("&", "And", x)}))
#   
#   
#   
#   
#   # hendum út úr kostnaður þeim borgum sem eru ekki ?? veðurgögnunum:
#   # ath gæti verið að ?? einhvern mánuð vanti eitthvað svo það væri betra að takmarka hitinn við gefinn mánuð
#   kostnadur = kostnadur[kostnadur$City %in% hitinn$City,];
#   kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Local.Purchasing.Power.Index)]); # svo fari ?? röð 
#   ggplot(kostnadur, aes(x = City, y = Local.Purchasing.Power.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));  
#   
#   
#   kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Cost.of.Living.Index)]); # svo fari ?? röð 
#   ggplot(kostnadur, aes(x = City, y = Cost.of.Living.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));  
#   
#   teiknamanud(hitinn,"December")   # ÞAÐ DETTA ÚT 2 MÆLINGAR, DULARFULLT.
#   
#   # skoðum sólskin ?? Reykjav??k eftir mánuðum
#   
#   solrvk = ordermonths(solskin[solskin$City=="Reykjavik, Iceland" & solskin$manudir != "Year",]);
#   # viljum hafa ?? röð eftir mánuðum
#   solrvk$manudir <- factor( solrvk$manudir, levels =  month.name)
#   ggplot(solrvk, aes(x=manudir, y=Hours/30)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle("Sólskin ?? Reykjav??k") + ylab("Klst. á dag") + xlab("");
#   
#   
#   
#   
#   # skoðum borgir ?? Evrópu, með sólskin á y-ás, verðlag á x-ás og REY, BAR, MAD, PAR sem punkta
#   
#   kostborgir = kostnadur[kostnadur$City %in% solskin$City,]$City
#   solborgirdes = solskin[solskin$manudir=="December",];
#   solborgir = solborgirdes[solborgirdes$City %in% kostnadur$City,]$City
#   
#   lapply(kostborgir, function(x){if(x %in% solborgir){print("já")}else{x <- NULL}}) # Alban??a vantar
#   lapply(solborgir, function(x){if(x %in% kostborgir){print("já")}else{print(x)}}) # allt ?? solborgir er ?? kostborgir
#   
#   #> length(kostborgir)  [1] 55
#   #> length(solborgir)  [1] 59
#   # garg  (reyndar búið að breytast)
#   
#   
#   
#   solb = as.vector(solborgir)
#   kostb = as.vector(kostborgir)
#   sort(kostb)
#   sort(solb)
#   # sést að það er einhver munur á,  kostb inniheldur bara það sem var ?? sól en sól inniheldur eitthvað annað
#   # vantar alban??u, fokk alban??a bara, notum kostb sem punkta
#   
#   # x-ás: price index, y-ás: sólskin ?? desember
#   # set þetta saman ?? data frame og teikna það með ggplot
#   borgir = solb; 
#   verd = kostnadur[kostnadur$City %in% solb,]$Cost.of.Living.Index; 
#   sol = solskin[solskin$manudir=="December" & solskin$City %in% solborgir,];
#   sologverd = data.frame(borgir,verd,sol)
#   
#   
#   sologverd =  merge(kostnadur[kostnadur$City %in% solb,],solskin[solskin$manudir=="December" & solskin$City %in% solborgir,], by="City")
#   
#   # þarf að eyða út nafninu á landinu til að þetta sé skýrara
#   # eyði út öllu sem kemur á eftir kommu
#   sologverd$City = gsub(",.*$", "", sologverd$City)
#   
#   # http://stackoverflow.com/questions/15624656/label-points-in-geom-point
#   ggplot(sologverd, aes(x=sologverd$Cost.of.Living.Index, y=sologverd$Hours, label=City)) + geom_point() + geom_text(aes(label=City),hjust=0,vjust=0) + xlab("Cost of Living (index)") + ylab("Hours of Sunlight") + ggtitle("December")
#   
# }

# Þá má skoða hitastig, rigningu, etc.   Gera fall sem tekur inn 2 eigindi og teiknar á móti hvoru öðru
# L??ka hægt að meta saman sól, rigningu og hita, finna meðaltal
# segja þá að rigning er slæm (-), sól er góð (+)
# og nota gildi borgar / meðaltal borga og leggja það saman, t.d. 





# vantar að snyrta litinn á labelunum

# VANTAR AÐ NOTA BARA FYRSTU 3 STAFINA Í NÖFNUNUM, létt með gsub     sleppa





# Bæta við sunrise og sunset data - sunrise.set Stream Metabolism



# Fyrir Hjálmtý á morgun,  ef ekki næst að gera gagnvirkni sem hægt er að sýna, þá hafa tilbúnar myndir eins og þær á Facebook, auk mynda með verð á einum ás og veður á hinum
# þarf þá að alhæfa fallið þannig að cost of living index er ekki aðal viðfangið (samt default)
# og skrifa forritsbút hérna sem ég get keyrt fyrir hann:

# Highlighta Reykjav??k ?? dæmunum!!!

# cost of living borgir
#kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Cost.of.Living.Index)]); # svo fari ?? röð 
#ggplot(kostnadur, aes(x = City, y = Cost.of.Living.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));
# búinn að fallgera

# # purchasing power index
# teiknakostnad(kostnadur, "Local.Purchasing.Power.Index")  # right? kannski annað nafn
# # sólskin ?? desember
# teiknamanud(solskin,"December");
# # sólskin ?? jún??
# teiknamanud(solskin,"June");
# # rigning yfir árið
# teiknamanud(regnid,"Year");
# 
# # sólskin á móti purchasing power,   fr?? um jólin
# vedurogverd(solskin,"Hours", "Local.Purchasing.Power.Index","December");
# 
# 
# # Hafa titilinn ?? teiknamanud ?? miðjunni  check

# Highlighta Reykjav??k ?? dæmunum!!! check

# skoða kynþáttadreifingu 

# Choropleth map!

# Shiny tutorial

runExample("01_hello");


# Shiny fikt

