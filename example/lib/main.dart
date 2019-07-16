import 'package:flutter/material.dart';
import 'package:speech_bubble/speech_bubble.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: new SpeechBubble(
                nipLocation: NipLocation.BOTTOM,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                    ),
                    Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: new SpeechBubble(
                nipLocation: NipLocation.BOTTOM_LEFT,
                nipHeight: 20,
                child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Text(
                    "You can also change the nip size!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
