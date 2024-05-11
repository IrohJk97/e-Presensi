// main.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '/helpers/ColorsSys.dart';
import '/helpers/Strings.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text('Skip',
                style: TextStyle(
                  color: ColorSys.gray,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              OnboardingPage(
                image: 'assets/images/stepOne.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              OnboardingPage(
                image: 'assets/images/stepTwo.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              OnboardingPage(
                image: 'assets/images/stepThree.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
              OnboardingPage(
                image: 'assets/images/stepFour.png',
                title: Strings.stepFourTitle,
                content: Strings.stepFourContent,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicators(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add login functionality here
                  print('Login button pressed');
                },
                icon: Icon(Icons.login),
                label: Text('Login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorSys.primary,
                  elevation: 0,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicators() {
    return List.generate(4, (int index) {
      return _indicator(index == _currentIndex);
    });
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: ColorSys.secoundry,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

// onboarding_page.dart
class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final bool reverse;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.content,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    FadeInUp(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(image),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                )
              : SizedBox(),
          FadeInUp(
            duration: Duration(milliseconds: 900),
            child: Text(
              title,
              style: TextStyle(
                color: ColorSys.black,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 20),
          FadeInUp(
            duration: Duration(milliseconds: 1100),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorSys.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// fade_in_up.dart
class FadeInUp extends StatefulWidget {
  final Widget child;
  final Duration duration;

  FadeInUp(
      {required this.child, this.duration = const Duration(milliseconds: 300)});

  @override
  _FadeInUpState createState() => _FadeInUpState();
}

class _FadeInUpState extends State<FadeInUp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.5),
          end: Offset(0, 0),
        ).animate(_animation),
        child: widget.child,
      ),
    );
  }
}
