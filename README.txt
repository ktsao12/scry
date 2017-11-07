Kevin Tsao
Scry

Originally Project #2: Smart Mirror
for CS422: User Interfaces with Professor Andrew Johnson
User interface design, user experience, visual design, Processing
NOTE: The application has been hardcoded for a 2732 x 1536 resolution display, this was required as part of the presentation to play on the super high definition screen in the UIC Electronics Visualization Laboratory.

This was the final assignment for CS422: User Interfaces and a group project. The prompt was to design and then implement a functioning mockup of a "smart mirror" using some sort of theoretical projection device to produce a touchscreen display over a conventional bathroom mirror. My group partners were: Dania Azhari, Daia Elsalaymeh, and Nathan Tisdale-Dollah. The name of our design was Scry.

Our core design principle was to create a scrolling interface where only a minimal amount of icons were onscreen at any time in the form of a taskbar at the bottom of the screen, and the user can scroll in the left or right direction to scroll along the taskbar. Individual applications are represented by a circular icon, and the idea was to allow the user to decide placement of data on the screen and move windows to the side if need be.

The implemented features were as follows:
* Date/Time with clock features (timer, stopwatch, etc.)
* Utilities (water, electricity, heating)
* Calendar
* Backlight
* Weather
* Using the mirror as a screen to display an image or play a video
* Health tracker with certain metrics such as weight
* News feed with configurable API
* Music player (assume projector has speakers)
* Allow users to write and draw directly on mirror
* Various social media apps
* App store to download third-party apps

Our design was focused on minimalism, accessibility, and user customization. Prime mirror space was reserved for crucial information rather than cluttering up the screen with extraneous details, and text was kept to a minimum by having almost every object represented by a picture. 

I created the core design and came up with the functionality of most of the applications. Dania Azhari was responsible for the artistic direction and created most of the icons. Daia Elsalaymeh was responsible for programming the functionality of the applications. Nathan Tisdale-Dollah was responsible for programming the core code of the mirror in Processing.