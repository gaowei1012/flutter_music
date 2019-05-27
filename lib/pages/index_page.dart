import 'package:flutter/material.dart';
import 'package:flutter_music/pages/home/home_pag.dart';
import 'package:flutter_music/pages/me/me_page.dart';
import 'package:flutter_music/pages/video/video_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final PageController _controller = PageController(
    initialPage: 0,
  );

  final _defultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
         HomePage(),
         VideoPage(),
         MePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defultColor),
            activeIcon: Icon(Icons.home, color: _activeColor),
            title: Text('首页',
              style: TextStyle(
                color: _currentIndex !=0 ? _defultColor : _activeColor
              ))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call, color: _defultColor),
            activeIcon: Icon(Icons.video_call, color: _activeColor),
            title: Text('视频',
            style: TextStyle(
              color: _currentIndex !=1 ? _defultColor : _activeColor
            ),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: _defultColor),
            activeIcon: Icon(Icons.settings, color: _activeColor),
            title: Text('关于我',
            style: TextStyle(
              color: _currentIndex !=2 ? _defultColor : _activeColor
            ),)
          )
        ],
      ),
    );
  }
}