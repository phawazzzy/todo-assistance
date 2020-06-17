import 'package:flutter/material.dart';
import 'package:todoassistance/onboarding/data.dart';

int slideIndex = 0;
PageController pageController;

class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  List<SliderModel> mySlides = List<SliderModel>();

  @override
  void initState() {
    super.initState();
    mySlides = getSlides();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 30,
          ),
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              for (int i = 0; i < mySlides.length; i++)
                SlideTile(
                  imagePath: mySlides[i].getImageAssetPath(),
                  title: mySlides[i].getTitle(),
                  desc: mySlides[i].getDesc(),
                  slideLength: mySlides.length,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title, desc;
  int slideLength;

  SlideTile({this.imagePath, this.title, this.desc, this.slideLength});
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
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(imagePath),
          SizedBox(
            height: 12,
          ),
          Text(desc),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < slideLength; i++)
                i == slideIndex ? pageIndicator(true) : pageIndicator(false),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          slideIndex == slideLength - 1
              ? Container(
                  margin: EdgeInsets.only(right: 20.0, top: 50.0, left: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  width: MediaQuery.of(context).size.width - 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    margin: EdgeInsets.only(right: 20.0, top: 70.0, left: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            splashColor: Color(0xFF6C6FFF),
                            onTap: () {
                              pageController.animateToPage(slideLength - 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: Text(
                              'SKIP',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                          InkWell(
                            splashColor: Color(0xFF6C63FF),
                            onTap: () {
                              pageController.animateToPage(slideIndex + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.linear);
                            },
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                  ),
                )
        ],
      ),
    );
  }
}
