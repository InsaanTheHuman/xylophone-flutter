import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int note) {
    final player = AudioCache();
    player.play('note$note.wav');
  }

  Expanded buildKey({Color color, int note}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: color,
          onPressed: () {
            playSound(note);
          }, child: null,
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://github.com/InsaanTheHuman/xylophone-flutter';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Xylophone',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ) ,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.computer),
              onPressed: _launchURL,
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, note: 1),
              buildKey(color: Colors.orange, note: 2),
              buildKey(color: Colors.yellow, note: 3),
              buildKey(color: Colors.green, note: 4),
              buildKey(color: Colors.teal, note: 5),
              buildKey(color: Colors.blue, note: 6),
              buildKey(color: Colors.purple, note: 7),
            ],
          ),
        ),
      ),
    );
  }
}
