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
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          labelType: NavigationRailLabelType.all,
          selectedLabelTextStyle: TextStyle(color: Colors.redAccent),
          unselectedLabelTextStyle:  TextStyle(color: Colors.blueAccent),
          backgroundColor: Colors.grey[900],
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedIndex: _selectedIndex,
          onDestinationSelected:(index){
           setState(() {
             _selectedIndex=index;
           });
          } ,
          destinations: [
            NavigationRailDestination(icon: Icon(Icons.home),label: Text("Home")),
            NavigationRailDestination(icon: Icon(Icons.bookmark_border),label: Text("Bookmark") )
          ],

        ),
        Expanded(child: Container(
        ))
      ],
    );
  }
}
