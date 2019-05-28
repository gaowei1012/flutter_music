import 'package:flutter/material.dart';
import 'package:flutter_music/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'package:flutter_music/provide/personalized.dart';
import 'package:flutter_music/provide/banner.dart';

void main() {
  var personalizedProvide = PersonalizedProvide();
  var bannerProvide = BannerProvide();

  var providers = Providers();
  providers
    ..provide(Provider<PersonalizedProvide>.value(personalizedProvide))
    ..provide(Provider<BannerProvide>.value(bannerProvide));

  runApp(ProviderNode(providers: providers,child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}