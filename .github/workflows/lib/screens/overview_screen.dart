import 'package:authentifaction_app/screens/expense_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({Key key}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(117, 163, 151, 234),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SliderImageAnimation(),
          const SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 15, bottom: 15),
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(253, 111, 150, 1),
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText("Congrats!"),
                    WavyAnimatedText('Well Done!'),
                  ],
                  isRepeatingAnimation: false,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 15),
            child: Text(
                "You have successfully created a profile, Now you can enter the Portal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 18, 18),
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  fontFamily: "RobotoCondensed",
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              height: 57.0,
              child: Material(
                color: const Color.fromRGBO(254, 242, 243, 1),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const expenseForm()),
                    );
                  },
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Color.fromRGBO(253, 111, 150, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('Portal Entry'),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              height: 57.0,
              child: Material(
                color: const Color.fromRGBO(254, 242, 243, 1),
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Center(
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Color.fromRGBO(253, 111, 150, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText('Logout'),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SliderImageAnimation extends StatefulWidget {
  const SliderImageAnimation({Key key}) : super(key: key);

  @override
  _SliderImageAnimationState createState() => _SliderImageAnimationState();
}

class _SliderImageAnimationState extends State<SliderImageAnimation>
    with SingleTickerProviderStateMixin {
  final Tween<double> _scaleTween = Tween<double>(begin: 1, end: 1.4);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: _scaleTween,
      duration: const Duration(seconds: 3),
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/unthis.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
