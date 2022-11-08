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

  bool select = false;
  bool select1 = false;
  bool select2 = false;
  bool select3 = false;
  bool select4 = false;
  bool select5 = false;
  String name = "1";
  String name1 = "0";
  double _volumeValue = 50;

  var jam = '';

  @override
  void initState() {
    super.initState();
  }

  void onVolumeChanged(double value) {
    setState(() {
      _volumeValue = value;
    });
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

                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Howdy,\n${userState.user.name!}',
                              style: blackTextStyle.copyWith(
                                  fontWeight: semiBold, fontSize: 24),
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'Where’re you on vacation today?',
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
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
                              color: kWhiteColor,
                              width: 4,
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
                    ],
                  ),
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

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
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
