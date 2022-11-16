part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .read<PageBloc>()
            .add(GoToRegistrationPage(widget.registrationData));
        return false;
      },
      child: Scaffold(
        body: Container(
          color: kBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90),
                    height: 70,
                    child: Center(
                      child: Text(
                        "Konfirmasi Akun",
                        style: blackTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage("assets/user_pic.png")
                                        as ImageProvider
                                    : FileImage(
                                        widget.registrationData.profileImage!),
                            fit: BoxFit.cover)),
                  ),
                  Text(
                    "Selamat Datang, ",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    "${widget.registrationData.name}" + "!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp)
                      ? SpinKitCircle(
                          color: kBlueColor,
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 55,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kBlueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17)),
                              ),
                              child: Text(
                                "Konfirmasi",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isSigningUp = true;
                                });

                                imageFileToUpload =
                                    widget.registrationData.profileImage;

                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                  widget.registrationData.email,
                                  widget.registrationData.password,
                                  widget.registrationData.name,
                                );

                                if (result.user == null) {
                                  setState(() {
                                    isSigningUp = false;
                                  });

                                  Flushbar(
                                    duration: Duration(milliseconds: 1500),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    backgroundColor: Color(0xFFFF5C83),
                                    message: result.message,
                                  )..show(context);
                                }
                              })),
                  SizedBox(
                    height: 110,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
