// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hello/controller/shoes.controller.dart';
import 'package:hello/productBanner.dart';
import 'package:hello/productsCard.dart';
import 'package:hello/profileClipper.dart';
import 'package:flutter/foundation.dart';
import 'brandSelector.dart';
import 'dart:async';
import 'dart:convert';

import 'model/shoes.model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentTabIndex = 0;
  List<Widget> _childrens;
  
  // final bottomBarModels = <BottomBarItemModel> [
  //   BottomBarItemModel(Icon: Icons.explicit),
  //   BottomBarItemModel(Icon: Icons.explicit),
  //   BottomBarItemModel(Icon: Icons.explicit),
  // ];
  @override
  Widget build(BuildContext context) {
    ShoesController _controller = new ShoesController();
    
    List<Shoes> products = _controller.getShoes();
    
    // List<String> products = List<String>.generate(10000, (i) => "Item $i") ;

    ScreenUtil.init(context, width: 1125, height: 2546, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  ClipOval(
                    clipper: ProfileClipper(),
                    child: Image.asset(
                      "image/img1.png",
                      width: ScreenUtil().setWidth(160),
                      height: ScreenUtil().setHeight(160),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(60),
                left: ScreenUtil().setWidth(70),
                right: ScreenUtil().setWidth(105),
                bottom: ScreenUtil().setHeight(105),
              ),
              child: Text(
                "Explore",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
              ),
            ),
            BrandSelector(
              brands: ["Nike", "Adidas", "Converse", "Vans"],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(1050),
              child:  ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index){
                  Shoes shoes = products[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                    ),
                    child: ProductCard(
                      shoes: shoes,
                      cardNum: index,
                    ),
                    );
                },),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(60),
            ),
            ProductBanner(
              shoes: products[1]
            ),
          ],
        ),
      ),
    );
  }
}
