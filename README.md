# SliderButton
For Development assignment, CS1300; instructions were to "develop a reusable, interactive widget."

### Authors
* Annalia Sunderland (asunderl)
* Kevin Cadena (kcaden20)

### How To Run Demo
1. Download zip
2. Open _SliderButton.xcodeproject_ in Xcode
3. Run on simulator (includes 2 demos to demonstrate how to use a _SliderButton_)

### How To Use In Own Project
1. Download zip
2. Simply include the contents of the SliderButton folder, mainly:
    * _SliderButton.h_
    * _SliderButton.m_
    * _UIColor+SliderButton.h_
    * _UIColor+SliderButton.m_

### Why a Sliding Button?
In a similar sense to how the click has become the domineering way that that we perform actions through the browser, tapping on buttons has become the go-to way perform actions through the smart phone. The issue is that while tapping buttons is the equivalent to clicking on the browser, the smartphone has the added capability of touch. So is tapping really the best way? Should our navigation on the smart phone be more gestural? Our _SliderButton_ widget seeks to offer an alternative way to navigate through the mobile realm. In our example, we use the sliding button widget as a different way of sending a message to someone by sliding up on the message to send. You could say, “Well what if someone accidentally slides up on the phone and accidentally sends something?” To reduce the chances of that happening, the user must press on the small tab (as opposed to the entire text box) and then swipe up for it to register as sending. The _SliderButton_ could also be used to confirm (e.g. holding on the nib on the left and swiping right) or cancel (e.g. holding on the nib on the right and swiping left). The _SliderButton_ could basically be used for anything a button could be used for: it replaces the button. 

### What is TextBubble?
It's another mini widget we used in the demos. As of now, not much thought went into _TextBubble_ as our main widget was _SliderButton_. It uses _UIColor+SliderButton_ instead of its own UIColor extension because the demo used those colors.

#### To Do
* landscape view
* more customizable colors and sizes
* cleanup cleanup everybody everywhere!