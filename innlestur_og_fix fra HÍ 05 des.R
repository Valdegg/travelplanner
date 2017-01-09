# utf-8
# Mætti bæta við meðaltölum á gröfin
# tengjast git  https://support.rstudio.com/hc/en-us/articles/200532077-Version-Control-with-Git-and-SVN
# color blind colors?

# API
# https://www.r-bloggers.com/web-scraping-working-with-apis/


####
# VERK: 
# gera dropdown menu í ui.R þar sem maður velur hvaða borg er highlightuð
#     framlenging á því væri að velja fleiri ein eina borg (checkbox) til að highlighta, í mismunandi litum, auðgert í teiknamanud2
        # fínt að hafa ekki mismunandi liti, komið í teiknadagsljos()
# kalla það annað en teiknadagsljos(), það er samt allt í lagi nafn í bili

# reikna dagsljosmeðaltal fyrir hvern mánuð fyrir hverja borg og setja í dataframe sem verður notað í teiknamanud2       ,   komið í hitinn eftir keyrsluna á forlykkjunum þremur
# hafa öll dagsljósin í 365x67 data frame svo hægt er að debunka kenningu Davíðs Oddssonar
    # Komið inn í Hitinn

# hafa parameter í kostkost, "teikna allar" þar sem eru teiknuð bara venjulegt punktagraf
# eða hafa þegar b-a > 50 (? sjá tímamælingar) að teiknað er venjulegt punktagraf
# hafa parameter, default Reykjavík (ef Reykjavík er í því sem er valið (indexið fyrir hana er í [a,b], t.d. [1,30]))
# sem er nafn á borginni sem verður teiknuð rauð

# Ná í kostnaðargögnin beint inn í R, því þau uppfærast svo oft
  # Komið
# Ná í kostnaðargögn fyrir hverja borg, beint inn í R

# Hafa(finna) fall sem gefur fjarlægð á milli borga, reiknað út frá breiddar- og lengdargráðu
  # distm (c(lon1, lat1), c(lon2, lat2), fun = distHaversine) úr geosphere pakkanum
# Taka inn lista af borgum (Nafn, land) og skila fjölda sólarstunda í Janúar og hitastigi (high/low) fyrir borgirnar
  # Komið, fyrir borgirnar sem eru í gögnunum
# ef Nafn er ekki í veðurgögnunum þá skila þeirri borg frá sama Landi sem er í minnstri fjarlægð frá henni
  # þarf að gera distance() fyrst

# með distance() væri afbragð að finna fjölda náttúruperlna innan x(=100km) radíus

# bæta við meiru í GUIið!!!
  # mörg tabs? ekki of mörg, frekar að láta valið ráðast af parameterum
# bæta við radiobutton fyrir hvort efra plottið sé veður eða kostnaður  og sama um neðra      Komið
  # færa buttonið á réttan stað

# ná í quality of life index töfluna!
  # komið
  # setja hana inn í GUIið
    #hönnunin á UIinu er megin mál, þarf að vera samhliða huglægu hönnuninni á kerfinu


# fleiri ticks !!!    teiknakostnad

# Reykjavík er köldust á ársgrundvelli,       en hún er allavega mild/temperate, með lítinn breytileika
# ------->   Reikna breytileika í hita yfir árið og hafa fyrir borgirnar  og bæta við í hverja töflu


# GUI 
# í GUIinu hafa 1d, 2d, 3d möguleika
#   Sjá Þróun, var lífið skapað? bókina
# hafa valmöguleika fyrir flokkana þrjá fyrir sitt hvora myndina
# fyrsta sem hakað er við er x, annað er y, þriðja er z (? hvernig gerir maður það)
# eða bara x=, y=, z= sem birtist þegar 3d er valið

# setja í kassa veður, verð, lífsgæði

# HAFA ÁRA SLIDER SEM SÝNIR VERÐ OG LÍFSGÆÐIAÞRÓUN GEGNUM ÁRIN
# og VEÐURÞRÓUN GEGNUM ÁRIÐ :D

# hafa breytilegt UI eftir hvað hefur verið valið https://shiny.rstudio.com/articles/dynamic-ui.html
# Um UI Layout https://shiny.rstudio.com/articles/layout-guide.html

# BÆTA VIÐ sliderum til að filtera út t.d. bara þær borgir sem eru með <10 daga af sól á mánuði :D

# hafa ACTION BUTTON fyrir "teikna best fitting línu":            + geom_smooth(method='lm')
  # fyrir 2d myndirnar

# Hafa condition fyrir      "EITT GRAF"          "TVÖ GRÖF"


#####
# LAGA:
#Error in names(frame)[names(frame) == "x"] <- name : 
#  names() applied to a non-vector
# þegar Föll er keyrt
#
# X Lesa nýju kostnaðartöfluna inn með tölurnar sem tölur en ekki strengi
  # lagfært eftirá, á eftir að gera fyrir íbúðatöfluna

# í Júlí eru 0 dagar af rigningu einhversstaðar? Já á Möltu. og 0 mm regn.
  # teiknamanud getur ekki teiknað neitt með 0

# teiknadagsljos virkar ekki fyrir hitinn, fæ factor levels villu þegar það er verið að raða novo eftir eigindi

# fallgera sniðmengi borga, þ.e. borgirsnid = nyrkostnadur$City[nyrkostnadur$City %in% hitinn$City]
  # það má svo nota aftur,   og er eflaust til að vísu

#####
# PÆLINGAR:
# sjá líka neðarlega í skjalinu
# Hafa rakastig með því það segir svo mikið um hversu heitt manni finnst vera
# www.currentresults.com 
# hafa leiguverð sem hlutfall af meðallaunum    # er inni í einhverri numbeo töflu right?
# skoða fylgni á milli breyta, t.d. cost of living ásamt pollution
# Hafa samsettar breytur, til að geta skoðað margar breytur í 2D
  # Hafa fall sem kúplar saman breytur þ.a. út kemur t.d. Purchasing.Power*Health.Care fyrir borgirnar eða Pollution*Population eða SunHours*AverageLow eða Cost/Population
# og gera PCA

# Hafa kort af Evrópu með borgunum á og merkja hvaða borgir hægt er að fljúga til miðað við kröfurnar manns (pening, sól, etc)

# NUMBEO API https://www.numbeo.com/api/doc.jsp

# Gæti haft tabset frekar en breytu sem segir hvaða gögn á að teikna,   sér tab fyrir hvert gagnasafn væri snyrtilegt.
  # Give your tabset panel an id for example tabsetPanel(id="tabs" and add the condition when the tab "b" is focused input.tabs == 'b'

######
# PLAN:

## !!!!!!!!! Forka á GITHUB!!!!!!!!!!!!!!!!

## Downloada öllum gögnum fyrir allar borgir,  https://www.numbeo.com/health-care/in/Berlin   https://www.numbeo.com/NAFNTÖFLU/in/NAFNBORGAR

# bjóða upp á quality of life í gagnvirkni
# bæta við dagsljósinu
  # komið
# setja upp control boxin eins og í Lífið, varð það til við þróun eða sköpun?
# og byrja bara með 1d
  # bæta svo við 2d og 3d
# vera þá með sérstök control box fyrir sitt hvort grafið

# set ui2.R sem ui.R í gagnvirkt,  þ.e. nota gagnvirkt sem test !

# vil hafa default enga breytu valda (þegar lesið: wat, væntanlega hafa default breytu svo það sé einhver mynd)
# það eru 3 mengi af choices; veður, verð, lífsgæði. Vil hafa gagnvirkt þ.a. maður velur einn þessara þriggja flokka
# og velur svo hvað skal teikna.

#  Veður        Verð        Lífsgæði
# Hours/...   Cost/...    Pollution/...

# hafa bara lista sem maður velur úr frekar en radiobutton, miklu snyrtilegra. 

# svo allir valmöguleikarnir sjáist ekki, bara þeir sem skoða skal (því þetta er enn bara 1d barplot)
  # svo þegar 2d plot eru komin þá velja x = [Veður: Hours/High/...    Verð: Cost/Power/Rent/...  Quality: Pollution/HealthCare/...]
# select box  = selectInput
  # hef það þannig að einungis eitt er valið (eins og radiobutton),        eða bara að nýjasta sem var valið er valið (er teiknað)
# grúpa saman þessar select box þrenndir í box [efra plot]  [neðra plot]
# og hafa control button 1d 2d 3d
# ef 2d þá x = selectbox, y = selectbox ,  ef 3d þá xyz

# Gera fall sem tekur inn data frame og savear myndir af súluritum af öllum breytunum á móti $City
# http://stackoverflow.com/questions/7144118/how-to-save-a-plot-as-image-on-the-disk


# !
  # GERA VIDEO AF vistamyndir() fyrir forritið !
# !

# ZOOM fyrir notendur með litla skjái
# zoom plot http://shiny.rstudio.com/gallery/plot-interaction-zoom.html
# zoom on axis http://stackoverflow.com/questions/6914507/can-i-navigate-zoom-in-and-zoom-out-r-plots

# !
  # Hafa barplot fyrir hverja borg með breytur á x-ás !  Sérð þá hvernig t.d. Berlin stendur sig í veðri, eða öllu saman
    # Hafa þá möguleika á að skoða allar breyturnar (úr veður, kostnaðar og lífsgæða gögnunum) saman eða einn hóp fyrir sig (navBarMenu or some)
  # mögulega til betri framsetningar heldur en barplot, hægt að hafa marga möguleika
# !

# Æfa það að filtera út allt sem ekki uppfyllir tilteknar kröfur (sbr. égferíflugið.is) 
  # hef sér tab sem merkir inn á kort borgir sem uppfylla gefnar kröfur

# https://www.numbeo.com/crime/in/Reykjavik
# https://www.numbeo.com/health-care/in/Reykjavik   https://www.numbeo.com/health-care/in/Berlin
  # mjög fyrirsjáanleg nöfn, ætti að vera auðvelt að ná í allar töflurnar fyrir allt :D

# þarf að conditiona stærðina á plotinu (barplot, kostnadur) eftir því hvort allarborgir sé valið, ef svo er þá verða takkarnir fyrir neðan en ekki til vinstri


# Miniplan:
# setja upp UIið, setja columns í "sidebar"
# Gera dagsljos teiknanlegt fyrir teiknamanud, þ.e. edita teiknamanud
  # og stilla server.R og ui.R með því
# quality of life í gagnvirkni
# bæta dagsljosi, úr hitinn, í appið. (ath fleiri borgir í hitinn þ.a. það var betra að geyma það þar)

# SJÁ server.R,    reactive ætti að geta látið mann vita hvort input$x hafi verið uppfært file:///home/valdegg/shiny.rstudio.com/tutorial/lesson6.3
#       EF ég skil þetta rétt
# sjá https://groups.google.com/forum/#!topic/shiny-discuss/3HVsdJvZ8-Q

# Nei einfaldast er að:
# (fyrir sitt hvort plotið) hafa radio button sem velur Verð/Veður/Lífsgæði
# og hafa reactive GUI þ.a. ef verð er valið þá birtast radio buttons fyrir það. svo þegar Veður er valið þá hverfa þeir og koma radio buttons fyrir það
# þá er skýrt hvað á að teikna (hvað df er sbr. server.R) og GUIið er snyrtilegt
# svo má gera svipað með 2d og 3d plottin =)

# þarf að skilgreina conditionin fyrir conditional panel: verð radio buttons eru conditioned á BreytaSkodud breytuna
# bý til breytaSkodud og hvort hef ég það til vinstri eða hægri? 
# hægra megin nær gröfunum sýnist mér
#
# þarf að hafa veðurbreytur og mánuðina hlið við hlið en ekki upp-niður
  # hef það upp-niður í bili
# breyti teiknakostnad til að hægt sé að teikna dagsljos       Nei hef frekar bara if setningu í server.R, það ætti að virka. betra að laga fallið en smá tímafrekt
# vista hitinn í csv skrá til að geta hlaðið því beint inn, með dagsljósinu, frekar en að reikna það í 10 mín í hvert skipti.
  # dumpa því í hitinn.Rdmpd :D
    # þarf að hafa ármeðaltölin líka, sýnist þau vanta í hitinn

# snilld: We can use get and get extracts the values of a single string.  
  # arrange(df,get(eigindi)) virkar þá,  string -> non-standard eval

# snilld er kominn með highlight parameter inn í teiknadagsljos (þannig séð teiknamanud líka)
# Vil prófa að hafa í boði að highlighta 3 borgir:  rauður, grænn, blár. Nei sami litur er nóg, dreifingin getur komið á óvart og maður sér nöfnin

# highlight er ekki háð hvaða gögn eru teiknuð, hef það ekki inni í conditioni heldur lengst til hægri
  # og hef default ekkert valið http://stackoverflow.com/questions/24175997/no-default-select

# nema condition (1d)
  # bæti við 1d,2d,3d radioButton
# hanna svo uppsetninguna eftir að control widgetin eru komin
# sleppi því að velja selected þar sem það skiptir ekki máli (þá er fyrsta valið)
  # má bæta röðina
# Læra betur á condition, er ég að gera rétt með /"Verd/"?
  
# bæti við condition að víddin sé 1 víðsvegar

# Prófa eitthvað einfaldara gagnvirkt með bara choose variable og eitthvað háð því
  # /gagnvirnitest
# les fyrst https://shiny.rstudio.com/articles/layout-guide.html áður en haldið er áfram.
# lesa svo yfir aftur með matnum

  # nota gridið (fluidRow() og co) frekar en sidebarPanel og mainPanel sem eru sértilfelli af því
    # YES get notað fluidRow() inni í column() og öfugt :D

  # http://stackoverflow.com/questions/21915783/r-shiny-conditionalpanel-not-working-if-used-in-different-tabs
  # Give your tabset panel an id for example tabsetPanel(id="tabs" and add the condition when the tab "b" is focused input.tabs == 'b'
    # !     hef tabset í stað breytaSkodud
    # Mismunandi tabsets fyrir plottin tvö (sem getur verið bara eitt, conditioned)
    # hendi svo  mögulega navbarPage() utanum þegar töflurnar eru orðnar margar,   less is more samt

# Verður mögulega vandamál fyrir fólk með litla skjái! Zoom er möguleiki. Hafa valmöguleikann "eitt plot" en ekki 2 er möguleiki líka
  # Hefði maður þá lítinn reit column(fluidRow()) eitthvað, fyrir "eina eða tvær myndir" - jafnvel fleiri (samt tæplega)? 
  # hljómar eins og GÓÐ LAUSN!


# Vil þá raða ui.R (í gagnvirknitest bara) upp eins og þetta á að vera, með fluidRow() og column().

  # höfum frátekinn reit (eða röð efst eða dálk fremst frekar upp á samhverfu, sjáum til) fyrir dimensions (1d,2d,3d) og fjöldiplotta (1,2) sem hitt ræðst síðan af
    # hafa í header væri nettast held ég atm
    # hef fjöldiplotta sem navbarMenu() í veður, kostnaður, lífsgæði     "1 full screen plot"  "2 plots"   nema betur orðað       - að því gefnu að það sé ekki óþægileg hönnun sem ég held það sé ekki
    # í plot controlinu (dimension er þ.á.m.) væri cool að hafa PCA möguleika (eða annan möguleika sem gerir almenna samantekt á öllu)
      # hef það í sér summary
  # tvær raðir fyrir tvö (control+plot)
    # innan röð tveir dálkar (control og plot)
    # control: 
      # (conditionast á id úr tabset(id=))
      # veður:
        # buttons fyrir breytu, selectInput fyrir mánuði/ár,  slider fyrir mánuðina til að skoða þróun yfir árið  
                              # nei bara radioButton það virkar eins og slider líka með örvatökkunum
          # og highlight, þrjú select(ize)Input (eða kannski fleiri)
        #
      # kostnadur:
        # breytubuttons,   allarborgir checkbox,     kúplabreytur möguleika; kassi með */+-, breyta1, breyta2      með lýsingu sem poppar upp þegar maður setur músina yfir
        # og highlight, þrjú select(ize)Input (eða kannski fleiri,  ef "allarbreytur" þá fleiri og helst í mismunandi litum með gefinn lit fyrir hvert selectInput)
        # slider fyrir árin 2000-2016 t.d.
      # lifsgaedi:
        # breytubuttons,  kúplabreytur möguleika, highlight möguleika
        # slider fyrir árin 2000-2016 t.d.
      # Examine city:
        # verður í Full screen
        # checklist fyrir töflurnar, default allar valdar (ef teikningin er valin (sem er default), annars radio ef gögnin eru bara skoðuð)
        # choosecity (úr sniðmengi valinna taflna ef teikna skal)
        # Hafa variance milli mánaða fyrir veðrið, variance milli ára fyrir hitt
        # fyrir valda borg hafa 2 subtabs; annað hvort teikna breyturnar á barplot(eða sambærilegri mynd) eða þá birta gögnin fyrir borgina
          # gögnin fyrir borgina: t.d. hvað hlutir kosta í Reykjavík eða health care eða crime
        # slider fyrir árin 2000-2016 
      # Filter:
        # verður í Full screen
        # double sliderar sem setja skorður á breyturnar
      # Summary
        # verður í  Full screen

    # plot: 
      # mismunandi tabs fyrir veður/kostnað/lífsgæði
        # svo væri gott að skoða hverja borg fyrir sig
          # Já,  inni í hverju tab mætti vera selectizeInput("Inspect/Examine city", borgirnar) sem birtir stöðu hverrar borgar myndrænt, t.d. barplot kannski e-ð betra
          # Þá vantar bara myndræna framsetningu á heildarstöðunni
      # sérstakt tab fyrir "Summary", bera allt saman með PCA eða sambærilegu
      # sérstakt tab fyrir hverja borg "Examine city"
      # sérstakt tab "Filter cities" sem birtir þær borgir sem uppfylla tilteknar kröfur á korti af Evrópu, æfing fyrir flugfargjöldin
      
      # Summary:    
        # sjá samantekt á einni mynd,  PCA t.d. 
        # og verðlaun,  gull silfur brons,  top sætin fyrir allar breytur
        # eru controls?
      
      # Filter:
        # kort af Evrópu með punkta sem litast eða merkjast á einhvern hátt fyrir gefnar kröfur


      #barplot ef 1d, annars 2d plot, annars 3dplot obviously
      

# Er að prófa ui.R.  teiknadagsljos virkar ekki fyrir veðurgögnin, sem þarf að laga, en í bili þá get ég teiknað kostnaðinn bara
# þarf að laga inputSelectize()
  # Error : unused argument (options = list(placeholder = "Select city", onInitialize = I("function() { this.setValue(\"\"); }")))

    # þegar kostbreytur eru radioButtons þá virðast þær meira reactive,   þá prentar renderPlot alltaf þegar clickað er á takka,
    # gerðist ekki þegar það var selectInput???
      # prófa að hafa checklista
      # prófa svo að hafa radiobuttons
# :) STÓÐ higlight en ekki highlight

# þarf að conditiona stærðina á plotinu eftir því hvort allarborgir sé valið, ef svo er þá verða takkarnir fyrir neðan en ekki til vinstri

# ath. selectInput býður upp á multiple!
  # multiple	 Is selection of multiple items allowed?

# bæti við lífsgæða tab og control fyrir það og conditiona controlin á hvað input$tab er
  # finn út hvernig conditionin virka nákvæmlega, hvaða 


##################


install.packages(c("plyr", "ggplot2","gridExtra","ggrepel","StreamMetabolism","shiny","XML","geosphere"));
setwd("~/Documents/Lokaverkefni pasteað frá windows þá modified 04 des")

library(RCurl); library(XML); library(plyr); library(ggplot2); library(gridExtra);library(ggrepel); library(StreamMetabolism); library(shiny);library(geosphere)

options(stringsAsFactors = FALSE)



# Föll
if(1){
  
  
  # Notkun: vistamyndir(df,manudur,highlight)
  # Fyrir: df er data frame með dálk sem heitir City
  #        manudur er strengur sbr. teiknamanud(), higlighted er listi af borgum sem highlighta á
  # Eftir: súlurit með breytum df fyrir hverja borg hafa verið vistaðar í current directory (ekki fyrstu 2 breyturnar sem eru Rank og City í mínum dfs)
  vistamyndir = function(df, manudur, highlight = c("Reykjavik"))
  {
    #          Þarf að laga stærðina á myndinni
    dalkurnr = 1;
    for(dalkaheiti in names(df)[3:length(names(df))]){
      #png(filename=paste("/",deparse(substitute(df)),"/dalkur",as.character(dalkurnr),".png", sep=""))
      png(filename=paste("dalkur",as.character(dalkurnr),".png", sep=""))
      print(skiladagsljos(df,dalkaheiti,manudur,highlight))
      inc(dalkurnr)
      dev.off()
    }
  }
  
  # Notkun: newdf = index_to_num(df)
  # Fyrir: df er data frame, helst með indexum sbr. nyrkostnadur og lifsgaedi
  # Eftir: newdf er eins og df nema dálkum sem innihalda Index hefur verið breytt í numeric
  index_to_num = function(df)
  {
    for(dalkanafn in names(df))
    { # þeir dálkarnir 'vinstra megin' við dalkanafn sem hafa Index í nafninu hafa verið breytt (úr strengjum) í tölur
      if(grepl("Index",dalkanafn))
      {
        df[[dalkanafn]] = as.numeric(df[[dalkanafn]]);
      }
    }
    return(df)
  }
  
  # Notkun: vedur = listi_i_vedur(listiborga,manudur)
  # Fyrir: listiborga er listi af strengjum á forminu "Reykjavik, Iceland", manudur er strengur t.d. "February" eða "Year"
  # solskin og hitinn hefur verið hlaðið inn
  # Eftir: vedur er data frame með average high og low og hours of sunlight fyrir þær borgir sem voru í gögnunum
  # fyrir borgirnar sem eru ekki í gögnunum hægt að finna gögnin fyrir þá borg sem er nálægust
  listi_i_vedur = function(listiborga,manudur)
  {
    dagarimanudi = c(31,28,31,30,31,30,31,31,30,31,30,31)
    solimanudi = solskin[solskin$manudir==manudur,]
    if(manudur=="Year")
    {
      solimanudi$Hours = solimanudi$Hours/sum(dagarimanudi)
    }else
    {
      solimanudi$Hours = solimanudi$Hours/dagarimanudi[match(manudur,month.name)]    
    }
    # solimanudi geymir meðalsól per dag fyrir borgirnar á tímabilinu manudur
    
    borgir_i = listiborga %in% solimanudi$City # segir hver er í gögnunum
    borgir_ei = listiborga %!in% solimanudi$City # segir hver er ekki í gögnunum
    
    solimanudi = solimanudi[solimanudi$City %in% listiborga[borgir_i],]
    # solimanudi geymir meðalsól per dag fyrir borgirnar sem eru í listiborga á tímabilinu manudur
    
    hitiimanudi = hitinn[hitinn$manudir==manudur,]
    sologhiti = hitiimanudi[hitiimanudi$City %in% listiborga[listiborga %in% hitiimanudi$City],]
    # sologhiti geymir meðalhita í manudur fyrir borgirnar úr listiborga
    
    sologhiti$Hours = rep(NA,nrow(sologhiti))
    for(i in solimanudi$City)
    { 
      sologhiti[sologhiti$City==i,]$Hours = solimanudi[solimanudi$City==i,]$Hours
    }
    # sólarstundum úr solimanudi hefur verið bætt á tilheyrandi stað í sologhiti
    
    # bæti við dagsljósinu, þarf fyrst að reikna út dagsljósið, sjá forlykkjurnar þrjár
    
    # bæti við restaurant_price_index
    
    borgir_i_kost = listiborga[listiborga %in% kostnadur$City] # þær borgir úr listiborga sem eru í kostnaðargögnunum
    
    borgir_i_kost = borgir_i_kost[borgir_i_kost %in% sologhiti$City]
    # borgir_i_kost geymir nú þær borgir sem eru í  veðurgögnunum líka
    sologhiti$Restaurant.Price.Index = rep(NA,nrow(sologhiti))
    
    for(j in borgir_i_kost)
    {
      sologhiti[sologhiti$City==j,]$Restaurant.Price.Index = kostnadur[kostnadur$City==j,]$Restaurant.Price.Index
    }
    # sort by Hours
    sologhiti = arrange(sologhiti, -Hours)
    #,    hafa það sem parameter
    #if(radaeftir=="Restaurant.Price.Index"){ sologhiti = arrange(sologhiti,radaeftir) }else{      sologhiti = arrange(sologhiti,-radaeftir)}
    
    return(sologhiti)  
  }
  
  # Notkun: inc(x)
  # Fyrir: x er tala
  # Eftir: x er x+1
  inc <- function(x)
  {
    eval.parent(substitute(x <- x + 1))
  }
  
  # Notkun: lengd = solarlengd(borg,dagsetning)
  # Fyrir: llp=latlongpop() hefur verið kallað og er data frame sem geymir breiddar- og lengdargráðu
  #   borg er strengur með nafni borgarinnar (þarf að vera í latlongpop)
  # dagsetning er strengur yyyy/mm/dd
  # Eftir: fjöldi klukkustunda sem dagsljós er í borg á valinni dagsetningu
  solarlengd = function(borg,dagsetning)
  {
    
    light = sunrise.set(as.numeric(llp[llp$city_ascii == borg,]$lat), as.numeric(llp[llp$city_ascii == borg,]$lng), dagsetning)
    rise = light[[1]]
    set = light[[2]]
    
    if(as.numeric(substr(set,15,16)) > as.numeric(substr(rise,15,16)))
    { # sunset mín > sunrise mín 
      klst = as.numeric(substr(set,12,13)) - as.numeric(substr(rise,12,13))  # 5 tímar, ef að sólsetursmínútur > sólarupprásarmínútur, annars 4  
      min =  as.numeric(substr(set,15,16)) - as.numeric(substr(rise,15,16))
    }else
    {
      klst = as.numeric(substr(set,12,13)) - as.numeric(substr(rise,12,13)) - 1;
      min =  abs(as.numeric(substr(rise,15,16)) - as.numeric(substr(set,15,16)) %% 60);
    }
    if(klst+min/60 < 0)
    { # t.d. í júní í reykjavík þá er bæði sólsetur og sólarupprás eftir miðnætti
      return(24 + klst + min/60)
    }else
    {
      return(klst+min/60)
    }
  }
  
  
  # Notkun: df = latlongpop()
  # Fyrir: world_cities.csv er í directoryinu, tmphitinn hefur verið hlaðið inn og geymir veðurnöfnin meðal annars  
  # (ath ekki búið að laganofn(tmphitinn), ef gert oft þá fokkast upp)
  # Eftir: df geymir dataframe með lengdargráðu, breiddargráðu og population borganna úr tmphitinn (nema rostov sem má fokka sér)
  # en nöfnin á pétursborg, nizhny novgorod, kaupmannahöfn og andorra eru mismuanndi en í veðurgögnunum
  #     OG stringsasfactors er orðið FALSE
  latlongpop = function()
  {
    
    stringsAsFactors = FALSE
    
    worldcities = read.csv("world_cities.csv", TRUE)
    
    tmphitinn = laganofn(tmphitinn);
    # komman í Reykjavik dettur út í laganofn !
    nafnafixB = 
      data.frame(lapply(tmphitinn, 
                        function(x){
                          sub(",.*$","",x)
                        }
      )
      )
    # þ.a.l. er Reykjavik dottið út hér
    nafnafixB = nafnafixB[nafnafixB$manudir == "December",] # fækka endurtekningum
    eurocities = worldcities[worldcities$city_ascii %in% nafnafixB$City,]  # Reykjavík er með í-i í tmphitinn :@
    # hér ætti rvk og istanbul að vera dottið út, prófa að prenta
    print(eurocities$city)
    
    euroeyda = subset(eurocities, eurocities$iso2 == "US" | eurocities$iso2 == "VE" | eurocities$iso2 == "CA" )
    eyda = as.numeric(rownames(euroeyda))
    
    # fjarlægi irrelevant borgir
    worldcities[worldcities$city_ascii %!in% eurocities$city_ascii,] = NA  # eurocities er ekki með kaupmannahöfn 
    worldcities[eyda,] = NA
    #þá þarf að fjarlægja allt sem er NA
    # http://stackoverflow.com/questions/4862178/remove-rows-with-nas-missing-values-in-data-frame
    
    # kalla útkomuna eurocities2
    eurocities2 = worldcities[complete.cases(worldcities),] # núna eru 2 fleiri borgir en áður, zürich og reykjavik bættist við
    
    # ok solid, vantar Andorra la vella, Copenhagen, Nizhny And Novgorod, Rostov-on-Don og Saint Petersburg 
    # finn þær í worldcities:
    # Andorra,Andorra,42.50000144,1.516485961,38127,Andorra,AD,AND,
    # København,Kobenhavn,55.67856419,12.56348575,1085000,Denmark,DK,DNK,Hovedstaden
    # Nizhny Novgorod,Nizhny Novgorod,56.33300722,44.00009436,1246463,Russia,RU,RUS,Nizhegorod
    # Rostov,Rostov,57.18915651,39.40430253,33578,Russia,RU,RUS,Yaroslavl'  WRONG
    # sleppum bara rostov fuck that shit
    # St. Petersburg,St. Petersburg,59.93901451,30.31602006,4023106,Russia,RU,RUS,City of St. Petersburg
    
    
    # Note, þetta eru önnur nöfn en í veðurgögnunum.
    
    
    borgirsemvanta = list(c("St. Petersburg","St. Petersburg",59.93901451,30.31602006,4023106,"Russia","RU","RUS","City of St. Petersburg"), c("Nizhny Novgorod","Nizhny Novgorod",56.33300722,44.00009436,1246463,"Russia","RU","RUS","Nizhegorod")
                          ,c("København","Kobenhavn",55.67856419,12.56348575,1085000,"Denmark","DK","DNK","Hovedstaden"),c("Andorra","Andorra",42.50000144,1.516485961,38127,"Andorra","AD","AND", "Andorra"))
    
    for(i in 1:4)
    {
      eurocities2 = rbind(eurocities2, borgirsemvanta[[i]])
    }
    
    return(eurocities2)
  }
  
  # not in virkinn
  '%!in%' <- function(x,y)!('%in%'(x,y));
  
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
  # ATH   Reykjavík getur verið Reykjavi*k eða Reykjavík,   í Ubuntu hjá mér er það Reykjavík en í skólanum var það Reykjavi*k
  # (annað tákn en stjarnan samt)          og İstanbul en ekki A°stanbul eitthvað
  # svo það þarf að aðlaga gsub að neðan að því!
  laganofn = function(df){
    
    #res = data.frame(lapply(df, function(x){  gsub("Ä°stanbul, Turkey", "Istanbul, Turkey", x)})); # works
    #res = data.fstringsAsFactors = FALSErame(lapply(res, function(x) {gsub("Reykja...", "Reykjavik", x)}));
    res = data.frame(lapply(df, function(x){  gsub("İstanbul, Turkey", "Istanbul, Turkey", x)})); # works
    res = data.frame(lapply(res, function(x) {gsub("Reykjavík", "Reykjavik", x)}));
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
        ggplot(novo, aes(x = City, y = Low, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average temperature in",manudur, "°C")) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Low"]], n = round((max(novo[["Low"]])-min(novo[["Low"]]))/abs(min(novo[["Low"]])),1)));  
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
        ggplot(novo, aes(x = City, y = Days, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Rain in",manudur))  + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Days"]], n = round((max(novo[["Days"]])-min(novo[["Days"]]))/max(min(novo[["Days"]]),1),1)));      
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
      if(manudur == "Year")
      {
        novo$Hours = novo$Hours/365
      }else
      {
        novo$Hours = novo$Hours/30;
      }
      ggplot(novo, aes(x = City, y = Hours, fill=litir)) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Sun per day in",manudur)) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[["Hours"]], n = round((max(novo[["Hours"]])-min(novo[["Hours"]]))/min(novo[["Hours"]]),1)));      
    }
    else{
      print("hvaða dataframe ertu með")
    }
    
    
  }
  


  # vantar enn að laga ticks fjöldann fyrir sum eigindin
  
  # Notkun: teiknadagsljos(df,eigindi,manudur)
  # Fyrir: df er data frame; cost of living tafla eða veðurgagnatafla
    # eigindi er strengur, dálkaheiti í df. manudur er strengur, mánuður eða "Year" eða bara eitthvað ef taflan er ekki veðurgögn
    # min(novo) má ekki vera 0
    # highlight er nafn á borginni sem verður higlightuð, eða réttar sagt listi borga sem highlighta skal 
  # Eftir: súlurit af df$eigindi hefur verið teiknað
  
  #væri hægt að hafa gagnvirkt að maður velji hvað það eru margar borgir sem eru teiknaðar... fer eftir skjám,  þær mega ekki vera of margar...
  # Fínt til að sjá highlight, en það er skýrara að hafa færri borgir,   nota bara teiknakostnad() 
  # kannski best að notandinn skoði borgir frá ódýrustu að dýrustu, sbr kostkost()
  teiknadagsljos = function(df,eigindi,manudur,highlight=c("Reykjavik"))
  {
    # geri tengingu á milli eigindaheitanna og heitanna sem teikna skal, annars vegar fyrir veður og 
    if(T)
    {
      vedurnofn = vector(mode="list", length=6);
      names(vedurnofn) = c("High", "Low", "Days", "mm", "Hours", "dagsljos");
      vedurnofn$High = "high [°C]"; vedurnofn$Low = "low [°C]"; vedurnofn$mm = "rain [mm]"; vedurnofn$Days = "rain"; vedurnofn$dagsljos = "daylight"; vedurnofn$Hours = "sunlight"
      
      einingar = vector(mode="list", length=6);
      names(einingar) = c("High", "Low", "Days", "mm", "Hours", "dagsljos");
      einingar$High = "[°C]"; einingar$Low = "[°C]"; einingar$mm = "[mm]"; einingar$Days = "(days)"; einingar$dagsljos = "(hours)"; einingar$Hours = "(hours)"
     
      kostanofn = vector(mode="list", length=length(names(nyrkostnadur))-2);
      names(kostanofn) = c("Cost.of.Living.Index", "Rent.Index", "Cost.of.Living.Plus.Rent.Index", "Groceries.Index", "Restaurant.Price.Index", "Local.Purchasing.Power.Index");
      kostanofn$Cost.of.Living.Index = "Cost of Living Index"; kostanofn$Rent.Index = "Rent Index"; kostanofn$Cost.of.Living.Plus.Rent.Index = "Cost of Living Plus Rent Index"; kostanofn$Groceries.Index = "Groceries Index"; kostanofn$Restaurant.Price.Index = "Restaurant Price Index"; kostanofn$Local.Purchasing.Power.Index = "Local Purchasing Power Index"
      
      gaedanofn = vector(mode="list", length=(length(names(lifsgaedi))-2)); # fjöldi dálka sem ekki eru borgarheiti eða rank
      names(gaedanofn) = names(lifsgaedi)[3:length(names(lifsgaedi))]
      for(dalkanafn in names(gaedanofn))
      {
        gaedanofn[[dalkanafn]] = gsub("\\.", " ", dalkanafn)
      }
      
    }
    
    # vantar líka að laga ticks fjöldann fyrir sum eigindin
    if(eigindi %in% names(vedurnofn))
    { # eigindi er veðurbreyta og er því skipt eftir mánuðum
      novo = df[df$manudir==manudur,];
    }else
    {
      novo = df;
    }
  
    novo = arrange(novo,get(eigindi));  # þetta er kannski óþarfi líka, hægt að sleppa mögulega til að hraða á, gá
    if(eigindi %in% names(vedurnofn)){
  #    novo$City = transform(novo,variable=reorder(novo,City))
      # Sértilfelli því að hitt gefur villu fyrir hitinn :O
    }else{
    novo$City = factor(novo$City, levels = novo$City[order(novo[[eigindi]])]);     
    }  
    # tek inn lista af rökgildum eitt er true hin eru false, vil skila sætinu sem er true
    #rvk.index = match("Reykjavik, Iceland", novo$City);
    highlight.index = unlist(lapply(highlight, 
                                      function(x){ which(grepl(x,novo$City))}
                                      ))
    #highlight.index = which(grepl(highlight, novo$City))   #gamla
    
    # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
    litir = rep(NA,length(novo$City));
    litir[highlight.index] = "withcolor";

    
    
    if(eigindi %in% names(vedurnofn))
    {
      ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(paste(toupper(substr(vedurnofn[[eigindi]],1,1)),substr(vedurnofn[[eigindi]],2,nchar(vedurnofn[[eigindi]])), sep="")) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average", vedurnofn[[eigindi]], "in",manudur, einingar[[eigindi]])) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1)));
    }
    
    print(eigindi %in% names(kostanofn))
    if(eigindi %in% names(kostanofn))
    { 
      # það eru mjög margar borgir í novo, höfum minna letur á x-ásnum
# gera textastærð háða fjölda borga
      if(nrow(novo) < 60){ textastaerd=10}else{textastaerd=7}
      print("kostir munu vera prentaðir")
      #print(get(eigindi))
      ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(kostanofn[[eigindi]]) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(size = textastaerd,angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(kostanofn[[eigindi]]) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1)));
    } 
    else if(eigindi %in% names(gaedanofn))
    {
      textastaerd = 15;
      #print("mjá")
     ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(gaedanofn[[eigindi]]) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(size = textastaerd,angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(gaedanofn[[eigindi]]) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1)));
    }
  }
# PRÓFA FYRIR DAGSLJOS, NOTA SVO INNI Í TEIKNAMANUD SEM ALMENNT TEIKNIFALL nei nota þetta bara í staðinn
  
  
  # eins og teiknadagsljos nema skilar plottinu
  skiladagsljos = function(df,eigindi,manudur,highlight=c("Reykjavik"))
  {
    # geri tengingu á milli eigindaheitanna og heitanna sem teikna skal, annars vegar fyrir veður og 
    if(T)
    {
      vedurs = vector(mode="list", length=6);
      names(vedurs) = c("High", "Low", "Days", "mm", "Hours", "dagsljos");
      vedurs$High = "high [°C]"; vedurs$Low = "low [°C]"; vedurs$mm = "rain [mm]"; vedurs$Days = "rain"; vedurs$dagsljos = "daylight"; vedurs$Hours = "sunlight"
      
      einingar = vector(mode="list", length=6);
      names(einingar) = c("High", "Low", "Days", "mm", "Hours", "dagsljos");
      einingar$High = "[°C]"; einingar$Low = "[°C]"; einingar$mm = "[mm]"; einingar$Days = "(days)"; einingar$dagsljos = "(hours)"; einingar$Hours = "(hours)"
      
      kostir = vector(mode="list", length=length(names(nyrkostnadur))-2);
      names(kostir) = c("Cost.of.Living.Index", "Rent.Index", "Cost.of.Living.Plus.Rent.Index", "Groceries.Index", "Restaurant.Price.Index", "Local.Purchasing.Power.Index");
      kostir$Cost.of.Living.Index = "Cost of Living Index"; kostir$Rent.Index = "Rent Index"; kostir$Cost.of.Living.Plus.Rent.Index = "Cost of Living Plus Rent Index"; kostir$Groceries.Index = "Groceries Index"; kostir$Restaurant.Price.Index = "Restaurant Price Index"; kostir$Local.Purchasing.Power.Index = "Local Purchasing Power Index"
      
      gaedi = vector(mode="list", length=(length(names(lifsgaedi))-2)); # fjöldi dálka sem ekki eru borgarheiti eða rank
      names(gaedi) = names(lifsgaedi)[3:length(names(lifsgaedi))]
      for(dalkanafn in names(gaedi))
      {
        gaedi[[dalkanafn]] = gsub("\\.", " ", dalkanafn)
      }
      
    }
    
    # vantar líka að laga ticks fjöldann fyrir sum eigindin
    if(eigindi %in% vedurs)
    { # eigindi er veðurbreyta og er því skipt eftir mánuðum
      novo = df[df$manudir==manudur,];
    }else
    {
      novo = df;
    }
    
    novo = arrange(novo,get(eigindi));
    novo$City = factor(novo$City, levels = novo$City[order(novo[[eigindi]])]);
    # hver er highlightuð ætti að vera parameter
    # tek inn lista af rökgildum eitt er true hin eru false, vil skila sætinu sem er true
    #rvk.index = match("Reykjavik, Iceland", novo$City);
    highlight.index = unlist(lapply(highlight, 
                                    function(x){ which(grepl(x,novo$City))}
    ))
    #highlight.index = which(grepl(highlight, novo$City))   #gamla
    
    # geri length(novo$City) staka lista af NA nema sæti rvk.index sem er "withcolor"
    litir = rep(NA,length(novo$City));
    litir[highlight.index] = "withcolor";
    
    
    
    if(eigindi %in% names(vedurs))
    {
      return(ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(paste(toupper(substr(vedurs[[eigindi]],1,1)),substr(vedurs[[eigindi]],2,nchar(vedurs[[eigindi]])), sep="")) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(paste("Average", vedurs[[eigindi]], "in",manudur, einingar[[eigindi]])) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1))))
    }
    
    if(eigindi %in% names(kostir))
    { 
      # það eru mjög margar borgir í novo, höfum minna letur á x-ásnum
      textastaerd = 6;
      return(ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(kostir[[eigindi]]) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(size = textastaerd,angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(kostir[[eigindi]]) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1))))
    }
    
    if(eigindi %in% names(gaedi))
    {
      textastaerd = 9
      return(ggplot(novo, aes(x = City, y = get(eigindi), fill=litir)) + ylab(gaedi[[eigindi]]) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(size = textastaerd,angle = 60, hjust = 1), plot.title = element_text(hjust = 0.5)) + ggtitle(gaedi[[eigindi]]) + guides(fill=F) + scale_y_continuous(breaks = pretty(novo[[eigindi]], n = round((max(novo[[eigindi]])-min(novo[[eigindi]]))/abs(min(novo[[eigindi]])),1))))
    }
  }
  
  # Fyrir: df er data frame sem lýsir borgum (með eigindi City), eigindi er strengur sem er eigindi í df
  # df er basically kostnadur en kannski viljum við alhæfa þetta seinna,   þarf að vera búið að laga nöfnin í kostnadur
  # Eftir: teiknað hefur verið súlurit með eigindi á móti nöfnum borga, fyrir þær borgir í df sem eru líka í hitagögnunum
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
  # Fyrir: nyrkostnadur er í environmentinu, eigindiV er strengur sem er eigindi úr veðurgögnum, eigindiC er cost of living, manudur er strengur (mánuður eða "Year")
  vedurogverd = function(df,eigindiV,eigindiC, manudur)
  {
    
    # http://stackoverflow.com/questions/2641653/pass-a-data-frame-column-name-to-a-function
    # snið borgirnar niður - hægt að gera snyrtilega en þetta virðist virka
    vedrid = df[df$manudir==manudur,];
    kostborgir = nyrkostnadur[nyrkostnadur$City %in% vedrid$City,]; # kostnaður fyrir þær borgir sem eru í nyrkostnadur og í df
    # búið að henda þeim sem eru í nyrkostnadur en ekki í df
    # á eftir að henda þeim sem eru í df en ekki í nyrkostnadur
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
    
    # til að fá landakort    blandan$Cost.of.Living.Index = -blandan$Cost.of.Living.Index
    
    
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



# Innlestur og fix
# forskilyrði: hitinndata.Rdmpd er í current directory  
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
  # úrelt
  if(0){
  kostnadur = read.csv("Kostnaður/cost_of_living.csv", T);
  kostnadur = colnameredd_rank(kostnadur); # laga nafn og raða eftir rank
  kostnadur = kostnadur[order(kostnadur$Rank),]
  }
  
  source("hitinndata.Rdmpd")  
  # sameina í eitt dataframe:
#hitinn = ordermonths(ldply(hitastig, rbind));
  regnid = ordermonths(ldply(rigning,rbind));
  solskin = ordermonths(ldply(solskin,rbind));
  
  # laga nöfnin
  tmphitinn = hitinn;
  tmpregnid = regnid;
  tmpsolskin = solskin;
  
#hitinn = laganofn(hitinn);
#hitinn$High = tmphitinn$High;  hitinn$Low = tmphitinn$Low;
  
  regnid = laganofn(regnid);
  regnid$Days = tmpregnid$Days;  regnid$mm = tmpregnid$mm;
  
  solskin = laganofn(solskin);
  solskin$Hours = tmpsolskin$Hours;
  
  llp = latlongpop()
  
  
  url = "http://www.numbeo.com/cost-of-living/region_rankings_current.jsp?region=150"
  tabs <- getURL(url, .opts=curlOptions(followlocation = TRUE))
  tabs <- readHTMLTable(tabs, stringsAsFactors = F)
  typeof(tabs$t2)
  nyrkostnadur = index_to_num(data.frame(tabs$t2))
  
  
  
  url = "https://www.numbeo.com/quality-of-life/region_rankings_current.jsp?region=150"
  tabs <- getURL(url, .opts=curlOptions(followlocation = TRUE))
  tabs <- readHTMLTable(tabs, stringsAsFactors = F)
  typeof(tabs$t2)
  lifsgaedi = data.frame(tabs$t2)
  lifsgaedi = index_to_num(lifsgaedi)
  lifsgaedi[["Property.Price.to.Income.Ratio"]] = as.numeric(lifsgaedi[["Property.Price.to.Income.Ratio"]]);
  
 
  url = "https://www.numbeo.com/property-investment/region_rankings_current.jsp?region=150"
  tabs <- getURL(url, .opts=curlOptions(followlocation = TRUE))
  tabs <- readHTMLTable(tabs, stringsAsFactors = F)
  ibudir = data.frame(tabs$t2)
}



############### Núverandi fikt ########################

# dagsljos hefur verið hlaðið inn í hitinn
dump("hitinn", "hitinndata.Rdmpd")
temphitinn = hitinn # geymi í bili
remove(hitinn)
source("hitinndata.Rdmpd")
# lol nice

# fall sem tekur inn 2 breytur og skilar nýjum "dálki" þar sem gildið fyrir sérhverja borg er margfeldi breytanna
# í UIinu höfum við input fyrir breytur úr töflunum 3
# segjum að við séum að fara að finna Health.Care.Index*Purchasing.Power.Index
# höfum viðfang sem er tvíundaaðgerð, +, *, /, -
# og 2 breytur,       út kemur data frame með "pörum" borgarnafn,kúplaðarbreytur

# virki er "*", "/", "+", "-" eða annað tvíundafall
kuplabreytur = function(virki, breyta1, breyta2)
{
  # Finna hvaða töflum breyta1 og breyta 2 tilheyra
  # 2 tilfelli,  þær eru úr sama data frame eða mismunandi
  if()
    # sama
    dalkur1 = rettdf[[breyta1]]
  dalkur2 = rettdf[[breyta2]]
  # checka hvort þeir séu ekki í samsvarandi röð fyrst
  # ef svo er, þá
  # finna leið til að meta virkja
  virkinn = match.fun(virki)
  #1*5 = 5, 5/1 = 5, 1+5 = 6, 5-1 = 4
  if(virkinn(2,7)==14){
    return(dalkur1*dalkur2)  
  }
  else if(virkinn(50,2)==25){
    return(dalkur1/dalkur2)
  }
  else if(virkinn(12,55)==67){
    return(dalkur1+dalkur2)
  }
  else if(virkinn(55,12)=43){
    return(dalkur1-dalkur2)
  }else{
    # sennilega er virki einhver annar tvíundavirki
    #elementwise virki(dalkur1,dalkur2)
  }
  
  
  # annars þarf að finna sniðmengi borganna í sitt hvorum
  
  df1 = #data frame samsvarandi breytu1;
    df2 = #data frame samsvarandi breytu2;
    df1 = df1[df1$City %in% df2$City,] #right? checka á fallinu sem ég hef skrifað yes
  df2 = df2[df2$City %in% df1$City,]
  df2$City == df1$City  # checkum
  result = data.frame(df1$City, samsvarandi df1$breyta1, samsvarandi df2$breyta2)
  
}


runApp("gagnvirkni")



# Uppfærð útgáfa af kostnaðargögnunum! :D
teiknakostnad(nyrkostnadur,"Cost.of.Living.Index")
teiknakostnad(nyrkostnadur,"Local.Purchasing.Power.Index")
#dagsljosmeðaltal
teiknakostnad(kostnadur,"Local.Purchasing.Power.Index")
kostkost(nyrkostnadur,"Local.Purchasing.Power.Index", "Cost.of.Living.Index",125,187)

teiknakostnad(lifsgaedi,"Quality.of.Life.Index")






# vil bæta í solskin nýjum dálki og á viðeigandi staði í þennan dálk (þar sem gildin í hinum dálkunum uppfylla tiltekin skilyrði) bæta meðaldagsljósinu í þeim mánuði
hitinn$dagsljos = rep(0,nrow(hitinn))
dagarimanudi = c(31,28,31,30,31,30,31,31,30,31,30,31)
hitinncopy = hitinn  # til að prófa geymi ég hitinn hér í millitíðinni
# ATH það eru færri borgir í sólargögnunum! bæti þessu frekar inn í hitinn  ATH

# endurnefni Andorra la vella, Copenhagen, Nizhny And Novgorod, Rostov-on-Don og Saint Petersburg   í hitinn.
hitinn[ grepl("Copenhagen",hitinn$City),]$City = "Kobenhavn, Denmark";
hitinn[ grepl("Andorra",hitinn$City),]$City = "Andorra, Andorra";
hitinn[ grepl("Nizhny",hitinn$City),]$City = "Nizhny Novgorod, Russia";
hitinn[ grepl("Petersburg",hitinn$City),]$City = "St. Petersburg, Russia";
# eyði út Rostov-on-Don röðunum!
View(hitinn[ -grepl("Rostov",hitinn$City),])
hitinn = subset(hitinn,!grepl("Rostov",hitinn$City))
# **** Einhverjar mínustölur, þetta er eitthvað buggy
# solarlengd("Reykjavik", "2016/06/20") = -2.13
# fix'd

# vil safna þessu öllu í data frame til að geta t.d. debunkað staðhæfingu Davíðs Oddssonar um að það sé í heildina mest dagsljós á Íslandi
# geri data frame sem er 365 raðir og length(llp$city_ascii) = 67 dálkar, fyrir hverja borg
dagarimanudi = c(31,28,31,30,31,30,31,31,30,31,30,31)
dagsljosid = data.frame(matrix(nrow=365,ncol=67))
dalknumer = 1 # dálkarnir heita X1, X2, ... ,X67
dagarkomnir = 0 # heldur utan um í hvaða röð er komið af þessum 365

for(j in 1:12)     
{ # búið er að bæta meðaldagsljósi fyrir fyrstu j mánuðina fyrir borgirnar í hitinn$dagsljos
  
    for(i in llp$city_ascii)
    { # búið er að bæta meðaldagsljósi fyrir fyrstu j mánuðina í borgunum fram að i í hitinn$dagsljos
      # Reykjavík, Kaupmannahöfn, St. Petersborg, og fleiri eru rangt nefndar, þurfum að take care of that 
      print(i)
      print(month.name[j])
      
      # Komið er að borg i, þá skal endurnefna dálkinn og hlaða svo inn í hann 
      if(dalknumer <68)
      {
      colnames(dagsljosid)[dalknumer] = i
      inc(dalknumer)
      }
      
      dagsljos = double()
      for(k in 1:dagarimanudi[j])
      {  
        # dagljos inniheldur dagsljos fyrir borg i fyrir fyrstu k dagana í mánuði j
        
        if(k < 10)
        { # þarf að bæta við staf fyrir daginn
          dagur = paste(0,k,sep="")
          if(j < 10)
          {
            dagsljos = append(dagsljos,solarlengd(i,paste("2016/",paste(0,j,sep=""),"/",dagur,sep="")))
          }else
          {
            dagsljos = append(dagsljos,solarlengd(i,paste("2016/",as.character(j),"/",dagur,sep="")))  
          }
          
        }else
        { # þarf ekki að bæta við staf fyrir daginn
          if(j <10)
          {  # þarf að bæta við staf fyrir mánuðin
            dagsljos = append(dagsljos, solarlengd(i,paste("2016/",paste(0,j,sep=""),"/",as.character(k),sep="")))            
          }else
          {
          dagsljos = append(dagsljos, solarlengd(i,paste("2016/",as.character(j),"/",as.character(k),sep="")))
          }
        }

    
          
          
      }

# bæti dagsljos, sem er tilsvarandi mánuður, inn í dagsljosid
      # hleð inn dögunum í hverjum mánuði í tilsvarandi dálk,  svo þegar mánuðirnir líða þá fyllist allt
      
      dagsljosid[i][dagarkomnir+1:dagarimanudi[j],1] = dagsljos 
     
     print(dagsljos)
     print(mean(dagsljos)) # þetta fer á viðeigandi stað í hitinn$dagsljos
      # viðeigandi gæti verið  hitinn$Months == month.name[j] og i er substring í hitinn$City 
    #    j; i;
      hitinn[grepl(i,hitinn$City) & hitinn$manudir==month.name[j],]$dagsljos <- mean(dagsljos)
      
  #hitinn[grepl("Reykjavik",hitinn$City),] #gefur Reykjavik í öllum mánuðum
    
    #  hitinn[grepl("Reykjavik",hitinn$City) & hitinn$manudir==month.name[2],]$dagsljos <- mean(dagsljos)
      
    }
  dagarkomnir = dagarkomnir + dagarimanudi[j]
  
# vantar árið
}



heildarsol = 1:ncol(dagsljosid);

for(k in 1:ncol(dagsljosid))
{
  heildarsol[k] = sum(dagsljosid[k])
}

sol_a_ari = data.frame(City = llp$city, total.daylight = heildarsol, daylight.per.day = heildarsol/365)
arrange(sol_a_ari,-total.sun)
# listi af borgum yfir í sól og hita fyrir borgirnar eða nálægar borgir (alhæfa yfir í hvaðeina)
#næ í tilsvarandi raðir með %in% og/eða grepl substring fyrir borgina (annars landið) í dataframeið
#sæki svo $Hours/31 og $High og $Low


listiborga = c("Barcelona, Spain",
               "Madrid, Spain",
               "Palma, Spain",
               "Bilbao, Spain",
               "Alicante, Spain",
               "Gran Canaria, Spain",
               "Tenerife, Spain",
               "Milan, Italy",
               "Rome, Italy",
               "Turin, Italy",
               "Verona, Italy",
               "Venice, Italy",
               "Florence, Italy",
               "Naples, Italy",
               "Porto, Portugal",
               "Lisbon, Portugal",
               "Faro, Portugal",
               "Athens, Greece",
               "Crete, Greece",
               "Larnaca, Cyprus",
               "Istanbul, Turkey",
               "Antalya, Turkey")

sologhiti = listi_i_vedur(listiborga, "January")








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



a = 1; b = 30;
# Þarf að eyða út landsheitinu
df = kostnadur; 
df = df[a:b,]; # HMMMM
# Raða eftir cost of living

# tek frá a til b
df$City = gsub(",.*$","",df$City);


# TEIKNA TIL AÐ SJÁ MYNSTUR
ggplot(kostnadur,aes_string(x="Cost.of.Living.Index", y = "Local.Purchasing.Power.Index")) + geom_point()  + xlab("Cost of Living Index") + ylab("Local Purchasing Power Index") + ggtitle("Cost of Living Comparison") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));
ggplot(kostnadur,aes_string(x="Rent.Index", y = "Groceries.Index")) + geom_point()  + xlab("Rent Index") + ylab("Groceries Index") + ggtitle("Cost of Living Comparison") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5));


# geri linear model til að finna stuðlana til að teikna línu
lingaedi = lm(Temp ~ solar.R, data = lifsgaedi)
ggplot(lifsgaedi,aes_string(x="Cost.of.Living.Index", y = "Pollution.Index")) + geom_point()  + xlab("Cost of Living Index") + ylab("Pollution Index") + ggtitle("Pollution vs Prices") +  guides(fill=F) + theme(plot.title = element_text(hjust = 0.5)) + geom_smooth(method='lm')
teiknadagsljos(lifsgaedi,"Property.Price.to.Income.Ratio","")
teiknadagsljos(hitinn,"Low","January")


kostkost(kostnadur,"Rent.Index", "Groceries.Index", 80,117)

#þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið

# þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið þarf að bæta við virkni þar sem maður highlightar punkt og sér nafnið




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
  nyrkostnadur = nyrkostnadur[nyrkostnadur$City %in% hitinn$City,];
  nyrkostnadur$City = factor(nyrkostnadur$City, levels = nyrkostnadur$City[order(nyrkostnadur$Local.Purchasing.Power.Index)]); # svo fari í röð 
  ggplot(nyrkostnadur, aes(reorder(City, Cost.of.Living.Index),Cost.of.Living.Index )) + theme_bw() + geom_bar(stat="identity") + theme(axis.text.x = element_text(angle = 60, hjust = 1)) + ggtitle(paste("Cost of Living"));  
  
  
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


# fikt:
if(1)
{
  
  # http://simplemaps.com/resources/world-cities-data
  worldcities = read.csv("world_cities.csv", TRUE)
  # er með lista af "Reykjavik, Iceland", "Athens, Greece", o.s.frv.
  # og lista af borgarnöfnum "Reykjavik", "Athens", "Zaranj"
  # vil geyma þær raðir í worldcities með borgarheiti sem koma fyrir á undan kommunni í hitinn
  
  # gæti renameað veður dataframe þannig að bara borgarheitið er eftir, og gert svo %in%. Prófum það
  # breyti bara tmphitinn 
  # http://stackoverflow.com/questions/31925811/extract-first-word-from-a-column-and-insert-into-new-column
  tmphitinn = laganofn(tmphitinn);
  # eyði út öllu sem kemur á eftir kommu!
  # sbr. sologverd$City = gsub(",.*$", "", sologverd$City)
  # nafnafixB = borgir, nafnafixL = lönd
  nafnafixB = 
    data.frame(lapply(tmphitinn, 
                      function(x){
                        sub(",.*$","",x)
                      }
    )
    )
  nafnafixB = nafnafixB[nafnafixB$manudir == "December",] # fækka endurtekningum
  eurocities = worldcities[worldcities$city %in% nafnafixB$City,]
  
  # sumar borgir eins og Reykjavík eru með local stöfum svo það vantar eitthvað. hvað eru þær margar?
  nrow(eurocities) #70
  nrow(nafnafixB)
  
  # annars vegar duplicates (London, UK og London, Kentucky og London, Canada) 
  #   lagfæri það með augunum. Eyði öllu frá USA, Venezuela og Canada
  
  #það sem ég vil eyða:
  euroeyda = subset(eurocities, eurocities$iso2 == "US" | eurocities$iso2 == "VE" | eurocities$iso2 == "CA" )
  eyda = as.numeric(rownames(euroeyda))
  eurocities = eurocities[-eyda,]  # virkar ekki því indexið er frá fyrsta að síðasta, ekki gamla indexið
  
  
  
  worldcities[eyda,]
  worldcities[worldcities$city %in% eurocities$city,]
  subset(worldcities, worldcities$city %in% eurocities$city & worldcities$city %!in% worldcities[eyda,]$city)
  # aþena dettur út
  
  nrow(subset(worldcities, worldcities$city %in% eurocities$city & worldcities$city %!in% worldcities[eyda,]$city)) # 53
  nrow(eurocities[eyda,]) #9
  
  nrow(subset(worldcities, worldcities$city %in% eurocities$city)) #70
  nrow(subset(eurocities, eurocities$city %!in% worldcities[eyda,])) # 53
  worldcities[eyda,]
  
  
  nrow(subset(worldcities, worldcities$city %in% eurocities$city & worldcities$city %in% worldcities[-eyda,]$city)) 
}
  
# lausn:
  
  # notaði ekki ascii nöfnin hér
if(0)
{
  # fjarlægi irrelevant borgir
  worldcities[worldcities$city %!in% eurocities$city,] = NA
  worldcities[eyda,] = NA
  worldcities[1323,] #tómt
  #þá þarf að fjarlægja allt sem er NA
  # http://stackoverflow.com/questions/4862178/remove-rows-with-nas-missing-values-in-data-frame
  
  worldcities[complete.cases(worldcities),]
  nrow(worldcities[complete.cases(worldcities),]) # :D
  eurocities = worldcities[complete.cases(worldcities),]
  
  
  # og hins vegar vantar Reykjavík og co...
  
  # checkum hvaða borgir það eru sem vanta
  nafnafix$City
  eurocities$city # allt eins nafns borgir
  sort(nafnafix$City)
  sort(eurocities$city)
  length(nafnafix$City); length(eurocities$city)
  # Andorra la vella, Copenhagen, Nizhny And Novgorod (Nizhny Novgorod), Reykjavik,  Rostov-on-Don, Saint Petersburg, Zürich
}

# !            city_ascii virkar betur

  # þetta er komið inn í latlongpop()
if(0)
{
  
  
  # prófa að ekki hafa strengi sem factors, því það er pointless right?  (???)
  options(stringsAsFactors = FALSE)
  worldcities = read.csv("world_cities.csv", TRUE)
  
  tmphitinn = laganofn(tmphitinn);
  nafnafixB = 
    data.frame(lapply(tmphitinn, 
                      function(x){
                        sub(",.*$","",x)
                      }
    )
    )
  nafnafixB = nafnafixB[nafnafixB$manudir == "December",] # fækka endurtekningum
  eurocities = worldcities[worldcities$city_ascii %in% nafnafixB$City,]
  nrow(eurocities) #71 en ekki 70, Zürich bætist við. hvers venga ekki reykjavik? 
    nafnafixB # ReykjavikIceland ??? Beitti laganofn tvisvar. fixd
    
  nrow(nafnafixB)
  eurocities
  sort(eurocities$city_ascii); sort(nafnafixB$City)
  
  
  
  # nú eru 72 í eurocities en 68 í nafnafixB  
    # hmm en usa draslið er ennþá þarna gaddemit 
  
  # vantar:  Andorra la vella, Nizhny And Novgorod, Rostov-on-Don og Saint Petersburg   (nöfn úr veðurgögnunum)   ( eða hvað)
  # ATHH copenhagen ascii er kobenhavn,  vantar hana líka
  
  
  # Eyði út og bæti svo við þessum 4 bara?
  typeof(worldcities)
  eyda
  # fjarlægi irrelevant borgir
  worldcities[worldcities$city_ascii %!in% eurocities$city_ascii,] = NA  # eurocities er ekki með kaupmannahöfn 
  worldcities[eyda,] = NA
  worldcities[1323,] #tómt
  #þá þarf að fjarlægja allt sem er NA
  # http://stackoverflow.com/questions/4862178/remove-rows-with-nas-missing-values-in-data-frame
  
  worldcities[complete.cases(worldcities),]
  nrow(worldcities[complete.cases(worldcities),]) # :D
  # kalla útkomuna eurocities2
  eurocities2 = worldcities[complete.cases(worldcities),] # núna eru 2 fleiri borgir en áður, zürich og reykjavik bættist við
  
  length(eurocities2$city_ascii); length(nafnafixB$City);   # vantar 5
  sort(eurocities2$city_ascii); sort(nafnafixB$City)
  
  # ok solid, vantar Andorra la vella, Copenhagen, Nizhny And Novgorod, Rostov-on-Don og Saint Petersburg 
  # finn þær í worldcities
  
  # Andorra,Andorra,42.50000144,1.516485961,38127,Andorra,AD,AND,
  # København,Kobenhavn,55.67856419,12.56348575,1085000,Denmark,DK,DNK,Hovedstaden
  # Nizhny Novgorod,Nizhny Novgorod,56.33300722,44.00009436,1246463,Russia,RU,RUS,Nizhegorod
            # Rostov,Rostov,57.18915651,39.40430253,33578,Russia,RU,RUS,Yaroslavl'  WRONG
            # sleppum bara rostov fuck that shit
  # St. Petersburg,St. Petersburg,59.93901451,30.31602006,4023106,Russia,RU,RUS,City of St. Petersburg
  
  
  # Note, þetta eru önnur nöfn en í veðurgögnunum.
  
  
  borgirsemvanta = list(c("St. Petersburg","St. Petersburg",59.93901451,30.31602006,4023106,"Russia","RU","RUS","City of St. Petersburg"), c("Nizhny Novgorod","Nizhny Novgorod",56.33300722,44.00009436,1246463,"Russia","RU","RUS","Nizhegorod")
                               ,c("København","Kobenhavn",55.67856419,12.56348575,1085000,"Denmark","DK","DNK","Hovedstaden"),c("Andorra","Andorra",42.50000144,1.516485961,38127,"Andorra","AD","AND", "Andorra"))
  
  for(i in 1:4)
  {
    eurocities2 = rbind(eurocities2, borgirsemvanta[[i]])
  }
  
  latlongpop = eurocities2
}

# ER NÚNA MEÐ POPULATION LÍKA BTW :)






# Fyrir Hjálmtý á morgun,  ef ekki næst að gera gagnvirkni sem hægt er að sýna, þá hafa tilbúnar myndir eins og þær á Facebook, auk mynda með verð á einum ás og veður á hinum
# þarf þá að alhæfa fallið þannig að cost of living index er ekki aðal viðfangið (samt default)
# og skrifa forritsbút hérna sem ég get keyrt fyrir hann:

# Highlighta Reykjavík í dæmunum!!!


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
  

