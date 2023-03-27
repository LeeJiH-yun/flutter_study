import 'package:flutter/material.dart';
import 'package:flutter_study/layout/main_layout.dart';
import 'package:flutter_study/screen/route_two.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number; //앞에서 넘겨주는 데이터 받기

  const RouteOneScreen({
    this.number,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Route One',
        children: [
          Text('arguments: ${number.toString()}', textAlign: TextAlign.center),
          ElevatedButton(
            onPressed: () { //첫번째 방법
              Navigator.of(context).pop(456); //값을 뒤로 돌려주기
            },
            child: Text('Pop')
          ),
          ElevatedButton(
            onPressed: () { //두번째 방법
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => RouteTwoScreen(),
                    settings: RouteSettings(
                        arguments: 789
                    )
                ),
              );
            },
            child: Text('Push')
          )
        ]
    );
  }
}
