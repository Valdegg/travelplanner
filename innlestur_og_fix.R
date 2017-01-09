# utf-8
# Mætti bæta við meðaltölum á gröfin
# tengjast git  https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN
# color blind colors?

# 3D PRENTA OBJECT
# HAFA ÞETTA RAÐAÐ MJÚK ÁFERÐ

# API
# https://www.r-bloggers.com/web-scraping-working-with-apis/

install.packages("plyr"); install.packages("ggplot2"); install.packages("gridExtra"); install.packages("ggrepel");

install.packages("StreamMetabolism");

install.packages("shiny");

library(plyr);
library(ggplot2);
library(gridExtra);
library(ggrepel);
library(StreamMetabolism);
library(shiny);

# Föll
if(1){
  # tekur dataframe og skilar sama dataframe nema búið er að renamea fyrsta dálkinn    
  colnameredd = function(df){
    
    res = df;
    colnames(res)[1] = "manudir";
    return(res)
    
  }
  
  # tekur dataframe og skilar sama dataframe nema búið er að renamea 5. dálkinn í mm
  colnameredd_mm = function(df){
    
    res = df;
    colnames(res)[5] = "mm";
    return(res)
    
  }
  
  # tekur dataframe og skilar sama dataframe nema búið er að renamea 1. dálkinn í Rank
  colnameredd_rank = function(df){
    
    res = df;
    colnames(res)[1] = "Rank";
    return(res)
    
  }
  
  
  # tek inn data frame sem hefur dálk með mánaðaheitum sem heitir manudir, skila sama data frame raðað eftir mánuðum
  ordermonths = function(df){
    
    return(df[order(match(df$manudir, month.name)), ])
  }
  
  
  # tekur inn dataframe með manudir.href sem eigindi og eyðir því út
  eydadalki = function(df){
    
    res = df;
    res$manudir.href = NULL;
    return(res);
    
  }
  
  # fyrir: df er data frame
  # eftir: nöfnin á istanbúl, reykjavík og sarajevo hafa verið lagfærð þ.a. þau eru eins í kostnaðar- og veðurgögnum
  laganofn_nytt = function(df){
    
    res = data.frame(lapply(df, function(x){ if(typeof(x)=="character"){ gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)}})); # works
    res = data.frame(lapply(res, function(x) {if(typeof(x)=="character"){gsub("Reykja....", "Reykjavik", x)}}));
    res = data.frame(lapply(res, function(x) {if(typeof(x)=="character"){gsub("&", "And", x)}}));
    return(res);
    
  }
  
  # fyrir: df er data frame
  # eftir: nöfnin á istanbúl, reykjavík og sarajevo hafa verið lagfærð þ.a. þau eru eins í kostnaðar- og veðurgögnum
  # nema þar sem gsub hefur verið beitt þá breytast tölurnar í factora
  laganofn = function(df){
    
    res = data.frame(lapply(df, function(x){  gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)})); # works
    res = data.frame(lapply(res, function(x) {gsub("Reykja....", "Reykjavik", x)}));
    res = data.frame(lapply(res, function(x) {gsub("&", "And", x)}));
    return(res);
    
  }
  
  # get breytt factorunum aftur í tölur
  # geymi gömlu framein og laga nöfnin og replacea nýju factora dálkana með gömlu int dálkunum
  
  
  # fall sem teiknar hitastig / urkomudaga / solskin per manud fyrir tiltekinn mánuð (eða year) á barplot 
  # hvort er T / F og segir hvort það sé High / Low,   Days / mm
  teiknamanud = function(df, manudur, hvort=T){
    
    novo = df[df$manudir==manudur,];
    
    # bý til litalista sem er jafn langur og fjöldi borga, þar sem allt er NA nema sá sem samsvarar Reykjavík sem er rauður
    
    # bæti við ticks á y-ásinn með bili sem er 1/2 minnsta stærðin af lengd
    # +   scale_y_continuous(breaks = round(seq(min(dat$y), max(dat$y), by = 0.5),1))
    
    if(identical(df,hitinn)){
      
      if(hvort){
        # skoðum high
        novo = arrange(novo,High);
        novo$City = factor(novo$City, levels = novo$City[order(novo$High)]);
        rvk.index = match("Reykjavik, Iceland", novo$City);
        # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
        litir = rep(NA,length(novo$City));
        litir[rvk.index] = "withcolor";
        #print(seq(min(novo$High), max(novo$High), by = 0.5));
        #      print((max(novo[["High"]])-min(novo[["High"]]))/abs(min(novo[["High"]])))
        ggplot(novo, aes(x = City, y = High, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average temperature in",manudur, "°C")) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["High"]], n = round((max(novo[["High"]])-min(novo[["High"]]))/abs(min(novo[["High"]])),1)));
      }
      else{
        # skoðum low
        novo = arrange(novo,Low);
        novo$City = factor(novo$City, levels = novo$City[order(novo$Low)]);
        rvk.index = match("Reykjavik, Iceland", novo$City);
        litir = rep(NA,length(novo$City));
        litir[rvk.index] = "withcolor";
        ggplot(novo, aes(x = City, y = Low, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average temperature in",manudur, "°C")) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Low"]], n = round((max(novo[["Low"]])-min(novo[["Low"]]))/abs(min(novo[["Low"]]),1))));  
      }
    }
    else if(identical(df,regnid)){
      if(hvort){
        # skoðum Days
        novo = arrange(novo,Days);
        novo$City = factor(novo$City, levels = novo$City[order(novo$Days)]);
        rvk.index = match("Reykjavik, Iceland", novo$City);
        litir = rep(NA,length(novo$City));
        litir[rvk.index] = "withcolor";
        ggplot(novo, aes(x = City, y = Days, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Rain in",manudur))  + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Days"]], n = round((max(novo[["Days"]])-min(novo[["Days"]]))/min(novo[["Days"]]),1)));      
      }
      else{
        # skoðum mm
        novo = arrange(novo,mm);
        novo$City = factor(novo$City, levels = novo$City[order(novo$mm)]);
        rvk.index = match("Reykjavik, Iceland", novo$City);
        litir = rep(NA,length(novo$City));
        litir[rvk.index] = "withcolor";
        ggplot(novo, aes(x = City, y = mm, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Rain in", manudur)) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["mm"]], n = round((max(novo[["mm"]])-min(novo[["mm"]]))/min(novo[["mm"]]),1)));  
      }
    }
    else if(identical(df,solskin)){
      # skoðum dagana
      novo = arrange(novo,Hours);
      novo$City = factor(novo$City, levels = novo$City[order(novo$Hours)]);
      rvk.index = match("Reykjavik, Iceland", novo$City);
      litir = rep(NA,length(novo$City));
      litir[rvk.index] = "withcolor";
      novo$Hours = novo$Hours/30;
      ggplot(novo, aes(x = City, y = Hours, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Sun per day in",manudur)) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Hours"]], n = round((max(novo[["Hours"]])-min(novo[["Hours"]]))/min(novo[["Hours"]]),1)));      
    }
    else{
      print("hvaða dataframe ertu með")
    }
    
    
  }
  
  
  
  # Fyrir: df er data frame sem lýsir borgum (með eigindi City), eigindi er strengur sem er eigindi í df
  # df er basically kostnadur en kannski viljum við alhæfa þetta seinna,   þarf að vera búið að laga nöfnin í kostnadur
  # Eftir: teiknað hefur verið súlurit með eigindi á móti nöfnum borga
  teiknakostnad = function(df,eigindi)
  {
    df2 = df;
    
    # g.r.f. að hitinn sé í environmentinu
    # þarf að henda út þeim borgum sem ekki eru í veðurgögnunum til að þær séu ekki of margar.
    vedrid = hitinn[hitinn$manudir=="November",];   # í þessu er listi af veður borgum
    vedrid = vedrid[vedrid$City %in% df2$City,];# tek þær veðurborgir sem eru í df
    df2 = df2[df2$City %in% vedrid$City,]; # geymi þær sem eru einnig í veðuborgum
    
    
    df2$City = factor(df2$City, levels = df2$City[order(df2[eigindi])]);
    rvk.index = match("Reykjavik, Iceland", df2$City);
    # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
    litir = rep(NA,length(df2$City));
    litir[rvk.index] = "withcolor";
    
    # number of ticks = (max-min)/min
    #print(df[eigindi])
    #print(round((max(df2[eigindi])-min(df2$[eigindi]))/min(df2$[eigindi]),1));
    ggplot(df2, aes_string(x = "City", y = eigindi)) + theme_bw() + geom_bar(aes(fill = litir),stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1),plot.title = element_text(hjust = 0.5)) + ggtitle(paste(eigindi))  + guides(fill=F) + scale_y_continuous(breaks = pretty(df2[[eigindi]], n = round((max(df2[[eigindi]])-min(df2[[eigindi]]))/min(df2[[eigindi]]),1)));  
    # return(df2);
  }
  
  # teiknar eigindi úr df á y-ás á móti cost of living index fyrir borgirnar
  # Fyrir: kostnadur er í environmentinu, eigindiV er strengur sem er eigindi úr veðurgögnum, eigindiC er cost of living, manudur er strengur (mánuður eða "Year")
  vedurogverd = function(df,eigindiV,eigindiC, manudur)
  {
    
    # http://stackoverflow.com/questions/2641653/pass-a-data-frame-column-name-to-a-function
    # snið borgirnar niður - hægt að gera snyrtilega en þetta virðist virka
    vedrid = df[df$manudir==manudur,];
    kostborgir = kostnadur[kostnadur$City %in% vedrid$City,]; # kostnaður fyrir þær borgir sem eru í kostnadur og í df
    # búið að henda þeim sem eru í kostnadur en ekki í df
    # á eftir að henda þeim sem eru í df en ekki í kostnadur
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
    # en það getur verrið drullu misvísandi!!!
    # geom_text_repel !!!!!! hurra
    
    # http://stats.stackexchange.com/questions/16057/how-do-i-avoid-overlapping-labels-in-an-r-plot
    rvk.index = match("Reykjavik, Iceland", blandan$City);
    # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
    litir = rep(NA,length(blandan$City));
    litir[rvk.index] = "withcolor";
    
    print(blandan)
    #ggplot(blandan, aes_string(x="Cost.of.Living.Index", y=eigindiV)) + geom_point() + geom_text(aes(label=City),hjust=0,vjust=0) + xlab("Cost of Living (index)") + ylab(breytaskodud) + ggtitle(title);
    
    ggplot(blandan, aes_string(x=eigindiC, y=eigindiV)) + geom_point() + geom_label_repel(aes(label=City),fontface = 'bold', box.padding = unit(0.35, "lines"), point.padding = unit(0.5, "lines")) + xlab(eigindiC) + ylab(breytaskodud) + ggtitle(title) + guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));
    # prófum gg_text_repel og sjáum hvort það sé líka gallað
    #  ggplot(blandan, aes_string(x=eigindiC, y=eigindiV)) + geom_point() + geom_text_repel(aes(label=City)) + xlab("Cost of Living (index)") + ylab(breytaskodud) + ggtitle(title) + guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));
    
    # ggplot(blandan, aes_string(x=eigindiC, y=eigindiV)) + geom_point() + geom_text_repel(aes(label=City)) + xlab("Cost of Living (index)") + ylab(breytaskodud) + ggtitle(title)  + theme(plot.title = element_text(hjust = 0.5));
    
    # vantar enn að combinera Low og High í eitt tvílitað bar sem sýnir bæði
    
  }
  # vedurogverd(solskin,"Hours", "Local.Purchasing.Power.Index","December");
  
  # df = kostnadur,  gæti virkað alhæft
  # teiknar mynd af breytu2 vs breytu1 með nöfn borganna í kostnadur sem punkta
  # Fyrir: df er dataframe, breyta1 og 2 eru strengir
  # Eftir: breyta2 hefur verið teiknað á móti breytu2 með a-tu til b-tu dýrustu borginni
  #       N er fjöldi borga = b-a+1
  kostkost = function(df, breyta1, breyta2,a = 1,b = 30)
  {
    
    # geri tengingu á milli keywords og dálkanafna í kostnadur
    
    
    N = b-a+1;
      
    rvk.index = match("Reykjavik, Iceland", df$City);
    # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
    litir = rep(NA,length(df$City));
    litir[rvk.index] = "withcolor";
    
    # Of margar borgir! Hvað mega vera margar? FÆrri en í vedurogverd, upp á lagg
    # Sjálfkrafa eru N dýrustu, annars allar á bilinu frá a til b
    # Það eru 187 borgir í kostnadur
    # Prófum 30. 
    
    # Þarf að eyða út landsheitinu
    
    df = df[a:b,]; # HMMMM
    # Raða eftir cost of living
    
    # tek frá a til b
    df$City = gsub(",.*$","",df$City);
    # teikna
    ggplot(df,aes_string(x=breyta1, y = breyta2)) + geom_point() + geom_label_repel(aes(label=City),fontface = 'bold', box.padding = unit(0.35, "lines"), point.padding = unit(0.5, "lines")) + xlab(breyta1) + ylab(breyta2) + ggtitle("Cost of Living Comparison") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));
    
  }
  
  
}

setwd("H:/Lokaverkefni");

# gera tímatöku fyrir mismunandi fjölda borga, N = 36 tekur 15 sec
# N = 25, 9s
# N = 29, 7
# N = 22, 5

# Interesting stuff!

# Prófa að skoða allt bara sem punkta
rvk.index = match("Reykjavik, Iceland", df$City);
# geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
litir = rep(NA,length(df$City));
litir[rvk.index] = "withcolor";

# Of margar borgir! Hvað mega vera margar? FÆrri en í vedurogverd, upp á lagg
# Sjálfkrafa eru N dýrustu, annars allar á bilinu frá a til b
# Það eru 187 borgir í kostnadur
# Prófum 30. 


a = 1; b = 187;
# Þarf að eyða út landsheitinu
df = kostnadur; 
df = df[a:b,]; # HMMMM
# Raða eftir cost of living

# tek frá a til b
df$City = gsub(",.*$","",df$City);
# teikna
ggplot(df,aes_string(x="Cost.of.Living.Index", y = "Local.Purchasing.Power.Index")) + geom_point()  + xlab("Cost of Living Index") + ylab("Local Purchasing Power Index") + ggtitle("Cost of Living Comparison") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));

ggplot(df,aes_string(x="Rent.Index", y = "Groceries.Index")) + geom_point()  + xlab("Rent Index") + ylab("Groceries Index") + ggtitle("Cost of Living Comparison") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));

kostkost(kostnadur,"Rent.Index", "Groceries.Index", 150,187)

#þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið

# þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið


# Innlestur og fix
if(1)
{
  hitastig = list(read.csv("Hitastig borgir Evropa/borgir_ar_ak.csv",TRUE),read.csv("Hitastig borgir Evropa/borgir_ar_lp.csv",TRUE), read.csv("Hitastig borgir Evropa/borgir_ar_rz.csv",TRUE));
  rigning = list(read.csv("Urkoma borgir Evropa/urkoma_ak.csv",TRUE),read.csv("Urkoma borgir Evropa/urkoma_lp.csv",TRUE), read.csv("Urkoma borgir Evropa/urkoma_rz.csv",TRUE));
  solskin = list(read.csv("Solskin borgir Evropa/solskin_ak.csv",TRUE),read.csv("Solskin borgir Evropa/solskin_lp.csv",TRUE), read.csv("Solskin borgir Evropa/solskin_rz.csv",TRUE));
  
  # laga dálkaheitin, breyti í "manudir"
  hitastig = lapply(hitastig,colnameredd)
  rigning = lapply(rigning,colnameredd)
  solskin = lapply(solskin,colnameredd)
  
  #þarf líka að laga millimeters
  rigning = lapply(rigning,colnameredd_mm)
  
  # raða eftir mánuðum
  hitastig = lapply(hitastig,ordermonths)
  rigning = lapply(rigning,ordermonths)
  solskin = lapply(solskin,ordermonths)
  
  
  # eyði út dálkinum með slóðinni
  # hitastig[[1]]$manudir.href = null
  # heitir manudir.href í öllum gögnunum
  
  hitastig = lapply(hitastig,eydadalki)
  rigning = lapply(rigning,eydadalki)
  solskin = lapply(solskin,eydadalki)
  
  # kostnaður borga í Evrópu
  
  kostnadur = read.csv("Kostnaður/cost_of_living.csv", T);
  kostnadur = colnameredd_rank(kostnadur); # laga nafn og raða eftir rank
  kostnadur = kostnadur[order(kostnadur$Rank),]
  # sameina hitastig í eitt dataframe
  
  hitinn = ordermonths(ldply(hitastig, rbind));
  regnid = ordermonths(ldply(rigning,rbind));
  solskin = ordermonths(ldply(solskin,rbind));
  
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





# Prufur og prull
if(1)
{
  # http://stackoverflow.com/questions/2329851/how-can-i-add-another-layer-new-series-to-a-ggplot
  
  # ÞYRFTI AÐ LAGFÆRA ÞAU NÖFN SEM ERU MEÐ VILLUM EINS OG REYKJAVÍK
  # hvaða borgir eru með ljót nöfn?  Istanbul, Reykjavík,   & í stað and í Bosnia & Herzegovina
  # skoða þær sem eru í hitinn en ekki í kostnadur
  
  '%!in%' <- function(x,y)!('%in%'(x,y));
  novhiti[novhiti$City %!in% kostnadur$City,]$City
  
  # istanbul, reykjavik og sarajevo basically
  novhiti = hitinn[hitinn$manudir == "November",];
  novhiti = data.frame(lapply(novhiti, function(x){ gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)})); # works
  novhiti = data.frame(lapply(novhiti, function(x) {gsub("Reykja....", "Reykjavik", x)}))
  novhiti = data.frame(lapply(novhiti, function(x) {gsub("&", "And", x)}))
  
  
  
  
  
  # hendum út úr kostnaður þeim borgum sem eru ekki í veðurgögnunum:
  # ath gæti verið að í einhvern mánuð vanti eitthvað svo það væri betra að takmarka hitinn við gefinn mánuð
  kostnadur = kostnadur[kostnadur$City %in% hitinn$City,];
  kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Local.Purchasing.Power.Index)]); # svo fari í röð 
  ggplot(kostnadur, aes(x = City, y = Local.Purchasing.Power.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));  
  
  
  kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Cost.of.Living.Index)]); # svo fari í röð 
  ggplot(kostnadur, aes(x = City, y = Cost.of.Living.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));  
  
  
  
  
  teiknamanud(hitinn,"December")   # ÞAÐ DETTA ÚT 2 MÆLINGAR, DULARFULLT.
  
  # skoðum sólskin í Reykjavík eftir mánuðum
  
  solrvk = ordermonths(solskin[solskin$City=="Reykjavik, Iceland" & solskin$manudir != "Year",]);
  # viljum hafa í röð eftir mánuðum
  solrvk$manudir <- factor( solrvk$manudir, levels =  month.name)
  ggplot(solrvk, aes(x=manudir, y=Hours/30)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle("Sólskin í Reykjavík") + ylab("Klst. á dag") + xlab("");
  
  
  
  
  # skoðum borgir í Evrópu, með sólskin á y-ás, verðlag á x-ás og REY, BAR, MAD, PAR sem punkta
  
  kostborgir = kostnadur[kostnadur$City %in% solskin$City,]$City
  solborgirdes = solskin[solskin$manudir=="December",];
  solborgir = solborgirdes[solborgirdes$City %in% kostnadur$City,]$City
  
  lapply(kostborgir, function(x){if(x %in% solborgir){print("já")}else{x <- NULL}}) # Albanía vantar
  lapply(solborgir, function(x){if(x %in% kostborgir){print("já")}else{print(x)}}) # allt í solborgir er í kostborgir
  
  #> length(kostborgir)  [1] 55
  #> length(solborgir)  [1] 59
  # garg  (reyndar búið að breytast)
  
  
  
  solb = as.vector(solborgir)
  kostb = as.vector(kostborgir)
  sort(kostb)
  sort(solb)
  # sést að það er einhver munur á,  kostb inniheldur bara það sem var í sól en sól inniheldur eitthvað annað
  # vantar albaníu, fokk albanía bara, notum kostb sem punkta
  
  # x-ás: price index, y-ás: sólskin í desember
  # set þetta saman í data frame og teikna það með ggplot
  borgir = solb; 
  verd = kostnadur[kostnadur$City %in% solb,]$Cost.of.Living.Index; 
  sol = solskin[solskin$manudir=="December" & solskin$City %in% solborgir,];
  sologverd = data.frame(borgir,verd,sol)
  
  
  sologverd =  merge(kostnadur[kostnadur$City %in% solb,],solskin[solskin$manudir=="December" & solskin$City %in% solborgir,], by="City")
  
  # þarf að eyða út nafninu á landinu til að þetta sé skýrara
  # eyði út öllu sem kemur á eftir kommu
  sologverd$City = gsub(",.*$", "", sologverd$City)
  
  # http://stackoverflow.com/questions/15624656/label-points-in-geom-point
  ggplot(sologverd, aes(x=sologverd$Cost.of.Living.Index, y=sologverd$Hours, label=City)) + geom_point() + geom_text(aes(label=City),hjust=0,vjust=0) + xlab("Cost of Living (index)") + ylab("Hours of Sunlight") + ggtitle("December")
  
  
  
  
  
  
}

# Work space

kostkost(kostnadur,"Cost.of.Living.Index", "Local.Purchasing.Power.Index",1,187)

kostkost(kostnadur,"Rank", "Groceries.Index",1,80)

# Þá má skoða hitastig, rigningu, etc.   Gera fall sem tekur inn 2 eigindi og teiknar á móti hvoru öðru
# Líka hægt að meta saman sól, rigningu og hita, finna meðaltal
# segja þá að rigning er slæm (-), sól er góð (+)
# og nota gildi borgar / meðaltal borga og leggja það saman, t.d. 




# vantar að snyrta litinn á labelunum

# VANTAR AÐ NOTA BARA FYRSTU 3 STAFINA Í NÖFNUNUM, létt með gsub     sleppa




# ætla að hafa kort af Evrópu og highlighta staðina sem maður getur farið til yfir þennan tíma fyrir þennan pening



# Bæta við sunrise og sunset data - sunrise.set Stream Metabolism
# https://rud.is/b/2014/09/23/seeing-the-daylight-with-r/

# les inn borgir heimsins  http://simplemaps.com/resources/world-cities-data
cities = read.csv("world_cities.csv",TRUE)

sunrise.set()
#sunrise.set(33.46, 84.25, "2008-11-08", timezone="EST") 
sunrise.set(64.9, -21.57, "2016/12/04", timezone="UTC") 	


rvk <- matrix(c(-21.57, 64.9), nrow=1)
for_date <- as.POSIXct("2016-12-04", tz="UTC")
sunriset(rvk, for_date, direction="sunrise", POSIXct.out=TRUE)
sunriset(rvk, for_date, direction="sunset", POSIXct.out=TRUE)


# Fyrir Hjálmtý á morgun,  ef ekki næst að gera gagnvirkni sem hægt er að sýna, þá hafa tilbúnar myndir eins og þær á Facebook, auk mynda með verð á einum ás og veður á hinum
# þarf þá að alhæfa fallið þannig að cost of living index er ekki aðal viðfangið (samt default)
# og skrifa forritsbút hérna sem ég get keyrt fyrir hann:

# Highlighta Reykjavík í dæmunum!!!

# cost of living borgir
#kostnadur$City = factor(kostnadur$City, levels = kostnadur$City[order(kostnadur$Cost.of.Living.Index)]); # svo fari í röð 
#ggplot(kostnadur, aes(x = City, y = Cost.of.Living.Index)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));
# búinn að fallgera

teiknakostnad(kostnadur, "Cost.of.Living.Index")
# purchasing power index
teiknakostnad(kostnadur, "Local.Purchasing.Power.Index")  # right? kannski annað nafn

teiknakostnad(kostnadur, "Restaurant.Price.Index")  # right? kannski annað nafn
# sólskin í desember
teiknamanud(solskin,"December");
teiknamanud(solskin,"November");

# sólskin í júní
teiknamanud(solskin,"June");
  # rigning yfir árið
teiknamanud(regnid,"Year",F);

# sólskin á móti purchasing power,   frí um jólin
vedurogverd(solskin,"Hours", "Cost.of.Living.Index","Year");

vedurogverd(hitinn,"High", "Local.Purchasing.Power.Index","June");

vedurogverd(hitinn,"High", "Rent.Index","November");

vedurogverd(hitinn,"High", "Groceries.Index","November");

# restaurant vs groceries

# AVERAGE PAY FOR CITIES

# SKOÐA PURCHASING POWER VS COST OF LIVING
# bæta við ticks a y asinn
# hafa samanburðina hlið við hlið!

# bera saman kostnað gegnum árin!  hafa slider fyrir árin
# slider fyrir mánuðina/ kostnaður
# þrívíð mynd, fargjöld / veður 

# hafa matsföll, vegið meðaltal  byggt á væntingum eða kröfum eða tilfinningum notenda

# óþægilegt að þurfa að velja öll gildi  -   mjög ósammála / ósammála etc "skiptir rigningin máli?"

# SPEGLAÐ LANDAKORT,  TEIKNA OFANÁ LANDAKORT
# CRIME RATE + CULTURAL RATING + NATURE RATING
# hvað er vinsælt,   heitt í dag  ( í gegnum árin fyrir Ísland) 
# skoða fylgni í hotness og cost of living í Reykjavík       Lonely Planet

# helgarferð / vika / 2 vikur
#

# Hafa titilinn í teiknamanud í miðjunni  check
# Highlighta Reykjavík í dæmunum!!!  check

# vedurogverd er gallað því label_repel gengur svo hægt

# Shiny tutorial

runExample("01_hello");


# Shiny fikt

system.file("examples", package="shiny")

runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # Shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer
  
