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

  int _navigationRailSelectedIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Rail With PageView"),
      ),
      body:  Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.none,
            backgroundColor: Colors.blue,
            selectedIconTheme: IconThemeData(color: Colors.white),
            selectedIndex: _navigationRailSelectedIndex,
            onDestinationSelected:(index){
              setState(() {
                _navigationRailSelectedIndex=index;
                _pageController.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.bounceInOut);
              });
            } ,
            destinations: [
              NavigationRailDestination(icon: Icon(Icons.home),label: Text("Home")),
              NavigationRailDestination(icon: Icon(Icons.phone),label: Text("Call") ),
              NavigationRailDestination(icon: Icon(Icons.help),label: Text("Info") )
            ],

          ),
          Expanded(child: PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            onPageChanged: (index){
              setState(() {
                _navigationRailSelectedIndex=index;
              });

            },
            children: [
              Container(color: Colors.grey[900]),
              Container(color: Colors.indigo[900]),
              Container(color: Colors.green[900])
            ],
          ),
          )
        ],
      ),
    );
  }
}
