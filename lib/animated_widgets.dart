import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({super.key});

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  bool outIsPadded = false;
  bool isTapped = false;
  Color color = Colors.blue;
  Color shadowColor = Colors.redAccent;
  BoxShape shape = BoxShape.rectangle;
  Duration duration = Duration(seconds: 1);
  double fs = 12;
  double op = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: AnimatedPadding(
            duration: duration,
            padding: EdgeInsets.all(outIsPadded ? 24 : 4),
            curve: Curves.easeInOutCubic,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Column(children: [
                AnimatedDefaultTextStyle(
                  style: TextStyle(fontSize: fs, color: Colors.black),
                  curve: Curves.decelerate,
                  duration: duration,
                  onEnd: () {
                    setState(() {
                      outIsPadded = !outIsPadded;
                    });
                  },
                  child: const Text("Hello World!"),
                ),

                AnimatedCrossFade(
                    firstChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: const BoxDecoration(color: Colors.green),
                          child: const Text("First")),
                    ),
                    secondChild: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 400,
                          width: 100,
                          decoration: const BoxDecoration(color: Colors.pink),
                          child: const Text("Second")),
                    ),
                    crossFadeState: isTapped
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstCurve: Curves.linear,
                    secondCurve: Curves.easeInExpo,
                    duration: const Duration(seconds: 1)),

                AnimatedPositioned(
                  duration: duration,
                  curve: Curves.bounceIn,
                  top: 0,
                  left: 0,
                  width: isTapped ? fs * 3 : fs * 1,
                  height: isTapped ? fs * 5 : fs * 1,
                  child: AnimatedPhysicalModel(
                      shape: shape,
                      elevation: 15.0,
                      color: color,
                      shadowColor: shadowColor,
                      duration: duration,
                      onEnd: () {
                        setState(() {
                          outIsPadded = !outIsPadded;
                        });
                      },
                      child: const Text("AnimatedPhysicalModel")),
                ),
                // )
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isTapped = !isTapped;
                        fs = isTapped ? 32 : 12;
                        shape = isTapped ? BoxShape.rectangle : BoxShape.circle;
                        color = isTapped ? Colors.green : Colors.red;
                        shadowColor = isTapped ? Colors.red : Colors.green;
                        duration = isTapped
                            ? const Duration(milliseconds: 500)
                            : const Duration(milliseconds: 2);
                        op = isTapped ? 0.5 : 1.0;
                      });
                    },
                    child: const Text("Click")),
              ]),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
