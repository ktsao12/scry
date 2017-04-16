//calendar for finding the day, may possibly cause problems with web application
import java.util.Calendar;

//mirror background image
PImage baseImage;

//non-interactable icons
PImage cloudy, partlyCloudy, storm, hail, rain, sunny, night, snow, wind, houseTemp;

//interactable icons
PImage languageIcon, unavailableArrowIcon, forwardArrowIcon, wifiIcon, backArrowIcon, 
  whiteCheckmarkIcon, datetimeIcon, blackCheckmarkIcon, passwordIcon, powerIcon, 
  leftArrowIcon, rightArrowIcon, lockIcon, gridIcon, guestIcon;

//primary app icons
PImage timerIcon, backgroundIcon, weatherIcon, calendarIcon, lightIcon, utilitiesIcon, settingsIcon;

//secondary app icons
PImage appstoreIcon, drawIcon, notesIcon, videosIcon, musicIcon, newsIcon, healthIcon;

//tertiary app icons
PImage tumblrIcon, instagramIcon, pinterestIcon, linkedinIcon, twitterIcon, googleplusIcon, facebookIcon;

//app screen images
PImage leftScreenArrow, fullScreenArrow, rightScreenArrow, keyboard;
PImage waterUtility, heatUtility, electricUtility, utilitiesFullScreen;
PImage weightScreen, sleepScreen, stepsScreen, healthFullScreen;
PImage calendarBig, calendarSmall, weatherBig, weatherSmall;
PImage settingsScreen, settingsWifiScreen, settingsWifiChosenScreen;
PImage settingsDateScreen, settingsDateChosenScreen, settingsLangScreen, settingsLangChosenScreen;
PImage lightScreen, purpleLightOn, redLightOn, whiteLightOn, blueLightOn, yellowLightOn;
PImage musicScreenBig, musicScreenPlay, musicScreenStop, musicScreenScrollPlay, musicScreenScrollStop;
PImage videoScreenBig, videoScreenPlay, videoScreenStop, videoScreenScrollPlay, videoScreenScrollStop;
PImage drawScreen, eraseScreen;
PImage appStoreScreen;
boolean drawnArea[][];

PFont font;

String monthString[] = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
String weather = "";
String zip = "60607";
String woeid = "12784261";

int temp = 0;
int code = 3200;
int mirrorMode = 5; 

//just to check bottom side of window, comment out after use
//int centerX = 0, centerY = 0, offsetX = 0, offsetY = 0;

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
  //**The following retreives weather data from 
  //**Yahoo using yahoo xml files through the 
  //**url. Also, retreives temp, and forecast
  //**description and initializes images for
  //**forecast.
  //*********************************************

  //THE FOLLOWING HAS BEEN COMMENTED OUT BECAUSE IT 
  //DOES NOT ALLOW THE MIRROR TO SHOW UP ONLINE

  //retreives yahoo url, loads weather data into xml file
  /*String url = "http://query.yahooapis.com/v1/public/yql?format=xml&q=select+*+from+weather.forecast+where+woeid=" + woeid + "+and+u='F'";
   XML xml = loadXML(url);
   //XML forecast = xml.getChild("results/channel/item/yweather:forecast");
   XML forecast2 = xml.getChild("results/channel/item/yweather:condition");
   
   //retreive temperature/forecast description/forecast code
   temp = forecast2.getInt("temp");
   weather = forecast2.getString("text");
   code = forecast2.getInt("code");
   */


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

  //The following implements the interactable icons
  languageIcon = loadImage("languageIcon.png");
  languageIcon.loadPixels();

  unavailableArrowIcon = loadImage("unavailableArrowIcon.png");
  unavailableArrowIcon.loadPixels();

  forwardArrowIcon = loadImage("forwardArrowIcon.png");
  forwardArrowIcon.loadPixels();

  wifiIcon = loadImage("wifiIcon.png");
  wifiIcon.loadPixels();

  backArrowIcon = loadImage("backArrowIcon.png");
  backArrowIcon.loadPixels();

  whiteCheckmarkIcon = loadImage("whiteCheckmarkIcon.png");
  whiteCheckmarkIcon.loadPixels();

  datetimeIcon = loadImage("datetimeIcon.png");
  datetimeIcon.loadPixels();

  blackCheckmarkIcon = loadImage("blackCheckmarkIcon.png");
  blackCheckmarkIcon.loadPixels();

  passwordIcon = loadImage("passwordIcon.png");
  passwordIcon.loadPixels();

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

  guestIcon = loadImage("guestIcon.png");
  guestIcon.loadPixels();

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

  leftScreenArrow = loadImage("leftScreenArrow.png") ;
  leftScreenArrow.loadPixels();

  fullScreenArrow = loadImage("fullScreenArrows.png") ;
  fullScreenArrow.loadPixels();

  rightScreenArrow = loadImage("rightScreenArrow.png") ;
  rightScreenArrow.loadPixels();

  utilitiesFullScreen = loadImage("utilitiesFullScreen.png") ;
  utilitiesFullScreen.loadPixels();

  waterUtility = loadImage("waterUtility.png") ;
  waterUtility.loadPixels();

  heatUtility = loadImage("heatUtility.png") ;
  heatUtility.loadPixels();

  electricUtility = loadImage("electricUtility.png") ;
  electricUtility.loadPixels();

  drawScreen = loadImage("draw.png") ;
  drawScreen.loadPixels();

  eraseScreen = loadImage("erase.png") ;
  eraseScreen.loadPixels();

  calendarBig = loadImage("calendarBig.png") ;
  calendarBig.loadPixels();

  calendarSmall = loadImage("calendarSmall.png") ;
  calendarSmall.loadPixels();

  lightScreen = loadImage("lightScreen.png") ;
  lightScreen.loadPixels();

  musicScreenBig = loadImage("musicScreenBig.png") ;
  musicScreenBig.loadPixels();

  musicScreenPlay = loadImage("musicScreenPlay.png") ;
  musicScreenPlay.loadPixels();

  musicScreenStop = loadImage("musicScreenStop.png") ;
  musicScreenStop.loadPixels();

  musicScreenScrollPlay = loadImage("musicScreenScrollPlay.png") ;
  musicScreenScrollPlay.loadPixels();

  musicScreenScrollStop = loadImage("musicScreenScrollStop.png") ;
  musicScreenScrollStop.loadPixels();

  whiteLightOn = loadImage("whiteLight.png") ;
  whiteLightOn.loadPixels();

  redLightOn = loadImage("redLight.png") ;
  redLightOn.loadPixels();

  blueLightOn = loadImage("blueLight.png") ;
  blueLightOn.loadPixels();

  yellowLightOn = loadImage("yellowLight.png") ;
  yellowLightOn.loadPixels();

  purpleLightOn = loadImage("purpleLight.png") ;
  purpleLightOn.loadPixels();

  weatherBig = loadImage("weatherScreenBig.png") ;
  weatherBig.loadPixels();

  weatherSmall = loadImage("weatherScreenSmall.png") ;
  weatherSmall.loadPixels();

  settingsScreen = loadImage("settingsScreen.png") ;
  settingsScreen.loadPixels();

  keyboard = loadImage("keyboardScreen.png");
  keyboard.loadPixels();

  healthFullScreen = loadImage("healthScreenBig.png") ;
  healthFullScreen.loadPixels();

  weightScreen = loadImage("weightScreen.png") ;
  weightScreen.loadPixels();

  sleepScreen = loadImage("sleepScreen.png") ;
  sleepScreen.loadPixels();

  stepsScreen = loadImage("stepsScreen.png") ;
  stepsScreen.loadPixels();

  appStoreScreen = loadImage("appStore.png") ;
  appStoreScreen.loadPixels();
  
  settingsWifiScreen = loadImage("settingsWifi.png") ;
  settingsWifiScreen.loadPixels();
  
  settingsWifiScreen = loadImage("settingsWifi.png") ;
  settingsWifiScreen.loadPixels();
  
  settingsWifiChosenScreen = loadImage("settingsWifiChosen.png") ;
  settingsWifiChosenScreen.loadPixels();
  
  settingsDateScreen = loadImage("settingsDateTime.png") ;
  settingsDateScreen.loadPixels();
  
  settingsDateChosenScreen = loadImage("settingsDateTimeChosen.png") ;
  settingsDateChosenScreen.loadPixels();
  
  settingsLangScreen = loadImage("settingsLanguage.png") ;
  settingsLangScreen.loadPixels();
  
  settingsLangChosenScreen = loadImage("settingsLanguageChosen.png") ;
  settingsLangChosenScreen.loadPixels();
  
  videoScreenBig = loadImage("videoScreenBig.png") ;
  videoScreenBig.loadPixels();

  videoScreenPlay = loadImage("videoPlay.png") ;
  videoScreenPlay.loadPixels();

  videoScreenStop = loadImage("videoStop.png") ;
  videoScreenStop.loadPixels();

  videoScreenScrollPlay = loadImage("videoScrollPlay.png") ;
  videoScreenScrollPlay.loadPixels();

  videoScreenScrollStop = loadImage("videoScrollStop.png") ;
  videoScreenScrollStop.loadPixels();

  drawnArea = new boolean[2732][1536];
}

//draw elements for language choosing screen
void drawLanguageScreen()
{
  image(languageIcon, 600, 200);
  textFont(font, 108);
  text("Choose your Language", 840, 315);

  //first column of languages in order: English, Spanish, Japanese
  textFont(font, 72);
  text("English", 615, 600);
  text("Español", 600, 800);
  text("日本語", 615, 1000);

  //second column of languages in order: Chinese, Arabic, Portuguese
  text("繁體中文", 1200, 600);
  text("العربية", 1275, 800);
  text("Português", 1175, 1000);

  //third column of languages in order: French, Russian, German
  text("Français", 1825, 600);
  text("Русский язык", 1750, 800);
  text("Deutsche", 1815, 1000);
}

//draw elements for wi-fi network choosing screen
void drawWifiScreen()
{
  image(wifiIcon, 600, 200);
  textFont(font, 108);
  text("Connect to Wi-fi Network", 840, 330);

  textFont(font, 72);
  text("Looking for Networks...", 640, 430);

  //top bar
  fill(255, 255, 255);
  ellipse(600, 460, 50, 50);
  ellipse(2025, 460, 50, 50);
  rect(600, 435, 1425, 50);

  //wifi networks
  text("PotatoWifi", 700, 550);
  text("CatWifi", 700, 650);
  image(lockIcon, 1850, 500, 75, 75);
  image(lockIcon, 1850, 600, 75, 75);

  image(keyboard, 0, 0);

  //scroll bar
  rect(1990, 510, 50, 130); 
  ellipse(2015, 510, 50, 50);
  ellipse(2015, 640, 50, 50);

  //scroll circle
  fill(190, 190, 190);
  ellipse(2015, 570, 50, 50);

  //bottom bar
  fill(255, 255, 255);
  ellipse(600, 700, 50, 50);
  ellipse(2025, 700, 50, 50);
  rect(600, 675, 1425, 50); 

  text("Show Password?", 1500, 800);

  image(backArrowIcon, 575, 850);
  text("Skip this step.", 1100, 950);
  image(unavailableArrowIcon, 1850, 850);
}

//draw elements for date and time setting screen
void drawDateAndTimeScreen()
{
  image(datetimeIcon, 600, 200);

  textFont(font, 108);
  text("Choose Date and Time", 840, 300);

  textFont(font, 72);
  text("Date: mm/dd/yy", 600, 500);
  text("Time: 00:00", 600, 650);
  text("OR", 1250, 750);

  textFont(font, 108);
  text("AM", 1600, 650);
  text("PM", 1850, 650);

  fill(255, 128);
  rect(650, 780, 75, 75, 30);
  fill(255, 255, 255);

  textFont(font, 72);
  text("Turn On Location Services for Date/Time", 750, 850);

  image(backArrowIcon, 600, 900);
  image(unavailableArrowIcon, 1900, 900);
}

//draw elements for password selecting screen
void drawPasswordScreen()
{
  image(passwordIcon, 600, 200);

  textFont(font, 108);
  text("Choose your Password", 840, 325);

  textFont(font, 72);
  text("Invent a swipe pattern to lock and access your account. Simply drag", 300, 500);
  text("your finger across the mirror to create your swipe password.", 400, 600);

  text("Choose Your Swipe", 425, 750);
  text("Confirm Your Swipe", 1700, 750);

  fill(255, 255, 255);

  //first grid of circles, choose swipe
  ellipse(1325, 700, 50, 50);
  ellipse(1325, 1350, 50, 50);
  rect(1300, 700, 50, 650); 
  ellipse(450, 900, 75, 75);
  ellipse(750, 900, 75, 75);
  ellipse(1025, 900, 75, 75);

  ellipse(450, 1050, 75, 75);
  ellipse(750, 1050, 75, 75);
  ellipse(1025, 1050, 75, 75);

  ellipse(450, 1200, 75, 75);
  ellipse(750, 1200, 75, 75);
  ellipse(1025, 1200, 75, 75);

  //second grid of circles, confirm swipe
  ellipse(1725, 900, 75, 75);
  ellipse(2025, 900, 75, 75);
  ellipse(2300, 900, 75, 75);

  ellipse(1725, 1050, 75, 75);
  ellipse(2025, 1050, 75, 75);
  ellipse(2300, 1050, 75, 75);

  ellipse(1725, 1200, 75, 75);
  ellipse(2025, 1200, 75, 75);
  ellipse(2300, 1200, 75, 75);

  image(backArrowIcon, 675, 1275);
  image(unavailableArrowIcon, 1925, 1275);
}

//The following implements the time, date, and greeting
void displayTime()
{
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
  //String greet = "";

  //logic of am, pm
  if (hr >= 12)
    am = "PM";
  else
    am = "AM";

  if (min < 10)
    b = "0";
  else
    b = "";

  if (sec < 10)
    b1 = "0";
  else
    b1 = "";

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

  if (hour() > 12)
    hr -= 12;
  else
    hr = hour();

  if ( hr < 10)
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
}

//The following implements the weather including temperature, description, and picture  
void displayWeather()
{
  //display temp and description
  textFont(font, 50);
  text(temp + "°F", 72, 250);
  text(weather, 200, 250);

  //display pictures
  if (code == 3 || code == 4 || code == 37 || code == 38 || code == 39 || code == 45 || code == 47)
  {
    //all codes for storms to display picture
    storm.resize(188, 188);
    image(storm, 66, 50);
  } else if (code == 5 || code == 6 || code == 8 || code == 9 || code == 10 || code == 11 || code == 12  || code == 35 || code == 40)
  {
    //all codes to display rainy weather
    rain.resize(188, 188);
    image(rain, 66, 50);
  } else if (code == 7 || code == 13 || code == 14 || code == 15 || code == 16 || code == 19 || code == 25 || code == 41 || code ==42 || code == 43 || code == 46)
  {
    //all codes to display snowy weather
    snow.resize(188, 188);
    image(snow, 66, 50);
  } else if (code == 20 || code == 21 || code == 22 || code == 23 || code == 26 || code == 27 || code == 28)
  {
    //all codes to display cloudy weather
    cloudy.resize(188, 188);
    image(cloudy, 66, 50);
  } else if (code == 17 || code == 18)
  {
    //all codes to display haily/sleet weather
    hail.resize(188, 188);
    image(hail, 66, 50);
  } else if (code == 29 || code == 30 || code == 44)
  {
    //all codes to display partly cloudy weather
    partlyCloudy.resize(188, 188);
    image(partlyCloudy, 66, 50);
  } else if (code == 24)
  {
    //codes to display windy weather
    wind.resize(188, 188);
    image(wind, 66, 50);
  } else if (code == 32 || code == 34 || code == 36)
  {
    //code to display sunny/ hot weather
    sunny.resize(188, 188);
    image(sunny, 66, 50);
  } else if (code == 31 || code == 33)
  {
    //code to display night time weather
    night.resize(188, 188);
    image(night, 66, 50);
  } else
    text("N/A", 66, 50);
}

//draw top half of interface for guest and user screen
void drawTopInterface()
{
  //displayTime();
  //displayWeather();
}

//language screen variables
int[][] languageScreenButtons = {{585, 510, 300, 150}, {580, 710, 300, 150}, 
  {575, 910, 300, 150}, {1195, 510, 300, 150}, {1195, 710, 300, 150}, 
  {1170, 910, 335, 150}, {1810, 510, 300, 150}, {1750, 710, 450, 150}, 
  {1800, 910, 335, 150}, {1250, 1150, 200, 200}};
int languageButtonPressed = 0;
boolean languageSelected = false;

//wi-fi network screen variables
int[][] wifiNetworkScreenButtons = {{700, 490, 1250, 100}, {700, 595, 1250, 80}, 
  {1500, 745, 560, 60}, {575, 850, 200, 200}, {1100, 890, 450, 75}, {1850, 850, 200, 200}};
int wifiNetworkButtonPressed = 0;
boolean wifiNetworkSelected = false;
int wifiNetworkChecked = 0;

//date and time screen variables
int[][] dateAndTimeScreenButtons = {{1580, 550, 200, 125}, {1830, 550, 200, 125}, 
  {650, 780, 75, 75}, {600, 900, 200, 200}, {1900, 900, 200, 200}};
int dateAndTimeButtonPressed = 0;
boolean locationServices = false;

//app screen variables
int[][] appScreenButtons = {{300, 1290, 200, 200}, 
  {550, 1275, 200, 200}, 
  {750, 1275, 200, 200}, 
  {950, 1275, 200, 200}, 
  {1150, 1275, 200, 200}, 
  {1350, 1275, 200, 200}, 
  {1550, 1275, 200, 200}, 
  {1750, 1275, 200, 200}, 
  {2000, 1275, 200, 200}};

int appPage = 1;
boolean appOneSelected = false;
boolean appTwoSelected = false;
boolean appThreeSelected = false;
boolean appFourSelected = false;
boolean appFiveSelected = false;
boolean appSixSelected = false;
boolean appSevenSelected = false;

boolean leftScreen = false;
boolean fullScreen = true;
boolean rightScreen = false;

void draw()
{
  //just to check bottom side of window, comment out after use
  /*if (mousePressed == true) {
   centerX = mouseX-offsetX;
   centerY = mouseY-offsetY;
   }   
   translate(centerX,centerY);*/

  //Draw the mirror base Image
  noStroke();
  baseImage.resize(2732, 1536);
  image(baseImage, 0, 0);

  if (mirrorMode == 0)
  {
    //language screen
    drawLanguageScreen();

    if (languageSelected)
      image(forwardArrowIcon, 1250, 1150);
    else
      image(unavailableArrowIcon, 1250, 1150);

    switch(languageButtonPressed)
    {
    case 1:
      //English
      fill(255, 128);
      rect(585, 510, 300, 150, 30);
      fill(255, 255);
      break;
    case 2:
      //Spanish
      fill(255, 128);
      rect(580, 710, 300, 150, 30);
      fill(255, 255);
      break;
    case 3:
      //Japanese
      fill(255, 128);
      rect(575, 910, 300, 150, 30);
      fill(255, 255);
      break;
    case 4:
      //Chinese
      fill(255, 128);
      rect(1195, 510, 300, 150, 30);
      fill(255, 255);
      break;
    case 5:
      //Arabic
      fill(255, 128);
      rect(1195, 710, 300, 150, 30);
      fill(255, 255);
      break;
    case 6:
      //Portuguese
      fill(255, 128);
      rect(1170, 910, 335, 150, 30);
      fill(255, 255);
      break;
    case 7:
      //French
      fill(255, 128);
      rect(1810, 510, 300, 150, 30);
      fill(255, 255);
      break;
    case 8:
      //Russian
      fill(255, 128);
      rect(1750, 710, 450, 150, 30);
      fill(255, 255);
      break;
    case 9:
      //German
      fill(255, 128);
      rect(1800, 910, 335, 150, 30);
      fill(255, 255);
      break;
    case 10:
      //Forward Arrow
      mirrorMode++;
      languageButtonPressed = 0;
      break;
    }
  } else if (mirrorMode == 1)
  {
    //wi-fi network screen
    drawWifiScreen();

    if (wifiNetworkSelected)
    {
      //Potato wifi
      if (wifiNetworkChecked == 1)
        image(whiteCheckmarkIcon, 615, 500);

      //Cat wifi  
      if (wifiNetworkChecked == 2)
        image(whiteCheckmarkIcon, 615, 595);

      text("Password: ", 575, 800);
      image(forwardArrowIcon, 1850, 850);
    }

    switch(wifiNetworkButtonPressed)
    {
    case 3:
      //show password
      break;
    case 4:
      //back arrow
      mirrorMode--;
      wifiNetworkButtonPressed = 0;
      break;
    case 5:
      //skip this step
      mirrorMode++;
      wifiNetworkButtonPressed = 0;
      break;
    case 6:
      //unavailable/forward arrow
      if (wifiNetworkSelected)
      {
        mirrorMode++;
        wifiNetworkButtonPressed = 0;
      }
      break;
    }

    //need keyboard
  } else if (mirrorMode == 2)
  {
    //date and time screen
    drawDateAndTimeScreen();

    if (locationServices == true)
      image(forwardArrowIcon, 1900, 900); 

    switch(dateAndTimeButtonPressed)
    {
    case 1:
      //AM
      fill(255, 128);
      rect(1580, 550, 200, 125, 30);
      fill(255, 255);
      break;
    case 2:
      //PM
      fill(255, 128);
      rect(1830, 550, 200, 125, 30);
      fill(255, 255);
      break;
    case 3:
      //checkmarkBox
      if (locationServices == true)
        image(blackCheckmarkIcon, 650, 790);
      break;
    case 4:
      //back arrow
      mirrorMode--;
      dateAndTimeButtonPressed = 0;
      break;
    case 5:
      //forwardArrow
      //need some sort of check for arrow to be available
      if (locationServices == true)
      {
        mirrorMode++;
        dateAndTimeButtonPressed = 0;
      }
      break;
    }

    //need numpad
  } else if (mirrorMode == 3)
  {
    //password screen
    drawPasswordScreen();
  } else if (mirrorMode == 4)
  {
    //guest screen
    drawTopInterface();
    image(powerIcon, 50, 1275);
    image(guestIcon, 2425, 1250);
  } else if (mirrorMode == 5)
  {
    //user screen 
    drawTopInterface();

    //The following Implements the interactable icons and icon bar
    image(powerIcon, 50, 1275);
    image(lockIcon, 2275, 1290);
    image(gridIcon, 2475, 1275);

    /*draw the selected app, if one is selected */
    //if the first (leftmost) app is selected
    if (appOneSelected) {
      ellipse(635, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawTimer();
      } else if (appPage == 2) {
        drawAppStore();
      } else if (appPage == 3) {
        drawTumblr();
      }
    } 
    //if the second app is selected
    else if (appTwoSelected) {
      ellipse(835, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawBackground();
      } else if (appPage == 2) {
        drawDrawMode();
      } else if (appPage == 3) {
        drawInstagram();
      }
    } 
    //if the third app is selected
    else if (appThreeSelected) {
      ellipse(1035, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawWeather();
      } else if (appPage == 2) {
        drawNotes();
      } else if (appPage == 3) {
        drawPinterest();
      }
    } 
    //if the fourth app is selected    
    else if (appFourSelected) {
      ellipse(1235, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawCalendar();
      } else if (appPage == 2) {
        drawVideo();
      } else if (appPage == 3) {
        drawLinkedin();
      }
    } 
    //if the fifth app is selected    
    else if (appFiveSelected) {
      ellipse(1435, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawLight();
      } else if (appPage == 2) {
        drawMusic();
      } else if (appPage == 3) {
        drawTwitter();
      }
    } 
    //if the sixth app is selected    
    else if (appSixSelected) {
      ellipse(1635, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawUtilities();
      } else if (appPage == 2) {
        drawNews();
      } else if (appPage == 3) {
        drawGoogleplus();
      }
    } 
    //if the seventh (rightmost) app is selected    
    else if (appSevenSelected) {
      ellipse(1835, 1355, 200, 200);
      fill(255, 255);

      //draw the app for the correct page
      if (appPage == 1) {
        drawSettings();
      } else if (appPage == 2) {
        drawHealth();
      } else if (appPage == 3) {
        drawFacebook();
      }
    }

    //primary app icon set
    if (appPage == 1) {
      image(leftArrowIcon, 300, 1290);
      image(timerIcon, 550, 1275);
      image(backgroundIcon, 750, 1275);
      image(weatherIcon, 950, 1275);
      image(calendarIcon, 1150, 1275);
      image(lightIcon, 1350, 1275);
      image(utilitiesIcon, 1550, 1275);
      image(settingsIcon, 1750, 1275);
    }
    //secondary icon set
    else if (appPage == 2) {
      image(leftArrowIcon, 300, 1290);
      image(appstoreIcon, 550, 1275);
      image(drawIcon, 750, 1275);
      image(notesIcon, 950, 1275);
      image(videosIcon, 1150, 1275);
      image(musicIcon, 1350, 1275);
      image(newsIcon, 1550, 1275);
      image(healthIcon, 1750, 1275);
      image(rightArrowIcon, 2000, 1290);
    }
    //tertiary icon set
    else if (appPage == 3) {
      image(tumblrIcon, 550, 1275);
      image(instagramIcon, 750, 1275);
      image(pinterestIcon, 950, 1275);
      image(linkedinIcon, 1150, 1275);
      image(twitterIcon, 1350, 1275);
      image(googleplusIcon, 1550, 1275);
      image(facebookIcon, 1750, 1275);
      image(rightArrowIcon, 2000, 1290);
    }
  }

  //Draw light around mirror
  if (whiteLight) {
    image(whiteLightOn, 0, 0);
  } else if (redLight) {
    image(redLightOn, 0, 0);
  } else if (blueLight) {
    image(blueLightOn, 0, 0);
  } else if (yellowLight) {
    image(yellowLightOn, 0, 0);
  } else if (purpleLight) {
    image(purpleLightOn, 0, 0);
  }
}

//lazy variabe to skip full screen 
boolean previousSettingLeft = false; 
//choosing settings options
boolean wifiChosen = false, dateTimeChosen = false, languageChosen = false;

void drawSettings() {

  //draw settings on the left
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);
    previousSettingLeft = true;
    
    if(wifiChosen){
      image(settingsWifiScreen, 40, 340);
    }
    else if(dateTimeChosen){
      image(settingsDateScreen, 40, 340);
    }
    else if(languageChosen){
      image(settingsLangScreen, 40, 340);
    }
    else{
      image(settingsScreen, 40, 340);
    }
  } 
  //no full screen mode, switch to eithe left or right
  else if (fullScreen) {
    if (!previousSettingLeft) {
      previousSettingLeft = true;
      fullScreen = false;
      leftScreen = true;
    } else {
      previousSettingLeft = false;
      fullScreen = false;
      rightScreen = true;
    }
  } 
  //draw settings on the right
  else if (rightScreen) {
    image(rightScreenArrow, 500, 340);
    
    if(wifiChosen){
      image(settingsWifiScreen, 2140, 340);
    }
    else if(dateTimeChosen){
      image(settingsDateScreen, 2140, 340);
    }
    else if(languageChosen){
      image(settingsLangScreen, 2140, 340);
    }
    else{
      image(settingsScreen, 2140, 340);
    }
  }
}

boolean waterChosen = true;
boolean heatChosen = false;
boolean electricChosen = false;

void drawUtilities() {

  //left minimized screen
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);

    //utility to be shown
    if (waterChosen) {
      image(waterUtility, 40, 390);
    } else if (heatChosen) {
      image(heatUtility, 40, 390);
    } else if (electricChosen) {
      image(electricUtility, 40, 390);
    }
  }
  //full screen mode
  else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(utilitiesFullScreen, 500, 340);
  }
  //right minimized screen
  else if (rightScreen) {
    image(rightScreenArrow, 500, 340);

    //utility to be shown
    if (waterChosen) {
      image(waterUtility, 2140, 390);
    } else if (heatChosen) {
      image(heatUtility, 2140, 390);
    } else if (electricChosen) {
      image(electricUtility, 2140, 390);
    }
  }
}

boolean purpleLight = false, yellowLight = false, blueLight = false, redLight = false, whiteLight = false;

void drawLight() {
  //choose light color 
  if (whiteLight) {
    rect(1530, 1070, 130, 130);
    fill(255, 255, 102);
  } else if (redLight) {
    rect(1390, 1070, 130, 130);
    fill(0);
  } else if (blueLight) {
    rect(1250, 1070, 130, 130);
    fill(255, 51, 51);
  } else if (yellowLight) {
    rect(1100, 1070, 130, 130);
    fill(102, 255, 102);
  } else if (purpleLight) {
    rect(960, 1070, 130, 130);
    fill(0, 128, 255);
  } 

  image(lightScreen, 500, 340);
  fill(255);
}

void drawCalendar() {
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);
    image(calendarSmall, 40, 340);
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(calendarBig, 500, 340);
  } else if (rightScreen) {
    image(rightScreenArrow, 500, 340);
    image(calendarSmall, 2140, 340);
  }
}

void drawWeather() {
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);
    image(weatherSmall, 40, 340);
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(weatherBig, 500, 340);
  } else if (rightScreen) {
    image(rightScreenArrow, 500, 340);
    image(weatherSmall, 2110, 340);
  }
}

void drawBackground() {
}

void drawTimer() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

boolean weightChosen = true;
boolean sleepChosen = false;
boolean stepsChosen = false;

void drawHealth() {
  //left minimized screen
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);

    //utility to be shown
    if (weightChosen) {
      image(weightScreen, 40, 340);
    } else if (sleepChosen) {
      image(sleepScreen, 40, 340);
    } else if (stepsChosen) {
      image(stepsScreen, 40, 340);
    }
  }
  //full screen mode
  else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(healthFullScreen, 500, 340);
  }
  //right minimized screen
  else if (rightScreen) {
    image(rightScreenArrow, 500, 340);

    //utility to be shown
    if (weightChosen) {
      image(weightScreen, 2140, 340);
    } else if (sleepChosen) {
      image(sleepScreen, 2140, 340);
    } else if (stepsChosen) {
      image(stepsScreen, 2140, 340);
    }
  }
}

void drawNews() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

boolean stop = true, play = false, scroll = false;

void drawMusic() {
  /*Left Small Music Screen Functions */
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);

    //display stopped screen
    if (stop) {
      //choose the scrolled stopped screen
      if (scroll) { 
        image(musicScreenScrollStop, 40, 340);
      }
      //choose the un-scrolled stopped screen
      else {
        image(musicScreenStop, 40, 340);
      }
    }
    //if the user chose play
    else if (play) {
      //choose the scrolled play screen
      if (scroll) {
        image(musicScreenScrollPlay, 40, 340);
      }
      //choose the un-scrolled play screen
      else {
        image(musicScreenPlay, 40, 340);
      }
    }
  }
  //show the full-screen image of music (it is non-functional)
  else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(musicScreenBig, 500, 340);
  } 
  //choose the right screen small version of music
  else if (rightScreen) {
    image(rightScreenArrow, 500, 340);

    //choose the stopped screen
    if (stop) {
      //choose the scrolled stopped screen
      if (scroll) {
        image(musicScreenScrollStop, 2140, 340);
      }
      //choose the un-scrolled stopped screen
      else {
        image(musicScreenStop, 2140, 340);
      }
    }
    //choose the play screen
    else if (play) {
      //choose the scrolled play screen
      if (scroll) {
        image(musicScreenScrollPlay, 2140, 340);
      }
      //choose the un-scrolled play screen
      else {
        image(musicScreenPlay, 2140, 340);
      }
    }
  }
}

void drawVideo() {
  /*Left Small Video Screen Functions */
  if (leftScreen) {
    image(leftScreenArrow, 500, 340);

    //display stopped screen
    if (stop) {
      //choose the scrolled stopped screen
      if (scroll) { 
        image(videoScreenScrollStop, 40, 340);
      }
      //choose the un-scrolled stopped screen
      else {
        image(videoScreenStop, 40, 340);
      }
    }
    //if the user chose play
    else if (play) {
      //choose the scrolled play screen
      if (scroll) {
        image(videoScreenScrollPlay, 40, 340);
      }
      //choose the un-scrolled play screen
      else {
        image(videoScreenPlay, 40, 340);
      }
    }
  }
  //show the full-screen image of video (it is non-functional)
  else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
    image(videoScreenBig, 500, 340);
  } 
  //choose the right screen small version of video
  else if (rightScreen) {
    image(rightScreenArrow, 500, 340);

    //choose the stopped screen
    if (stop) {
      //choose the scrolled stopped screen
      if (scroll) {
        image(videoScreenScrollStop, 2140, 340);
      }
      //choose the un-scrolled stopped screen
      else {
        image(videoScreenStop, 2140, 340);
      }
    }
    //choose the play screen
    else if (play) {
      //choose the scrolled play screen
      if (scroll) {
        image(videoScreenScrollPlay, 2140, 340);
      }
      //choose the un-scrolled play screen
      else {
        image(videoScreenPlay, 2140, 340);
      }
    }
  }
}

void drawNotes() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

//Draw buttons
boolean drawMode = true, eraseMode = false;
boolean blackPaint = true, redPaint = false, greenPaint = false, bluePaint = false, yellowPaint = false;

void drawDrawMode() {
  //if mode is set to draw
  if (drawMode) {
    //choose brush color to draw with
    if (blackPaint) {
      rect(1390, 1070, 130, 130);
      fill(0);
    } else if (redPaint) {
      rect(1250, 1070, 130, 130);
      fill(255, 51, 51);
    } else if (greenPaint) {
      rect(1100, 1070, 130, 130);
      fill(102, 255, 102);
    } else if (bluePaint) {
      rect(960, 1070, 130, 130);
      fill(0, 128, 255);
    } else if (yellowPaint) {
      rect(820, 1070, 130, 130);
      fill(255, 255, 102);
    }

    //color the mirror in all the drawn areas
    for (int i = 0; i < 2732; i++) {
      for (int j = 0; j < 1536; j++) {
        if (drawnArea[i][j]) {
          ellipse(i, j, 40, 40);
        }
      }
    }
    //draw button chosen image
    image(drawScreen, 500, 340);
  } else if (eraseMode) {
    //erase all the areas drawn
    for (int i = 0; i < 2732; i++) {
      for (int j = 0; j < 1536; j++) {
        drawnArea[i][j] = false;
      }
    }

    //eraser button chosen image
    image(eraseScreen, 500, 340);
  }

  //make fill color white again
  fill(255);
}

void drawAppStore() {

  image(appStoreScreen, 500, 340);
}

void drawFacebook() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawGoogleplus() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawTwitter() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawLinkedin() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawPinterest() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawInstagram() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

void drawTumblr() {
  if (leftScreen) {
  } else if (fullScreen) {
    image(fullScreenArrow, 500, 340);
  } else if (rightScreen) {
  }
}

//To change which utility to display
void chooseUtilities() {
  if (leftScreen)
  {
    //if water is chosen
    if ((mouseX > 40) && (mouseX < 200)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = true;
      heatChosen = false;
      electricChosen = false;
    } 
    //if heat is chosen
    else if ((mouseX > 200) && (mouseX < 380)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = false;
      heatChosen = true;
      electricChosen = false;
    }
    //if electricity is chosen
    else if ((mouseX > 385) && (mouseX < 550)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = false;
      heatChosen = false;
      electricChosen = true;
    }
  } else if (rightScreen)
  {
    //if water is chosen
    if ((mouseX > 2130) && (mouseX < 2290)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = true;
      heatChosen = false;
      electricChosen = false;
    }
    //if heat is chosen
    else if ((mouseX > 2290) && (mouseX < 2470)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = false;
      heatChosen = true;
      electricChosen = false;
    } 
    //if electricity is chosen
    else if ((mouseX > 2475) && (mouseX < 2640)
      && (mouseY > 1050) && (mouseY < 1190)) {
      waterChosen = false;
      heatChosen = false;
      electricChosen = true;
    }
  }
}

//To change which health info to show
void chooseHealthDisplay() {
  if (leftScreen)
  {
    //if weight is chosen
    if ((mouseX > 40) && (mouseX < 200)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = true;
      sleepChosen = false;
      stepsChosen = false;
    } 
    //if sleep is chosen
    else if ((mouseX > 200) && (mouseX < 380)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = false;
      sleepChosen = true;
      stepsChosen = false;
    }
    //if steps is chosen
    else if ((mouseX > 385) && (mouseX < 550)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = false;
      sleepChosen = false;
      stepsChosen = true;
    }
  } else if (rightScreen)
  {
    //if weight is chosen
    if ((mouseX > 2130) && (mouseX < 2290)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = true;
      sleepChosen = false;
      stepsChosen = false;
    }
    //if sleep is chosen
    else if ((mouseX > 2290) && (mouseX < 2470)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = false;
      sleepChosen = true;
      stepsChosen = false;
    } 
    //if steps is chosen
    else if ((mouseX > 2475) && (mouseX < 2640)
      && (mouseY > 1050) && (mouseY < 1190)) {
      weightChosen = false;
      sleepChosen = false;
      stepsChosen = true;
    }
  }
}

//Choose light colors
void chooseLightColor() {

  //if white light is chosen
  if ((mouseX > 1550) && (mouseX < 1700)
    && (mouseY > 1050) && (mouseY < 1190)) {
    //if chosen color was already on, turn it off
    if (!whiteLight)
      whiteLight = true;
    else
      whiteLight = false;

    redLight = false;
    blueLight = false;
    yellowLight = false;
    purpleLight = false;
  }
  //if red light is chosen
  else if ((mouseX > 1400) && (mouseX < 1550)
    && (mouseY > 1050) && (mouseY < 1190)) {
    //if chosen color was already on, turn it off
    if (!redLight)
      redLight = true;
    else
      redLight = false;

    whiteLight = false;
    blueLight = false;
    yellowLight = false;
    purpleLight = false;
  } 
  //if blue light is chosen
  else if ((mouseX > 1250) && (mouseX < 1400)
    && (mouseY > 1050) && (mouseY < 1190)) {
    //if chosen color was already on, turn it off
    if (!blueLight)
      blueLight = true;
    else
      blueLight = false;

    redLight = false;
    whiteLight = false;
    yellowLight = false;
    purpleLight = false;
  }
  //if yellow light is chosen
  else if ((mouseX > 1100) && (mouseX < 1250)
    && (mouseY > 1050) && (mouseY < 1190)) {
    //if chosen color was already on, turn it off
    if (!yellowLight)
      yellowLight = true;
    else
      yellowLight = false;

    redLight = false;
    blueLight = false;
    whiteLight = false;
    purpleLight = false;
  } 
  //if purple light is chosen
  else if ((mouseX > 960) && (mouseX < 1100)
    && (mouseY > 1050) && (mouseY < 1190)) {
    //if chosen color was already on, turn it off
    if (!purpleLight)
      purpleLight = true;
    else
      purpleLight = false;

    redLight = false;
    blueLight = false;
    yellowLight = false;
    whiteLight = false;
  }
}

void chooseDrawModeApp() {
  //choose draw mode
  if ((mouseX > 1600) && (mouseX < 1720)
    && (mouseY > 1050) && (mouseY < 1190)) {
    drawMode = true;
    eraseMode = false;
  }
  //choose eraser mode
  else if ((mouseX > 1720) && (mouseX < 1840)
    && (mouseY > 1050) && (mouseY < 1190)) {
    drawMode = false;
    eraseMode = true;
  } 
  /*Choose colors for draw */
  //if black is chosen
  else if ((mouseX > 1400) && (mouseX < 1650)
    && (mouseY > 1050) && (mouseY < 1190)) {
    blackPaint = true;
    redPaint = false;
    greenPaint = false;
    bluePaint = false;
    yellowPaint = false;
  } 
  //if red is chosen
  else if ((mouseX > 1250) && (mouseX < 1400)
    && (mouseY > 1050) && (mouseY < 1190)) {
    blackPaint = false;
    redPaint = true;
    greenPaint = false;
    bluePaint = false;
    yellowPaint = false;
  } else if ((mouseX > 1100) && (mouseX < 1250)
    && (mouseY > 1050) && (mouseY < 1190)) {
    blackPaint = false;
    redPaint = false;
    greenPaint = true;
    bluePaint = false;
    yellowPaint = false;
  } else if ((mouseX > 960) && (mouseX < 1100)
    && (mouseY > 1050) && (mouseY < 1190)) {
    blackPaint = false;
    redPaint = false;
    greenPaint = false;
    bluePaint = true;
    yellowPaint = false;
  } else if ((mouseX > 820) && (mouseX < 960)
    && (mouseY > 1050) && (mouseY < 1190)) {
    blackPaint = false;
    redPaint = false;
    greenPaint = false;
    bluePaint = false;
    yellowPaint = true;
  }
}

void chooseMusicMode() {
  /* Left Screen */
  //change music to play
  if ((mouseX > 200) && (mouseX < 270)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = true;
    stop = false;
  }
  //change music to stop
  else if ((mouseX > 350) && (mouseX < 420)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = false;
    stop = true;
  } 
  //see if user scrolled
  //scrolled up
  if ((mouseX > 480) && (mouseX < 520)
    && (mouseY > 770) && (mouseY < 820)) {
    scroll = false;
  }
  //scrolled down
  else if ((mouseX > 480) && (mouseX < 520)
    && (mouseY > 1000) && (mouseY < 1060)) {
    scroll = true;
  }

  /* Right Screen */
  //change music to play
  if ((mouseX > 2280) && (mouseX < 2340)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = true;
    stop = false;
  }
  //change music to stop
  else if ((mouseX > 2450) && (mouseX < 2510)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = false;
    stop = true;
  } 
  //see if user scrolled
  //scrolled up
  if ((mouseX > 2530) && (mouseX < 2700)
    && (mouseY > 770) && (mouseY < 820)) {
    scroll = false;
  }
  //scrolled down
  else if ((mouseX > 2530) && (mouseX < 2700)
    && (mouseY > 1000) && (mouseY < 1060)) {
    scroll = true;
  }
}

void chooseVideoMode() {
  /* Left Screen */
  //change video to play
  if ((mouseX > 200) && (mouseX < 270)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = true;
    stop = false;
  }
  //change video to stop
  else if ((mouseX > 350) && (mouseX < 420)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = false;
    stop = true;
  } 
  //see if user scrolled
  //scrolled up
  if ((mouseX > 480) && (mouseX < 520)
    && (mouseY > 830) && (mouseY < 890)) {
    scroll = false;
  }
  //scrolled down
  else if ((mouseX > 480) && (mouseX < 520)
    && (mouseY > 1000) && (mouseY < 1060)) {
    scroll = true;
  }

  /* Right Screen */
  //change video to play
  if ((mouseX > 2280) && (mouseX < 2340)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = true;
    stop = false;
  }
  //change video to stop
  else if ((mouseX > 2450) && (mouseX < 2510)
    && (mouseY > 1050) && (mouseY < 1140)) {
    play = false;
    stop = true;
  } 
  //see if user scrolled
  //scrolled up
  if ((mouseX > 2530) && (mouseX < 2700)
    && (mouseY > 830) && (mouseY < 890)) {
    scroll = false;
  }
  //scrolled down
  else if ((mouseX > 2530) && (mouseX < 2700)
    && (mouseY > 1000) && (mouseY < 1060)) {
    scroll = true;
  }
}

void unselectApps() {
  appOneSelected = false;
  appTwoSelected = false;
  appThreeSelected = false;
  appFourSelected = false;
  appFiveSelected = false;
  appSixSelected = false;
  appSevenSelected = false;
}

/*Choose Settings Diplay*/
void chooseSettingsDisplay() {

  if (leftScreen) {
    if ((mouseX > 40) && (mouseX < 550)
      && (mouseY > 470) && (mouseY < 550)) {
      wifiChosen = true;
      dateTimeChosen = false;
      languageChosen = false;
    }
    //if user chosen date/time
    else if ((mouseX > 40) && (mouseX < 550)
      && (mouseY > 550) && (mouseY < 650)) {
      wifiChosen = false;
      dateTimeChosen = true;
      languageChosen = false;
    } 
    //if user chose language
    else if ((mouseX > 40) && (mouseX < 550)
      && (mouseY > 650) && (mouseY < 730)) {
      wifiChosen = false;
      dateTimeChosen = false;
      languageChosen = true;
    }
  } 
  //if settings on the right
  else if (rightScreen) {
    //if user chose wifi
    if ((mouseX > 2130) && (mouseX < 2640)
      && (mouseY > 470) && (mouseY < 550)) {
      wifiChosen = true;
      dateTimeChosen = false;
      languageChosen = false;
    }
    //if user chosen date/time
    else if ((mouseX > 2130) && (mouseX < 2640)
      && (mouseY > 550) && (mouseY < 650)) {
      wifiChosen = false;
      dateTimeChosen = true;
      languageChosen = false;
    } 
    //if user chose language
    else if ((mouseX > 2130) && (mouseX < 2640)
      && (mouseY > 650) && (mouseY < 730)) {
      wifiChosen = false;
      dateTimeChosen = false;
      languageChosen = true;
    }
  }
}


void mouseReleased()
{
  if (mirrorMode == 0)
  {
    for (int i=0; i < languageScreenButtons.length; i++) {
      if ((mouseX > languageScreenButtons[i][0]) && (mouseX < languageScreenButtons[i][0]+languageScreenButtons[i][2])
        && (mouseY > languageScreenButtons[i][1]) && (mouseY < languageScreenButtons[i][1]+languageScreenButtons[i][3]))
      {
        if ((i+1) <= 9)
          languageSelected = true;       
        languageButtonPressed = i+1;
      }
    }
  }

  if (mirrorMode == 1)
  {
    for (int i=0; i < wifiNetworkScreenButtons.length; i++) {
      if ((mouseX > wifiNetworkScreenButtons[i][0]) && (mouseX < wifiNetworkScreenButtons[i][0]+wifiNetworkScreenButtons[i][2])
        && (mouseY > wifiNetworkScreenButtons[i][1]) && (mouseY < wifiNetworkScreenButtons[i][1]+wifiNetworkScreenButtons[i][3]))
      {
        if ((i+1) <= 2)
        {
          if ((i+1) == 1)
            wifiNetworkChecked = 1;

          if ((i+1) == 2)
            wifiNetworkChecked = 2;

          wifiNetworkSelected = true;
        }

        wifiNetworkButtonPressed = i+1;
      }
    }
  }

  if (mirrorMode == 2)
  {
    for (int i=0; i < dateAndTimeScreenButtons.length; i++) {
      if ((mouseX > dateAndTimeScreenButtons[i][0]) && (mouseX < dateAndTimeScreenButtons[i][0]+dateAndTimeScreenButtons[i][2])
        && (mouseY > dateAndTimeScreenButtons[i][1]) && (mouseY < dateAndTimeScreenButtons[i][1]+dateAndTimeScreenButtons[i][3]))
      {
        if ((i+1) == 3)
        {
          if (locationServices == true)
            locationServices = false;
          else if (locationServices == false)
            locationServices = true;
        }

        dateAndTimeButtonPressed = i+1;
      }
    }
  }

  if (mirrorMode == 5) {

    /* Code to resize screen */
    //resize full screen to the left
    if (fullScreen && (mouseX > 520) && (mouseX < 570)
      && (mouseY > 340) && (mouseY < 1200))
    {
      leftScreen = true;
      fullScreen = false;
    }
    //resize full screen to the right
    else if (fullScreen && (mouseX > 2070) && (mouseX < 2120)
      && (mouseY > 340) && (mouseY < 1200))
    {
      rightScreen = true;
      fullScreen = false;
    }
    //resize left screen to full
    else if (leftScreen &&(mouseX > 520) && (mouseX < 570)
      && (mouseY > 340) && (mouseY < 1200))
    {
      leftScreen = false;
      fullScreen = true;
    }
    //resize right screen to full
    else if (rightScreen && (mouseX > 2070) && (mouseX < 2120)
      && (mouseY > 340) && (mouseY < 1200))
    {
      rightScreen = false;
      fullScreen = true;
    }

    /* Choose utilities for minimized screen */
    chooseUtilities();

    /* Draw App Buttons */
    chooseDrawModeApp();

    /*Choose Light Colors*/
    chooseLightColor();

    /*Choose Music Modes */
    chooseMusicMode();
    
    /*Choose Music Modes */
    chooseVideoMode();

    /*Choose Health App Display */
    chooseHealthDisplay();

    /*Choose Settings Display */
    chooseSettingsDisplay();

    //Select Apps
    for (int i=0; i < appScreenButtons.length; i++) {
      if ((mouseX > appScreenButtons[i][0]) && (mouseX < appScreenButtons[i][0]+appScreenButtons[i][2])
        && (mouseY > appScreenButtons[i][1]) && (mouseY < appScreenButtons[i][1]+appScreenButtons[i][3]))
      {
        //left arrow button
        if (i==0 && appPage < 3) {
          //go to next page
          appPage++;
          unselectApps();
        }
        //first app
        else if (i == 1) {
          //save state for selected app
          boolean appSelected = appOneSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appOneSelected = true;
        }
        //second app
        else if (i == 2) {
          //save state for selected app
          boolean appSelected = appTwoSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appTwoSelected = true;
        }
        //third app
        else if (i == 3) {
          //save state for selected app
          boolean appSelected = appThreeSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appThreeSelected = true;
        }
        //fourth app
        else if (i == 4) {
          //save state for selected app
          boolean appSelected = appFourSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appFourSelected = true;
        }
        //fifth app
        else if (i == 5) {
          //save state for selected app
          boolean appSelected = appFiveSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appFiveSelected = true;
        }
        //sixth app
        else if (i == 6) {
          //save state for selected app
          boolean appSelected = appSixSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appSixSelected = true;
        }
        //seventh app
        else if (i == 7) {
          //save state for selected app
          boolean appSelected = appSevenSelected;

          //unselect any app that may be open
          unselectApps();

          if (!appSelected)
            appSevenSelected = true;
        }
        //right arrow button
        else if (i == 8 && appPage > 1) {
          //go to previous page
          appPage--;
          unselectApps();
        }
      }
    }
  }
}

void mouseDragged() {

  //draw when mouse dragged and draw app on
  if (appTwoSelected && appPage == 2 && drawMode) {
    drawnArea[mouseX][mouseY] = true;
  }
}

//just to check bottom side of window, comment out after use
/*void mousePressed(){
 offsetX = mouseX-centerX;
 offsetY = mouseY-centerY;
 }*/