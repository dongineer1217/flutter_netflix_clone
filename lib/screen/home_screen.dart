import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/model_movie.dart';
import 'package:flutter_netflix_clone/widget/box_slider.dart';
import 'package:flutter_netflix_clone/widget/carousel_slider.dart';
import 'package:flutter_netflix_clone/widget/circle_slider.dart';

//상단바, 전체화면 영화포스터, 등등 메인화면을 꾸밈 (총 3가지의 구성을 가짐!)
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
    Movie.fromMap({
      'title': '사랑의 불시착',
      'keyword': '사랑/로맨스/판타지',
      'poster': 'test_movie_1.png',
      'like': false,
    }),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            //후입선출법으로 화면에 표시
            CarouselImage(movies: movies), //영화 포스터
            TopBar(), //상단바
          ],
        ),
        CircleSlider(movies:  movies), //미리보기
        BoxSlider(movies: movies,), //지금 뜨는 콘텐츠
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        //하위 각 차일드 위젯들을 수평으로 배치
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, //각 차일드 위젯들을 좌우로 최대한 멀리 배치
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text('TV 프로그램', style: TextStyle(fontSize: 14)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text('영화', style: TextStyle(fontSize: 14)),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}
