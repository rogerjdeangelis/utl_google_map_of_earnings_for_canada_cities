Google map of earnings for canada cities

  INPUT
  =====
   SD1.HAVE total obs=4

    Obs    city           lat         lon      earning

     1     Victoria     48.4073    -123.330    48.4073
     2     Saskatoon    52.1470    -106.647    52.1470
     3     StThomas     42.7788     -81.175    42.7788
     4     Quebec       46.8033     -71.243    46.8033

   WORKING CODE
   ============
   IML/R

     map <- map<-get_map(location="canada",zoom=3, maptype = "roadmap",
       source="google",color="color");
     mapPoints <- ggmap(map) +
       geom_point(aes(y = lat, x = lon, size = earning), data = df, alpha = .5 ,color="darkred") +
       scale_size(range=c(3,20)) +
       geom_text(aes(label = city),vjust = 0,hjust = 0,data=df);
     png("d:/png/canada.png",width=1080,height=640,units ="px" );

    OUTPUT
    ======
      see for google roadmap (satelite and terrain maps available)



                           ******
                        **     **
                      **       *
                ******         ***
              *                    ****
             *                         *
         *****                          *
        *                               *
        *                                **
        *              _                     ****
        *             (_) Saskatoon               ****
        *                                             *
        *    _                             _        *
         *  (_) Victoria           Quebec (_)    *
          *                                       *
           ************************        *******
                                   *      *
                                     ****


github
https://github.com/rogerjdeangelis/utl_google_map_of_earnings_for_canada_cities

see
https://goo.gl/D3QyMv
https://communities.sas.com/t5/SAS-GRAPH-and-ODS-Graphics/GMAPs-With-Canada-City-Information/m-p/411239/highlight/true#M14100


 *                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

options validvarname=v7;
libname sd1 "d:/sd1";
data sd1.have;
informat city $32.;
input city $ lat lon;
  earning=abs(lat);
cards4;
Victoria 48.4073 -123.330
Saskatoon 52.1470 -106.647
StThomas 42.7788 -81.175
Quebec 46.8033 -71.243
;;;;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

*works;
%utl_submit_r64('
 source("c:/Program Files/R/R-3.3.2/etc/Rprofile.site",echo=T);
 library(ggmap);
 library(haven);
 df <- read_sas("d:/sd1/have.sas7bdat");
 map <- map<-get_map(location="canada",zoom=3, maptype = "roadmap",
   source="google",color="color");
 mapPoints <- ggmap(map) +
   geom_point(aes(y = lat, x = lon, size = earning),
   data = df, alpha = .5 ,color="darkred") +
    scale_size(range=c(3,20)) +
    geom_text(aes(label = city),vjust = 0,hjust = 0,data=df);
 png("d:/png/canada.png",width=1080,height=640,units ="px" );
 mapPoints;
');


