import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cupertino Progress Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _val = 0.64;

  @override
  Widget build(BuildContext context) {
     return CupertinoApp(
       debugShowCheckedModeBanner: false,
       home: CupertinoPageScaffold(
         navigationBar: CupertinoNavigationBar(
           padding: EdgeInsetsDirectional.zero,
           //backgroundColor: Color(0xFFC41A3B),
           middle: Stack(
             children: [
               Text(
                 widget.title, 
                 style: TextStyle(
                   color: Colors.black,
                   ),),
               Positioned( 
                 left: -8,
                 right: -8,
                 bottom: 0,
                 child: CupertinoProgressBar(
                   value: _val,
                  trackColor: Colors.red
                ),)
             ],
           ),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Text('${(_val * 100).round()}%'),
             SizedBox(height: 48.0),
             CupertinoProgressBar(value: _val),
             CupertinoSlider(
               value: _val,
               onChanged: (_value) => 
               setState(() => _val = _value),
               ),
           ],
         )
         )
     );
  }
}
