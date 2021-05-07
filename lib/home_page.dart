import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_2/albums_page.dart';
import 'package:login_2/regi_page.dart';

import 'drawer_page.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  int _currentIndex=0;
  final tabs=[
    Center(child: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('Search',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('camera',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
    Center(child: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),),
  ];
  TabController _tabcontroller;
  @override
  void initState() {
    super.initState();
    _tabcontroller= new TabController(length: 4, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.purple
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),),
              child: TabBar(
                controller: _tabcontroller,
                tabs: [

                  Tab(icon: Icon(Icons.album_rounded),text:"Albums"),
                  Tab(
                      icon: Icon(Icons.music_video_rounded),text:"PlayList"
                  ),
                  Tab(
                      icon: Icon(Icons.music_note_outlined),text:"Songs"
                  ),
                  Tab(
                      icon: Icon(Icons.favorite),text:"favorites"
                  ),
                ],
              ),

            ),
            Expanded(
              child: TabBarView(

                controller: _tabcontroller,
                children: [
                  Albums(),
                  Container(

                  ),
                  Container(

                  ),
                  Container(

                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          iconSize: 30,
          selectedFontSize: 15,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.home,color: Colors.white),
              title: Text('Home',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.search,color: Colors.white),
              title: Text('Search',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.music_note,color: Colors.white),
              title: Text('Music',style: TextStyle(color: Colors.white),),
            ),

            BottomNavigationBarItem(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.person,color: Colors.white),
              title: Text('Profile',style: TextStyle(color: Colors.white),),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
      ),


    );
  }
}
