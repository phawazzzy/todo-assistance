import 'package:flutter/material.dart';

int slideIndex = 0;
class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {

  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 30),
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: 'asset/images/onboard1.png',
                title: 'Welcome to Todo Assistance',
                desc: 'this is the dexcription',
              ),
              SlideTile(
                imagePath: 'asset/images/onboard1.png',
                title: 'Keep Track',
                desc: 'this is the dexcription',
              ),
              SlideTile(
                imagePath: 'asset/images/onboard1.png',
                title: 'Automatically organize',
                desc: 'this is the dexcription',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});
//  int slideIndex = 0;

  Widget pageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF6C63FF) : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset('asset/images/logo.png'),
          SizedBox(
            height: 12,
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
          SizedBox(
            height: 20,
          ),
          Image.asset(imagePath),
          SizedBox(
            height: 12,
          ),
          Text(desc),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < 3; i++)
                i == slideIndex ? pageIndicator(true) : pageIndicator(false),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          slideIndex == 2 ?
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: MediaQuery.of(context).size.width - 200,
            decoration: BoxDecoration(
                color: Color(0xFF6C63FF),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ) :
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 50.0, left: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    splashColor: Color(0xFF6C6FFF),
                    onTap: () {},
                    child: Text('SKIP', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  ),
                  InkWell(
                    splashColor: Color(0xFF6C63FF),
                    onTap: () {},
                    child: Text('NEXT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
