import 'package:flutter/material.dart';
import 'package:flutter_music/service/request.dart';
import 'package:flutter_music/model/banner.dart';
import 'dart:convert';

class BannerProvide with ChangeNotifier {

  BannerModel bannerInfo = null;

  // 获取数据
  getBannerInfo() async {
    await request('banner').then((val) {
      var responseData = json.decode(val.toString());
      bannerInfo = BannerModel.fromJson(responseData);
      notifyListeners();
    });
  }
}