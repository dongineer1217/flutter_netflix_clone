import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/bbongflix_logo.png'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Donghwi',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: 140,
              height: 5,
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Linkify(
                onOpen: (link) async {
                  final uri = Uri.parse(link.url);
                  // 2. canLaunch 대신 canLaunchUrl을 사용합니다.
                  if (await canLaunchUrl(uri)) {
                    // 3. launch 대신 launchUrl을 사용합니다.
                    await launchUrl(uri);
                  }
                },
                text: 'https://www.naver.com',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white, // 아이콘과 텍스트 색상
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ), // 버튼 테두리 색상과 두께
                  textStyle: TextStyle(fontSize: 20), // 텍스트 스타일
                ),
                icon: Icon(Icons.edit),
                label: Text('프로필 편집'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
