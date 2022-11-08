part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int? bottomNavBarIndex;
  final String? title;
  final url;

  MainPage({this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? bottomNavBarIndex;
  PageController? pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: accentColor2,
          ),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[MenuPage(), ProfilePage()],
          ),
          createCustomBottomNavBar(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 66,
              width: 66,
              margin: EdgeInsets.only(bottom: 40),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: kBlueColor,
                child: SizedBox(
                  height: 44,
                  width: 44,
                  child: Image.asset("assets/ic-topup.png"),
                ),
                onPressed: () async {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createCustomBottomNavBar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                  elevation: 0,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: kGrey2Color,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                  currentIndex: bottomNavBarIndex!,
                  onTap: (index) {
                    setState(() {
                      bottomNavBarIndex = index;
                      pageController!.jumpToPage(index);
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            (bottomNavBarIndex == 0)
                                ? "assets/ic-home-act.png"
                                : "assets/ic-home-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            (bottomNavBarIndex == 1)
                                ? "assets/ic-book-act.png"
                                : "assets/ic-book-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            (bottomNavBarIndex == 2)
                                ? "assets/ic-like-act.png"
                                : "assets/ic-like-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        )),
                    BottomNavigationBarItem(
                        label: "",
                        icon: Container(
                          height: 26,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Image.asset(
                            (bottomNavBarIndex == 3)
                                ? "assets/ic-prof-act.png"
                                : "assets/ic-prof-inact.png",
                            height: 24,
                            width: 24,
                          ),
                        ))
                  ]),
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width / 2 - 38, 0);

    path.quadraticBezierTo(size.width / 2 - 38, 42, size.width / 2, 42);
    path.quadraticBezierTo(size.width / 2 + 38, 42, size.width / 2 + 38, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
