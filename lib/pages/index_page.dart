import 'package:flutter/material.dart';
import 'package:flutter_music/service/request.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //_getBannerInfo();
    return Scaffold(
      body: Center(
        child: Text('hello music'),
      )
    );
  }

  void _getBannerInfo() async {
    await request('banner').then((val) {
      print('banner ===> ${val}');
    });
  }
}