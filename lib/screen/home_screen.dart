import 'package:flutter/material.dart';
import 'package:flutter_study/layout/main_layout.dart';
import 'package:flutter_study/screen/route_one.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { //async를 무조건 넣어줘야 한다.
        //true - pop 가능 , false - pop 불가능
        // return false;
        final canPop = Navigator.of(context).canPop();
        return canPop; //이렇게도 사용 가능
      },
      child: MainLayout(
          title: 'HomeScreen',
          children: [
            ElevatedButton(
                onPressed: () {
                  print(Navigator.of(context).canPop());
                }, //뒤로 갈 화면이 있는지 true/false로 알려준다.
                child: Text('Pop')
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop(); //더이상 뒤로 갈 페이지가 없을 때 뒤로 갈 수 없게 해준다.
                },
                child: Text('Pop')
            ),
            ElevatedButton(
              onPressed: () async { //돌려준 값을 받기 위해서는 async & await 사용
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => RouteOneScreen(number: 123)),
                );
                print(result);
              },
              child: Text('push')
            )
      ]),
    );
  }
}
