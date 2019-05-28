import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_music/provide/banner.dart';
const ALPHA_SCROLL_OFFSET = 100;

class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {

  final _imagItem = [
    'http://p1.music.126.net/KIDETOwUt5EQxn4fqMELGg==/109951164099684560.jpg',
    'http://p1.music.126.net/Zam6Xfd8eFGzlBChmY0iBw==/109951164099677716.jpg',
    'http://p1.music.126.net/RNj0oKTLPJjUdSBFTrXvZw==/109951164099672326.jpg',
    'http://p1.music.126.net/B-Xa2CPaQ2h6PNXX1lCoGQ==/109951164099658893.jpg',
    'http://p1.music.126.net/kvMqBDWJWPBvL8kEykwLwQ==/109951164099667333.jpg',
    'http://p1.music.126.net/koAV6LNv0zsXeKN-go6pIw==/109951164099664820.jpg',
    'http://p1.music.126.net/ShQomjBLu9OjZZRaDa8pGA==/109951164096950211.jpg',
    'http://p1.music.126.net/yB_xRugQa2netMeBgnIG0Q==/109951164099665591.jpg',
    'http://p1.music.126.net/_2Lr_C_5kGNrQMv89mBRpA==/109951164098388725.jpg'
  ];

  //final _imageItem = [];
  

  double appBarAlpha = 0;

  _onScroll(offset) {
    // 拿到屏幕滚动的值
    //print(offset);
    double alpha = offset / ALPHA_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bannerInfo = Provide.value<BannerProvide>(context).getBannerInfo();
    print(bannerInfo);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Center(
              child: NotificationListener(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollNotification && scrollNotification.depth==0) {
                    _onScroll(scrollNotification.metrics.pixels);
                  }
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: 160,
                      child: Swiper(
                        itemCount: _imagItem.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            _imagItem[index],
                            fit: BoxFit.fill,
                          );
                        },
                        autoplay: true,
                        pagination: SwiperPagination(),
                      ),
                    ),
                    Container(
                      height: 800,
                      child: ListTile(
                        leading: Icon(Icons.mail_outline),
                        title: Text('hello view'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              width: 750,
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(padding: EdgeInsets.only(top: 10), child: Text('首页')),
              ),
            ),
          )
        ],
      ),
    );
  }
}