# Chamonix Hackathon 2015
The aim of our second hackathon in Chamonix will be to experiment with different ways to build mobile apps on iOS, Android, or other OSes.

The straightforward approach to building a mobile app is to use Objective C for iOS and Java for Android. These aren't always easy to learn when you're not familiar with the languages and the platforms, however. And there are alternatives available for developing, building and deploying mobile apps if you look around.  The following frameworks all allow developers to build apps in different languages to "the native ways", and there are others besides these:

* RubyMotion (http://www.rubymotion.com/)
* Ionic (http://ionicframework.com/)
* Meteor (https://www.meteor.com/)
* Titanium (http://www.appcelerator.org/#titanium)
* React Native (http://www.reactnative.com/)

Everyone who attends this weekend will pick the framework that interests them the most and work on that framework in teams to build a burger and beer app for Chamonix.

The premise for the app is both straightforward and open-ended.  We will provide some simple data that lists some of the bars in Chamonix, and some of the "happy hour" beer deals and the menu du jour (or other) burger deals that they run.  You cna then use this data to produce an interesting and fun app for the thirsty and hungry inhabitants of the Chamonix valley, all using the framework that you'd like to try out!

## The API

The following endpoint are browsable from the API:

```
/offers

/bars/:id

/days/:name
```
