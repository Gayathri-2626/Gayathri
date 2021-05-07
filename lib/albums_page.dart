import 'package:flutter/material.dart';
import 'package:login_2/Sizecongig.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {

 var list=['images/testing.png','images/testing.png','images/testing.png'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
             padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                // children: [
                //   _albumcard("images/testing.png"),
                //   SizedBox(width: 10.0,),
                //   _albumcard("images/testing.png"),
                //   SizedBox(width: 10.0,),
                //   _albumcard("images/testing.png"),
                // ],
                children: List.generate(2, (index) => _albumcard(list[index])),
              ),
            )
            )
          ],
        ),
      );
  }

  _albumcard(String assetImage) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset("images/testing.png", fit: BoxFit.cover, height: 100, width: 150,),
          ),
          Positioned(
              bottom: 10.0,
              left: 10.0,
            child: CircleAvatar(
                    backgroundColor: Colors.white70,
                     child: Icon(Icons.play_arrow, color: Colors.white,),
          )
          )
        ],
      ),
    );
  }
}
