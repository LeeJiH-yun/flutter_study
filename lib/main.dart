import 'package:flutter/material.dart';
import 'package:flutter_study/screen/home_screen.dart';
import 'package:flutter_study/screen/route_one.dart';
import 'package:flutter_study/screen/route_three.dart';
import 'package:flutter_study/screen/route_two.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/', //초기 실행 됐으면 하는 화면,
        //home: HomeScreen()
        //www.google.com-> www.google.com/
        routes: {
          '/' : (context) => HomeScreen(),
          '/one' : (context) => RouteOneScreen(),
          '/two' : (context) => RouteTwoScreen(),
          '/three' : (context) => RouteThreeScreen(),
        },
      )
  );
}
