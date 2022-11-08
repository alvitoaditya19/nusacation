part of 'pages.dart';

class MenuPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final String? title;
  final url;

  const MenuPage({super.key, this.bottomNavBarIndex = 0, this.title, this.url});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final fb = FirebaseDatabase.instance;
  TextEditingController _textFieldControllerTanggal = TextEditingController();
  TextEditingController _textFieldControllerWaktu = TextEditingController();





  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload!).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .read<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(GoToEditProfilePage(
                            (userState as UserLoaded).user));
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kBlueColor,
                            width: 3,
                          ),
                          image: DecorationImage(
                              // image: DecorationImage( image: true ? NetworkImage('someNetWorkLocation.com') : AssetImage('assets/images/noImageAvailable.png') as ImageProvider ),
                              image: (userState.user.profilePicture == ""
                                  ? AssetImage("assets/user_pic.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      userState.user.profilePicture ??
                                          "No Data")),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Howdy, ${userState.user.name!}',
                              style: blackTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 16),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: "id_ID",
                                      decimalDigits: 0,
                                      symbol: "IDR ")
                                  .format(userState.user.balance ?? "0"),
                              style: grey3TextStyle.copyWith(fontSize: 14),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kGoldColor),
                              child: Text(
                                'Gold',
                                style: whiteTextStyle.copyWith(
                                    fontWeight: light, fontSize: 12),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 54,
                        width: 54,
                        padding: EdgeInsets.only(
                          left: 6,
                          bottom: 2
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          "assets/btn-edit.png",
                          fit: BoxFit.contain,
                          width: 32,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: kGreenColor,
                  size: 50,
                );
              }
            }),
          ),
        ]),
      );
    }
 Widget searchDestination() {
      return GestureDetector(
        onTap: () {
         
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kWhiteColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.search_rounded,
                color: kGrey3Color,
                size: 36.0,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Find a Magical Place',
                style: grey3TextStyle,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
               SizedBox(
                height: 14,
              ),
                searchDestination(),

              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
