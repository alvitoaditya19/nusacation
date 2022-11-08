part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
              padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: defaultMargin,
                bottom: 10
              ),
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
                    children: [
                      Container(
                        width: 64,
                        height: 64,
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
                        child: Image.asset(
                          'assets/btn-exit.png',
                          width: 20,
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
              })),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: blackTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: kBlackColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Account',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem(
                  'Edit Profile',
                ),
              ),
              menuItem(
                'Your Orders',
              ),
              menuItem(
                'Help',
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'General',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem(
                'Privacy & Policy',
              ),
              menuItem(
                'Term of Service',
              ),
              menuItem(
                'Rate App',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Column(children: [
            header(),
            content(),
          ]),
        ));
  }
}
