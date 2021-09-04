+++ 
date = 2019-02-03T19:14:09+05:30
title = "Weekend with Flutter"
description = ""
slug = "weekend-with-flutter" 
tags = ["flutter", "development", "cards", "game"]
categories = ["Project", "Mobile App"]
externalLink = ""
series = []
+++


I built my first-ever mobile application as a weekend project.  
This post describes my experience, thoughts and emotions over the past few days.

------

# Motivation

Last week, my friends introduced me to a cards game called “350”. It involved bidding points, calling trumps, playing hands - so much fun! Now the only issue was that there was no simple way to store our points table. We found ourselves repeatedly checking the scores and wasting a lot of time talking about game information. I used Google Excel’s Android app as an ad-hoc way to track individual scores so as to reduce some friction. Excel sheet worked fine but it still could not display game related information in a consumable format.

The next morning I started to think there **must be a better way** to do this. After some online research, I discovered that no existing application/software for book-keeping specifically for this game. Thus, my decision to dedicate the weekend on developing a simple mobile app for this.

I was pretty excited about the project as this would be my first attempt at app development in around 4 years writing software. At the same time, it was a bit scary as I had no idea about the timeline and whether developing a MVP is even a practical expectation. However, being the optimist that I am, I decided to give it a go.

Breathe!

# Laying the Groundwork

## Desgining layouts

Kicking off the project, I started drawing basic layouts for the app screens on a piece of paper. My primary focus during this stage was to developing the bare minimum functionalities. With no idea of how to implement these layouts, I relied solely on my determination of getting them to work - after all it’s just UI!

![layouts](/images/posts/play350-layout.jpg) 

## Choosing Flutter

After building the screen layouts, I started looking for frameworks and tools which help build the actual app. I read about [Android Studio Code](https://developer.android.com/studio/), [React Native](https://facebook.github.io/react-native/) and [Flutter](https://flutter.dev/). With my focus on rapid development, flexible UI and personal productivity, I choose Flutter. In addition to sparing me from writing Java-XML and Javascript, Flutter provided me with the added benefit of building cross-platform native applications.

# Flutter 101

The major issue with Flutter was that the application code must be written in Dart. With a clock on my back, the last thing I wanted to do was spend time learning a new programming language. So, I decided to dive head first into building the app itself and learning Dart syntax on the go.

After setting my dev env, I completed the Google Codelabs to get a brief idea of how things worked in Flutter. I would highly recommend working out the Udacity Course on building Flutter apps as well. These resources taught me the following central concepts for building apps in Flutter:

1. **Stateless Widgets** : equivalent to static web pages like this blog post
2. **Stateful Widgets** : dynamic pages where contents change with user interactions
3. **State Management** : managing the data for Stateful Widgets
4. **Routes** : analogous to the URL for an application screen
5. **Navigation** : moving around the application screen via respective routes

My major takeaway from the exercises was: **“Everything in Flutter is a widget”**.

It took me around 6 hours to complete both the labs along with their quizzes.  
The decision to complete the sample project along in the codelabs paid rich dividends as I started developing my own app.

# Building screens

With my initial focus on emulating the layouts I had built into the app, I started off by implementing every screen as a Stateless Widget and fixing on the display layout with the help of *Hot Reload*.

```dart
// The Welcome Screen is the 1st page of the application.
// It is a StatelessWidget as the only possible option for the user is to tap a button 
// and navigate to a new screen.

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  // Implement methods for building the screen body layout
}
```

When I was fairly satisfied with the screen, I refactored the code to a *Stateful Widget* along with the relevant *State* data. Note: Each *Stateful Screen* is related to its corresponding *ScreenState class* which stores the state and screen layout instructions.

```dart
class GameBidderScreen extends StatefulWidget {
  // Data which is not modified for this particular screen
  final String boardID;
  final int gameID;
  final List<String> players;
  final List<List<int>> scoreboard;

  const GameBidderScreen(
      {this.boardID, this.gameID, this.players, this.scoreboard});

  @override
  State<GameBidderScreen> createState() => _GameBidderScreenState();
}

class _GameBidderScreenState extends State<GameBidderScreen> {
  // Data which populates the body and is modifiable.
  String bidder;
  int bid = 0;
  String trump;
  List<DropdownMenuItem> _playersItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  // Implement the layout builders
```

This process of continuous refactoring turned out to be rather simple and involved all of 10 LoC.

- How to decide whether a screen should be a *Stateless Widget* or a *Stateful Widget*?
    - If any user interactions (tap, long press, drag) change **this** screen’s content, use, then the screen can be a Stateless Widget.
    - Note this conditional holds, even if some actions prompt navigation to another new screen entirely.

- What data should be stored as the screen state?
    - Anything that the screen should not be able to change (e.g. user’s name, email) should not be a state variable; it should rather be a *final* instance variable in the Screen widget. Most likely, the value for such variables will be passed in from previous screens in the application flow.
    - Anything that the screen needs to modify upon user interactions (e.g. like/unlike, retweet/share, text input) should be stored as instance variable in the respective ScreenState class.

![welcome screen](/images/posts/play350-welcome.png)
![gameplay screen](/images/posts/play350-gameplay.png)
![gameresult screen](/images/posts/play350-gameresult.png)

# Navigation

Now that we have built our screen layouts, its about time to connect all of them and build the user flow. Flutter uses a **stack based navigation** system for moving around screens. Basically, this means that you **push** a new screen on top of the current screen if you want to switch. Moreover, you have to **pop** screens in order to reduce the amount of RAM consumed by your application.

In my case, I decided to pop screens before pushing in new ones whenever the user decided to start a *New Game*.

```dart
  // When the user presses the "New Game" button on the result screen.
  onPressed: () {
        // Ensure that the scoreboard is updated

        // Pop the result screen itself
        Navigator.pop(context);

        // Push a new game screen with the incremented game counter
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameBidderScreen(
                  boardID: widget.boardID,
                  gameID: widget.gameID + 1,
                  players: widget.players,
                  scoreboard: _updatedScoreboard,
                ),
          ),
        );
      },
```

# What’s Next?

In the future, I plan to complete the following tasks as well:

- Firebase integration
- Use Firestore database
- Google Sign-In
- Explore “Animations”
- Make scoreboard interactive.
- Add synchronisation between players.

# Parting Thoughts

I am super satisfied and proud of myself for completing the MVP I had set out at the start of the weekend. It was all down to the ease with which I was able to get things done in Flutter even though I did not learn Dart. Even though this would not be the best code architecture, I am fairly happy to get it working.

Do give the app a try if you like to play 350.  
Happy to incorporate feedback into the app! 😁

Hopefully, this post motivates you to try Flutter for building your next disruptive mobile application!

# References

[1]: Source on GitHub: [kshitij10496/play350](https://github.com/kshitij10496/play350)  
[2]: Google Codelabs: [Write Your First Flutter App](https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/index.html?index=..%2F..index#0)  
[3]: Udacity: [Build Native Mobile Apps with Flutter](https://classroom.udacity.com/courses/ud905)
