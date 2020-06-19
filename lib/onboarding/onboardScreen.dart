import 'package:flutter/material.dart';
import 'package:todoassistance/onboarding/data.dart';
import 'package:todoassistance/shared/size_config.dart';

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
    SizeConfig().init(context);
    return Scaffold(
      bottomSheet: Container(
//        color: Colors.green,
        margin: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 20.0, bottom: SizeConfig.blockSizeVertical * 20.0, left: SizeConfig.blockSizeHorizontal * 20.0),
        child: Visibility(
          visible: slideIndex == mySlides.length - 1 ? false : true,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  splashColor: Color(0xFF6C6FFF),
                  onTap: () {
                    pageController.animateToPage(3 - 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 18, fontWeight: FontWeight.w500),
                  ),
                ),
                InkWell(
                  splashColor: Color(0xFF6C63FF),
                  onTap: () {
                    pageController.animateToPage(slideIndex + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ]),
        ),
      ),
//      backgroundColor: Colors.red,
      body: SafeArea(
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
      height: isCurrentPage ? SizeConfig.blockSizeVertical * 10.0 : SizeConfig.blockSizeVertical * 6.0,
      width: isCurrentPage ? SizeConfig.blockSizeHorizontal * 10.0 : SizeConfig.blockSizeHorizontal * 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color(0xFF6C63FF) : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('asset/images/logo.png'),
              SizedBox(
                height: 20,
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
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
            visible: slideIndex == slideLength - 1 ? true : false,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.only(right: 20.0, top: 42.0, left: 20.0),
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
                    ),
                ),
              )
        ],
      ),
    );
  }
}
