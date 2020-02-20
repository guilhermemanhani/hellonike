import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/shoes.model.dart';

class ProductCard extends StatelessWidget {
  final Shoes shoes;
  final int cardNum;
  ProductCard({this.shoes, this.cardNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(642),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: ScreenUtil().setHeight(40)
              ),
              child: Container(
                width: ScreenUtil().setWidth(620),
                height: ScreenUtil().setHeight(990),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [shoes.cor, Colors.white],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8),
                      blurRadius: 8,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: ScreenUtil().setWidth(40),
                      top: ScreenUtil().setHeight(50),
                      child: Text(
                        "0${cardNum+1}",
                        style: TextStyle(color: shoes.cor, fontSize: 25, fontWeight: FontWeight.bold,),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: ScreenUtil().setWidth(45),
                          bottom: ScreenUtil().setHeight(45),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              shoes.nome,
                              style: TextStyle(fontWeight: FontWeight.bold, color: shoes.cor, fontSize: 20),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            Text(
                              "\$${shoes.preco}",
                              style: TextStyle(fontWeight: FontWeight.bold, color: shoes.cor, fontSize: 20),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(25),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(80),
                              height: ScreenUtil().setHeight(80),
                              decoration: BoxDecoration(
                                color: shoes.cor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setHeight(60),
                      left: ScreenUtil().setWidth(-10),
                      child: Image.asset(shoes.img,
                        width: ScreenUtil().setWidth(600),
                        height: ScreenUtil().setHeight(610),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}