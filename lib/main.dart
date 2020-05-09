import 'package:flutter/material.dart';
import 'package:mins_app/widget/bottom_bar_nav.dart';

void main() => runApp(MinsApp());

class MinsApp extends StatefulWidget {
  MinsStateApp createState() => MinsStateApp();
}

class MinsStateApp extends State {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MingFlix',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Container(child: Center(child: Text('Home'),),),
              Container(child: Center(child: Text('Search'),),),
              Container(child: Center(child: Text('Save'),),),
              Container(child: Center(child: Text('More'),),),
            ], // Widgets[]
          ), // TabBarView
          bottomNavigationBar: CustomBottomBar(),
        ),
      ),
    );
  }
}