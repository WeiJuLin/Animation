import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = -0.15;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }
  void _downdatePadding() {
    setState(() {
      padValue = -0.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedContainer(duration: Duration(seconds:2),
               alignment:Alignment(0, padValue),
               onEnd: _downdatePadding,
               curve: Curves.easeOutQuart,
               child:Container(child:Icon(Icons.airplanemode_active, size: 40, color: Colors.blue,)),
             ),
        ElevatedButton.icon(
          onPressed: (){
            _updatePadding(padValue == -0.15 ? -1.0 : -0.15);
          },
          icon:Icon(Icons.airplanemode_active,size: 20,color: Colors.white),
          label: Text('起飛'),
            ),
      ],
    );
  }
}

