import 'package:flutter/material.dart';
import 'package:flutter_netflix_clone/model/model_movie.dart';
import 'package:flutter_netflix_clone/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {

  final List<Movie> movies;
  BoxSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
        children: <Widget>[
          Text('지금 뜨는 콘텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(context, movies),
            ),
          )
        ]
      ),
    );
  }
}

// 영화 포스터 이미지들을 박스 형태로 만들어주는 함수
List<Widget> makeBoxImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    // InkWell: 클릭 가능한 위젯
    results.add(InkWell(  //InkWell : 클릭 가능한 위젯
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return DetailScreen(movie: movies[i]);
          },
        ));
      }, // 클릭 이벤트
      child: Container(
        padding: EdgeInsets.only(right: 10), // 오른쪽 여백
        child: Align( // Box를 왼쪽 정렬
          alignment: Alignment.centerLeft, // 왼쪽 정렬
          child: Image.asset('images/' + movies[i].poster), // 이미지
        ),
      ),
    ));
  }
  return results;
}

