import 'package:flutter/material.dart';
import 'package:flutter_music/service/request.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _getBannerInfo();
    return Container(
      child: Center(
        child: Text('home page'),
      )
    );
  }

  void _getBannerInfo() async {
    await request('banner').then((val) {
      print('banner: =====> ${val}');
    });
  }
}