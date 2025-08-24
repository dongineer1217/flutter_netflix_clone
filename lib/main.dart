import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/screen/home_screen.dart';
import 'package:flutter_netflix_clone/screen/more_screen.dart';
import 'package:flutter_netflix_clone/widget/bottom_bar.dart';

//flutter 앱의 시작점 (앱이 실행되면 Main 함수가 가장 먼저 실행됨)
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

//'_'를 넣으면 비공개 클래스임을 의미
//위젯의 실제 상태를 관리하고 UI를 그리는 역할
//StatelessWidget과 달리 상태를 변경할 수 있음(상태없는위젯)
// - 내부에 변경 가능한 상태를 가지지 않는다.
// - 화면을 다시 그릴 필요가 없어 가볍고 빠르다
// - ex : Icon, Text, RaisedButton 등 내용이 고정된 홤녀 요소나 단순히 정보를 표시하는 페이지

//StatefulWidget과 달리 상태를 변경할 수 없음(상태있는위젯)
// - 내부에 변경 가능한 상태를 가질 수 있다.
// - 상태가 변경되면 화면을 다시 그려야 하므로 무겁고 느리다
// - 상태를 변경할때는 반드시 setState() 메서드를 호출해야 한다.
// - 이 함수는 Flutter에게 상태가 바뀌었으니 화면을 다시 그려줘 라고 알려주는 역할
class _MyAppState extends State<MyApp> {


  //Material Design 스타일의 앱을 만드는 가장 기본적인틀
  //앱의 이름, 테마, 홈 화면 등을 설정
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BbongFlix",
      theme: ThemeData(
        brightness: Brightness.dark,
        // colorScheme에는 ColorScheme 객체를 사용해야 합니다.
        colorScheme: ColorScheme.dark(
          background: Colors.black, // 전체 배경을 검은색으로
          primary: Colors.white, // 강조/주요 색상을 흰색으로 (버튼, 활성 탭 등)
          secondary: Colors.white, // 보조 색상을 흰색으로
        ),
      ),

      home: DefaultTabController(
        length: 4, //넷플릭스 폼에는 4개의 탭이존재
        child: Scaffold(
          //서랍장 디자인 (상단바, 하단바, 본문등)을 제공하는ㄷ ㅗ화지같은 위젯
          body: TabBarView(
            //서랍장 내부 칸막이인데 각 탭을 보여줄때 실제 ㅐㄴ용 페이지들을 담는공간
            physics:
                NeverScrollableScrollPhysics(), //스와이프 기능 비활성화 (손가락을 화면을 좌우로 밀어서 탭을 전환가능)
            children: <Widget>[
              //4개의 페이지를 순서대로 넣어주는 곳
              HomeScreen(),
              Container(child: Center(child: Text('search'),),),
              Container(child: Center(child: Text('save'),),),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
