import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalizedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      child: ListView(
        children: <Widget>[
          _ItemView(),
          _ItemView(),
          _ItemView(),
        ],
      )
    );
  }

  Widget _ItemView() {
    return Container(
      width: ScreenUtil().setWidth(240),
      child: Stack(
        children: <Widget>[
          Container(
            child: Text('title'),
          ),
          Container(
            child: Icon(Icons.ac_unit)
          ),
          Container(
            child: Text('我是文字描述文字描述'),
          )
        ],
      ),
    );
  }

}
