import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/model_movie.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;

  CarouselImage({required this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  List<Movie> movies = [];
  List<Widget> images = [];
  List<String> keywords = [];
  List<bool> likes = [];

  int _currentPage = 0; //현재 페이지
  String _currentKeyword = ''; //현재 키워드

  //초기값 설정
  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    // movies 리스트가 비어있지 않은지 확인합니다.
    if (movies.isNotEmpty) {
      images = movies.map((m) => Image.asset('images/' + m.poster)).toList();
      keywords = movies.map((m) => m.keyword).toList();
      likes = movies.map((m) => m.like).toList();
      _currentKeyword = keywords[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(20)),
          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keywords[_currentPage];
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(_currentKeyword, style: TextStyle(fontSize: 11)),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      likes[_currentPage]
                          ? IconButton(
                              icon: Icon(Icons.check),
                              onPressed: () {},
                            )
                          : IconButton(icon: Icon(Icons.add), onPressed: () {}),
                      Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    right: 10,
                  ), //위젯의 오른쪽에만 10만큼의 여백(padding 또는 margin)을 주는것을 의미
                  child: TextButton.icon(
                    // onPressed는 동일하게 사용합니다.
                    onPressed: () {},
                    // style 속성을 사용해 버튼의 스타일을 지정합니다.
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white, // 배경색
                      foregroundColor: Colors.black, // 아이콘 및 글자색
                    ),
                    icon: Icon(Icons.play_arrow),
                    label: Text('재생'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.info), onPressed: () {}),
                      Text('정보', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(images, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8, //가로, 세로 크기가 각각 8인 정사각형 모양의 컨테이너
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0), //다른 위젯과의 간격을 설정 (위아래로 10 여백, 각 점의 좌우에는 2만큼)
      decoration: BoxDecoration( //컨테이너의 모양과 색상
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }
  return results;
}
