import java.util.Calendar;

//just to check bottom side of window, comment out after use
//int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;

PImage baseImage;

//non-interactable icons
PImage cloudy;
PImage partlyCloudy;
PImage storm;
PImage hail;
PImage rain;
PImage sunny;
PImage night;
PImage snow;
PImage wind;
PImage houseTemp;

//interactable icons
PImage powerIcon;
PImage leftArrowIcon;
PImage rightArrowIcon;
PImage lockIcon;
PImage gridIcon;

//primary app icons
PImage timerIcon;
PImage backgroundIcon;
PImage weatherIcon;
PImage calendarIcon;
PImage lightIcon;
PImage utilitiesIcon;
PImage settingsIcon;

//secondary app icons
PImage appstoreIcon;
PImage drawIcon;
PImage notesIcon;
PImage videosIcon;
PImage musicIcon;
PImage newsIcon;
PImage healthIcon;

//tertiary app icons
PImage tumblrIcon;
PImage instagramIcon;
PImage pinterestIcon;
PImage linkedinIcon;
PImage twitterIcon;
PImage googleplusIcon;
PImage facebookIcon;

PFont font;

String monthString[] = {"January", "February", "March","April","May","June","July","August","September","October","November","December"};
String weather = "";
String zip = "60607";
String woeid = "12784261";

int temp = 0;
int code = 3200;

void setup()
{
  //just to check bottom side of window, comment out after use
  /*centerX = 0;
  centerY = 0;  
  cursor(HAND);
  smooth();*/
  
//*********************************************
//**Create size of canvas and load base image
//**Initialize Font - Avenir
//*********************************************
   size(2732, 1536);
   baseImage = loadImage("mirror.jpg");
   baseImage.loadPixels();
   
   font = createFont("Avenir", 32, true);
//*********************************************
//*********************************************


//*********************************************
//**The following retreives weather data from 
//**Yahoo using yahoo xml files through the 
//**url. Also, retreives temp, and forecast
//**description and initializes images for
//**forecast.
//*********************************************

  //retreives yahoo url, loads weather data into xml file
  String url = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select+*+from+weather.forecast+where+woeid=" + woeid + "+and+u='F'";
  XML xml = loadXML(url);
  //XML forecast = xml.getChild("results/channel/item/yweather:forecast");
  XML forecast2 = xml.getChild("results/channel/item/yweather:condition");
  
  //retreive temperature/forecast description/forecast code
  temp = forecast2.getInt("temp");
  weather = forecast2.getString("text");
  code = forecast2.getInt("code");
  
  //initialize images for forecast
  cloudy = loadImage("cloudy.png");
  cloudy.loadPixels();
  partlyCloudy = loadImage("partly-cloudy.png");
  partlyCloudy.loadPixels();
  storm = loadImage("storm.png");
  storm.loadPixels();
  hail = loadImage("hail.png");
  hail.loadPixels();
  rain = loadImage("rain4.png");
  rain.loadPixels();
  sunny = loadImage("sunny.png");
  sunny.loadPixels();
  night = loadImage("night.png");
  night.loadPixels();
  snow = loadImage("snow.png");
  snow.loadPixels();
  wind = loadImage("wind.png");
  wind.loadPixels();
//*********************************************
//*********************************************
  
  //House Temperature Icon
  houseTemp = loadImage("houseTempIcon.png");
  houseTemp.loadPixels();
  
//*************************************************
//**The following implements the interactable icons
//*************************************************
  powerIcon = loadImage("powerIcon.png");
  powerIcon.loadPixels();
  
  leftArrowIcon = loadImage("leftArrowIcon.png");
  leftArrowIcon.loadPixels();
  
  rightArrowIcon = loadImage("rightArrowIcon.png");
  rightArrowIcon.loadPixels();
  
  lockIcon = loadImage("lockIcon.png");
  lockIcon.loadPixels();
  
  gridIcon = loadImage("gridIcon.png");
  gridIcon.loadPixels();
  
  //primary app icons
  timerIcon = loadImage("timerIcon.png");
  timerIcon.loadPixels();
  
  backgroundIcon = loadImage("backgroundIcon.png");
  backgroundIcon.loadPixels();
  
  weatherIcon = loadImage("weatherIcon.png");
  weatherIcon.loadPixels();
  
  calendarIcon = loadImage("calendarIcon.png");
  calendarIcon.loadPixels();

  lightIcon = loadImage("lightIcon.png");
  lightIcon.loadPixels();

  utilitiesIcon = loadImage("utilitiesIcon.png");
  utilitiesIcon.loadPixels();

  settingsIcon = loadImage("settingsIcon.png");
  settingsIcon.loadPixels();
  
  //secondary app icons
  appstoreIcon = loadImage("appstoreIcon.png");
  appstoreIcon.loadPixels();
  
  drawIcon = loadImage("drawIcon.png");
  drawIcon.loadPixels();
  
  notesIcon = loadImage("notesIcon.png");
  notesIcon.loadPixels();
  
  videosIcon = loadImage("videosIcon.png");
  videosIcon.loadPixels();

  musicIcon = loadImage("musicIcon.png");
  musicIcon.loadPixels();

  newsIcon = loadImage("newsIcon.png");
  newsIcon.loadPixels();

  healthIcon = loadImage("healthIcon.png");
  healthIcon.loadPixels();
  
  //tertiary app icons
  tumblrIcon = loadImage("tumblrIcon.png");
  tumblrIcon.loadPixels();
  
  instagramIcon = loadImage("instagramIcon.png");
  instagramIcon.loadPixels();
  
  pinterestIcon = loadImage("pinterestIcon.png");
  pinterestIcon.loadPixels();
  
  linkedinIcon = loadImage("linkedinIcon.png");
  linkedinIcon.loadPixels();

  twitterIcon = loadImage("twitterIcon.png");
  twitterIcon.loadPixels();

  googleplusIcon = loadImage("googleplusIcon.png");
  googleplusIcon.loadPixels();

  facebookIcon = loadImage("facebookIcon.png");
  facebookIcon.loadPixels();  
}


void draw()
{
  //just to check bottom side of window, comment out after use
    /*if (mousePressed == true) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
    }   
    translate(centerX,centerY);*/

//*********************************
//**Draw the mirror base Image
//*********************************
  //background(0);
  noStroke();
  baseImage.resize(2732, 1536);
  image(baseImage, 0, 0);
//*********************************
//*********************************



//****************************************
//**The following implements the Time,
//**Date, and Greeting
//****************************************
  Calendar c;
  int dayName;
  c = Calendar.getInstance();
  dayName = c.get(Calendar.DAY_OF_WEEK);
  
  int mon = month()-1;
  mon = constrain(mon, 0, 11);
  
  int dy = day();
  int yer = year();
  int sec = second();
  int min = minute();
  int hr = hour();
  
  String am = "AM";
  String b = "";
  String b1 = "";
  String time = "";
  String curDate = "";
  String greet = "";
  
  //logic of am, pm
  if(hr >= 12)
  {
    am = "PM";
  }
  else
  {
    am = "AM";
  }
  
  if(min < 10)
  {
    b = "0";
  }
  else
  {
    b = "";
  }
  
  if(sec < 10)
  {
    b1 = "0";
  }
  else
  {
    b1 = "";
  }
  
  switch(dayName)
  {
    case 1:
      curDate = "Sunday,";
      break;
    case 2:
      curDate = "Monday,";
      break;
    case 3:
      curDate = "Tuesday,";
      break;
    case 4:
      curDate = "Wednesday,";
      break;
    case 5:
      curDate = "Thursday,";
      break;
    case 6:
      curDate = "Friday,";
      break;
    case 7:
      curDate = "Saturday,";
      break;
  }
  
  curDate = curDate + " " + monthString[mon] + " " + dy + " " + yer;
  
  if(hour() > 12)
  {
    hr -= 12;
  }
  else
  {
    hr = hour();
  }
  
  if( hr < 10)
    time = "0" + hr + ":" + b + min;
  else
    time = hr + ":" + b + min;
  
  /* logic for greeting
  if(hour() >= 0 && hour() <= 11)
  {
    greet = "Good Morning!";
  }
  else if (hour() >= 12 && hour() <= 18)
  {
    greet = "Good Afternoon!";
  }
  else if (hour() >=19 && hour() <= 23)
  {
    greet = "Good Evening!";
  }
  */
  
  //display time, date, greeting
  fill(255, 255, 255);
  image(houseTemp, 2425, 200);
  textFont(font, 70);
  text(time, 2320, 175);
  text(am, 2510, 175);
  textFont(font, 45);
  text("68°F", 2515, 255);
  textFont(font, 50);
  text(curDate, 2075, 90);
  //textFont(font, 50);
  //text(greet, 960, 68);
//****************************************
//****************************************



//**************************************************
//**The following Implements the weather including 
//**temperature, description, and picture
//**************************************************

  //display temp and description
  textFont(font, 50);
  text(temp + "°F", 72, 250);
  text(weather, 200, 250);
  
  //display pictures
  if(code == 3 || code == 4 || code == 37 || code == 38 || code == 39 || code == 45 || code == 47)
  {
    //all codes for storms to display picture
    storm.resize(188,188);
    image(storm, 66, 50);
  }
  else if(code == 5 || code == 6 || code == 8 || code == 9 || code == 10 || code == 11 || code == 12  || code == 35 || code == 40)
  {
    //all codes to display rainy weather
    rain.resize(188,188);
    image(rain, 66, 50);
  }
  else if(code == 7 || code == 13 || code == 14 || code == 15 || code == 16 || code == 19 || code == 25 || code == 41 || code ==42 || code == 43 || code == 46)
  {
    //all codes to display snowy weather
    snow.resize(188,188);
    image(snow, 66, 50);
  }
  else if(code == 20 || code == 21 || code == 22 || code == 23 || code == 26 || code == 27 || code == 28)
  {
    //all codes to display cloudy weather
    cloudy.resize(188,188);
    image(cloudy, 66, 50);
  }
  else if(code == 17 || code == 18)
  {
    //all codes to display haily/sleet weather
     hail.resize(188,188);
     image(hail, 66, 50);
  }
  else if(code == 29 || code == 30 || code == 44)
  {
    //all codes to display partly cloudy weather
    partlyCloudy.resize(188,188);
    image(partlyCloudy, 66, 50);
  }
  else if(code == 24)
  {
    //codes to display windy weather
    wind.resize(188,188);
    image(wind, 66, 50);
  }
  else if(code == 32 || code == 34 || code == 36)
  {
    //code to display sunny/ hot weather
    sunny.resize(188,188);
    image(sunny, 66, 50);
  }
  else if(code == 31 || code == 33)
  {
    //code to display night time weather
    night.resize(188,188);
    image(night, 66, 50);
  }
  else
  {
    //nada
    text("N/A", 66, 50);
  }
//**************************************************
//**************************************************

//**************************************************
//**The following Implements the interactable icons 
//** and icon bar
//**************************************************
  image(powerIcon, 50, 1275);
  image(lockIcon, 2275, 1290);
  image(gridIcon, 2475, 1275);
  
  //primary app icon set
  image(leftArrowIcon, 300, 1290);
  image(timerIcon, 550, 1275);
  image(backgroundIcon, 750, 1275);
  image(weatherIcon, 950, 1275);
  image(calendarIcon, 1150, 1275);
  image(lightIcon, 1350, 1275);
  image(utilitiesIcon, 1550, 1275);
  image(settingsIcon, 1750, 1275);
  
  //secondary icon set
  /*
  image(leftArrowIcon, 300, 1290);
  image(appstoreIcon, 550, 1275);
  image(drawIcon, 750, 1275);
  image(notesIcon, 950, 1275);
  image(videosIcon, 1150, 1275);
  image(musicIcon, 1350, 1275);
  image(newsIcon, 1550, 1275);
  image(healthIcon, 1750, 1275);
  image(rightArrowIcon, 2000, 1290);
  */
  
  //tertiary icon set
  /*
  image(tumblrIcon, 550, 1275);
  image(instagramIcon, 750, 1275);
  image(pinterestIcon, 950, 1275);
  image(linkedinIcon, 1150, 1275);
  image(twitterIcon, 1350, 1275);
  image(googleplusIcon, 1550, 1275);
  image(facebookIcon, 1750, 1275);
  image(rightArrowIcon, 2000, 1290);
  */
  
//**************************************************
//**************************************************

}

//just to check bottom side of window, comment out after use
/*
void mousePressed(){
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}*/