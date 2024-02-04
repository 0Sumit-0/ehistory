import 'package:ehistory/screens/homepage.dart';
import 'package:ehistory/screens/playingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int index=0; //current screen
  final List<Widget> screens=[
    HomeScreen(),
    AudioPlayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    Color colour=Colors.grey;
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: TextStyle(color: colour),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: colour,),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note,color: colour,),
          label: 'bhajan',
        ),
      ],
      onTap: (myIndex) {
        setState(() {
          if(myIndex < screens.length) {
            index=myIndex;
          }
        });
      },
    );
  }
}

