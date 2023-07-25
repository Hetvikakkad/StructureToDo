import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Welcome to TODO!',
                  textStyle: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  speed: Duration(microseconds: 80),
                ),
              ],
              totalRepeatCount: 1,
              pause: Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
            ),
            SizedBox(height: 30,)
            // AnimatedOpacity(
            //     opacity: _visible ? 1.0 : 0.0, duration: Duration(seconds: 5),
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.green,
            //   ),
            // )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Call setState. This tells Flutter to rebuild the
      //     // UI with the changes.
      //     setState(() {
      //       _visible = !_visible;
      //     });
      //   },
      //   tooltip: 'Toggle Opacity',
      //   child: const Icon(Icons.flip),
      // ),
    );

  }

}
