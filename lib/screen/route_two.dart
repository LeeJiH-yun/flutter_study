import 'package:flutter/material.dart';
import 'package:flutter_study/layout/main_layout.dart';
import 'package:flutter_study/screen/route_three.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(
        title: 'Route Two',
        children: [
          Text('arguments : ${arguments}', textAlign: TextAlign.center),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); //값을 뒤로 돌려주기
            },
            child: Text('Pop')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/three', arguments: 999);
              },
              child: Text('Push Named')
          ),
          ElevatedButton(
              onPressed: () {
                //pop을 할 경우 이전 화면을 없애고 전전 화면으로 이동한다.
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => RouteThreeScreen())
                );
                Navigator.of(context).pushReplacementNamed(
                    '/three',
                );
              },
              child: Text('Push Replacement')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => RouteThreeScreen()
                    ),
                    //화면 이동 후 이전 모든 화면을 없앤다. false
                    //이전 모든 화면을 살린다. true
                    (route) => route.settings.name == '/'
                ); //route의 이름이 '/'인 것만 제외 하고 나머지를 제거한다.
              },
              child: Text('Push Replacement')
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/three',
                    //화면 이동 후 이전 모든 화면을 없앤다. false
                    //이전 모든 화면을 살린다. true
                    (route) => route.settings.name == '/'
                ); //route의 이름이 '/'인 것만 제외 하고 나머지를 제거한다.
              },
              child: Text('Push Replacement')
          )
        ]
    );
  }
}
