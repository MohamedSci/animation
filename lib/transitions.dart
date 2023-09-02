import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}
//Steps
// 1. Make a function of Type Route
// 2. it returns PageRouteBuilder(pageBuilder()=>Pages(),transitionsBuilder(){},return TRANSITION())
// 3. INSIDE  the function make a tween and an animation instance

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute2());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

// ************************************** Slide Transition 1 **************************************
Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset(0, 0);
      var tween = Tween (begin:begin, end: end );
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child,);
    },
  );
}
// ************************************** Slide Transition 2 **************************************

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
// ************************************** FadeTransition **************************************

Route _createRoute6() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return
        FadeTransition (opacity: animation, child: child,);
    });
    }
// ************************************** More than One ScaleTransition & RotationTransition**********************************
Route _createRoute7() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end =1.0;
        var tween = Tween(begin: begin, end: end);
        var curvesanimation= CurvedAnimation(
            parent: animation, curve: Curves.linearToEaseOut);
        return ScaleTransition(
            scale: tween.animate(curvesanimation),
            child: RotationTransition(turns: tween.animate(curvesanimation),
              child: child,));
      });}


class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}