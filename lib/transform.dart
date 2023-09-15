
import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double tVal = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Expanded(flex: 3,child: SizedBox()),
      Expanded( flex: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          // child: Transform.rotate(angle: tVal,origin: Offset(50,-200),
          child: Transform(transform: Matrix4.rotationZ(tVal)..scale(tVal)..translate(tVal,tVal),
          origin: Offset(tVal,tVal),child: Container(color: Colors.pink,) ),
        ),
      ),
      Expanded(flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Slider(value: tVal,max: 2*3.14,min: 0.0, onChanged: (value) {
            setState(() {
              tVal = value;
            });
          },),
        ),
      ),
      Expanded(flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("$tVal",style: TextStyle(fontSize: 24)),
        ),
      )
    ]),);
  }
}
