part of 'pages.dart';

class BookingPage extends StatefulWidget {
  final DestinationModel? booking;

  const BookingPage(this.booking, {super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int jml = 1;
  String time = 'Tap to Select the Date';
  bool dateService = true;
  DateTime _dateTime = DateTime.now();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String payment = 'Pilih Metode\nPembayaran';

  void _add() {
    setState(() {
      jml += 1;
    });
  }

  void _remove() {
    setState(() {
      jml -= 1;
    });
  }

  var whatsapp = "+6282297145285";

  void customLaunch(command) async {
    // ignore: deprecated_member_use
    await launch(command);
  }

  @override
  void dispose() {
    super.dispose();
    // jml.cancel();
    // _onBackPressed(context);
    // this.context.read<PageBloc>().add(GoToMainPage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .read<PageBloc>()
              .add(GoToDetailDestinationPage(widget.booking!));

          return true;
        },
        child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: kBackgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  context.read<PageBloc>().add(GoToMainPage());
                },
              ),
              title: Text("Pesanan Kamu"),
              centerTitle: true,
            ),
            body: SafeArea(
              child: ListView(children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your Balance",
                              style: blackTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: BlocBuilder<UserBloc, UserState>(
                                builder: (_, userState) {
                              if (userState is UserLoaded) {
                                if (imageFileToUpload != null) {
                                  uploadImage(imageFileToUpload!)
                                      .then((downloadURL) {
                                    imageFileToUpload = null;
                                    context.read<UserBloc>().add(
                                        UpdateData(profileImage: downloadURL));
                                  });
                                }
                                return Column(
                                  children: [
                                    Row(
                                      children: <Widget>[
                                        Stack(
                                          children: <Widget>[
                                            SpinKitFadingCircle(
                                              color: kBlueColor,
                                              size: 50,
                                            ),
                                            GestureDetector(
                                                        onTap: () {
                                  context
                                      .read<PageBloc>()
                                      .add(GoToSuccessPage(userState.user));
                                  FirebaseFirestore.instance
                                      .runTransaction((transaction) async {
                                    CollectionReference reference =
                                        FirebaseFirestore.instance
                                            .collection("dataTiket");
                                    await reference.add({
                                      "user_id": userState.user.id,
                                      "Place": widget.booking!.name!,
                                      "Date": time,
                                      "Price": "${widget.booking!.price}",
                                      "Traveler": jml,
                                      "Payment": payment
                                    });
                                  });
                                },
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: (userState.user
                                                                .profilePicture ==
                                                            ""
                                                        ? AssetImage(
                                                                "assets/user_pic.png")
                                                            as ImageProvider
                                                        : NetworkImage(userState
                                                                .user
                                                                .profilePicture ??
                                                            "No Data")),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                child: Text(
                                                  r'$ ' +
                                                      userState.user.balance
                                                          .toString(),
                                                  style:
                                                      blackTextStyle.copyWith(
                                                    fontSize: 18,
                                                    fontWeight: medium,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                "Sisa Saldo",
                                                style: greyTextStyle.copyWith(
                                                  fontWeight: light,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'List Booking Item ',
                                            style: blackTextStyle.copyWith(
                                              fontSize: 18,
                                              fontWeight: medium,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record,
                                          size: 26,
                                          color: kBlueColor,
                                        ),
                                        Icon(
                                          Icons.fiber_manual_record,
                                          size: 26,
                                          color: kBlueColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      decoration: BoxDecoration(
                                        color: kWhiteColor,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    width: 70,
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                widget.booking!
                                                                    .imageUrl!)))),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        widget.booking!.name!,
                                                        style: blackTextStyle
                                                            .copyWith(
                                                          fontWeight: medium,
                                                          fontSize: 18,
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        widget
                                                            .booking!.location!,
                                                        style: greyTextStyle
                                                            .copyWith(
                                                          fontWeight: light,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(
                                              'Booking Details',
                                              style: blackTextStyle.copyWith(
                                                fontSize: 16,
                                                fontWeight: semiBold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            RowDetails(
                                              det1: "Kode Tiket",
                                              det2: randomAlphaNumeric(15),
                                              clr: kBlueColor,
                                              weight: semiBold,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .check_circle_outline,
                                                      color: Colors.blue,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text("Jumlah Tiket",
                                                        style: blackTextStyle),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 120,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          border: Border.all(
                                                              color:
                                                                  kBlueColor)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                              onTap: jml >= 2
                                                                  ? _remove
                                                                  : null,
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          kBlueColor,
                                                                      border: Border.all(
                                                                          color:
                                                                              kBlueColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50)),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white))),
                                                          Text(jml.toString()),
                                                          GestureDetector(
                                                              onTap: _add,
                                                              child: Container(
                                                                  decoration: BoxDecoration(
                                                                      color:
                                                                          kBlueColor,
                                                                      border: Border.all(
                                                                          color:
                                                                              kBlueColor),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50)),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white)))
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                DateTime? newDate =
                                                    await showDatePicker(
                                                        context: context,
                                                        initialDate: _dateTime,
                                                        firstDate:
                                                            DateTime.now(),
                                                        lastDate:
                                                            DateTime(2024));

                                                if (newDate == null) {
                                                  return;
                                                } else {
                                                  setState(() =>
                                                      _dateTime = newDate);
                                                }
                                                time = DateFormat('dd-MM-yyyy')
                                                    .format(_dateTime);
                                              },
                                              child: RowDetails(
                                                det1: 'Date',
                                                det2: time.toString(),
                                                clr: (_dateTime != null)
                                                    ? kBlackColor
                                                    : kRedColor,
                                                weight: semiBold,
                                              ),
                                            ),
                                            RowDetails(
                                              det1: 'Asuransi',
                                              det2: 'ADA',
                                              clr: kGreenColor,
                                              weight: semiBold,
                                            ),
                                            RowDetails(
                                              det1: 'Pajak',
                                              det2: 'TIDAK ADA',
                                              clr: kBlackColor,
                                              weight: semiBold,
                                            ),
                                            RowDetails(
                                              det1: 'Harga (per Tiket)',
                                              det2: r"$ " +
                                                  widget.booking!.price!
                                                      .toString(),
                                              clr: kBlackColor,
                                              weight: semiBold,
                                            ),
                                            RowDetails(
                                              det1: 'Total Harga',
                                              det2: r"$ " +
                                                  "${jml * widget.booking!.price!}",
                                              clr: kBlueColor,
                                              weight: semiBold,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                            context) =>
                                                        SimpleDialog(
                                                          title: Text(
                                                              "Metode Pembayaran",
                                                              style:
                                                                  blackTextStyle
                                                                      .copyWith(
                                                                fontWeight:
                                                                    semiBold,
                                                              )),
                                                          children: [
                                                            ListTile(
                                                              leading: Image.asset(
                                                                  "assets/icon_balance.png",
                                                                  height: 45),
                                                              title: Text(
                                                                  "Account Balance",
                                                                  style:
                                                                      blackTextStyle),
                                                              onTap: () {
                                                                setState(() {
                                                                  payment =
                                                                      "Account Balance";
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Image.asset(
                                                                  "assets/ovo.png"),
                                                              title: Text("OVO",
                                                                  style:
                                                                      blackTextStyle),
                                                              onTap: () {
                                                                setState(() {
                                                                  payment =
                                                                      "OVO";
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Image.asset(
                                                                  "assets/bca.png"),
                                                              title: Text(
                                                                  "Bank Central Asia",
                                                                  style:
                                                                      blackTextStyle),
                                                              onTap: () {
                                                                setState(() {
                                                                  payment =
                                                                      "Bank Central Asia";
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Image.asset(
                                                                  "assets/jenius.png"),
                                                              title: Text(
                                                                  "Jenius",
                                                                  style:
                                                                      blackTextStyle),
                                                              onTap: () {
                                                                setState(() {
                                                                  payment =
                                                                      "Jenius";
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                            ListTile(
                                                              leading: Image.asset(
                                                                  "assets/paypal.png"),
                                                              title: Text(
                                                                  "PayPal",
                                                                  style:
                                                                      blackTextStyle),
                                                              onTap: () {
                                                                setState(() {
                                                                  payment =
                                                                      "PayPal";
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                            ),
                                                          ],
                                                        ));
                                              },
                                              child: RowDetails(
                                                det1: 'Metode Pembayaran',
                                                det2: payment,
                                                clr: (payment ==
                                                        'Pilih Metode\nPembayaran')
                                                    ? kRedColor
                                                    : kBlackColor,
                                                weight: semiBold,
                                              ),
                                            ),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    SizedBox(
                                      height: 54,
                                      child: TextButton(
                                        onPressed: () {
                                          if ((userState.user.balance! >=
                                                  (jml *
                                                      widget.booking!
                                                          .price!)) &&
                                              time !=
                                                  'Tap to Select the Date' &&
                                              payment == 'Account Balance') {
                                            Alert(
                                              context: context,
                                              type: AlertType.warning,
                                              title: "Book Now?",
                                              desc:
                                                  "Make Sure All of Your Data is Right!",
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  color: kRedColor,
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                DialogButton(
                                                  onPressed: () {
                                                    // FirebaseFirestore.instance
                                                    //     .runTransaction(
                                                    //         (transaction) async {
                                                    //   CollectionReference
                                                    //       reference =
                                                    //       FirebaseFirestore
                                                    //           .instance
                                                    //           .collection(
                                                    //               "dataTiket");
                                                    //   await reference.add({
                                                    //     "user_id":
                                                    //         userState.user.id,
                                                    //     "Place": widget
                                                    //         .booking!.name!,
                                                    //     "Date": time,
                                                    //     "Price":
                                                    //         "${jml * widget.booking!.price!}",
                                                    //     "Traveler": jml,
                                                    //     "Payment": payment
                                                    //   });
                                                    // });

                                                            context
                                                    .read<PageBloc>()
                                                    .add(GoToSuccessPage(
                                                        userState.user));
                                                  },
                                                  width: 180,
                                                  child: Text(
                                                    "Book!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ).show();
                                          } else if (time !=
                                                  'Tap to Select the Date' &&
                                              payment != 'Account Balance' &&
                                              payment !=
                                                  'Pilih Metode\nPembayaran') {
                                            Alert(
                                              context: context,
                                              type: AlertType.warning,
                                              title: "Book Now?",
                                              desc:
                                                  "Make Sure All of Your Data is Right!",
                                              style: AlertStyle(
                                                titleStyle:
                                                    blackTextStyle.copyWith(
                                                  fontWeight: semiBold,
                                                ),
                                                descStyle: greyTextStyle,
                                              ),
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(),
                                                  color: kRedColor,
                                                  child: Text(
                                                    "Cancel",
                                                    style:
                                                        GoogleFonts.poppins(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 20),
                                                  ),
                                                ),
                                                DialogButton(
                                        
                                                  onPressed: () {
                                                    // FirebaseFirestore.instance
                                                    //     .runTransaction(
                                                    //         (transaction) async {
                                                    //   CollectionReference
                                                    //       reference =
                                                    //       FirebaseFirestore
                                                    //           .instance
                                                    //           .collection(
                                                    //               "dataTiket");
                                                    //   await reference.add({
                                                    //     "user_id":
                                                    //         userState.user.id,
                                                    //     "Place": widget
                                                    //         .booking!.name!,
                                                    //     "Date": time,
                                                    //     "Price":
                                                    //         "${jml * widget.booking!.price!}",
                                                    //     "Traveler": jml,
                                                    //     "Payment": payment
                                                    //   });
                                                    // });
                                                     context
                                                      .read<PageBloc>()
                                                      .add(GoToSuccessPage(
                                                          userState.user));
                                                    // context
                                                    //     .read<PageBloc>()
                                                    //     .close();
                                                  },
                                                  width: 180,
                                                  child: Text(
                                                    "Book!",
                                                    style:
                                                        GoogleFonts.poppins(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ).show();
                                          } else {
                                            Alert(
                                              context: context,
                                              type: AlertType.error,
                                              title: "PAYMENT FAILED",
                                              style: AlertStyle(
                                                titleStyle:
                                                    blackTextStyle.copyWith(
                                                  fontWeight: semiBold,
                                                ),
                                                descStyle: greyTextStyle,
                                              ),
                                              desc:
                                                  "Check your Date or Balance!",
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () => customLaunch(
                                                      "https://wa.me/+62822-9714-5285?text=Hey,%20I%20Want%20to%20Refill%20my%20Vacation%20App%20Balance,%20Please"),
                                                  width: 120,
                                                  child: Text(
                                                    "Charge",
                                                    style:
                                                        GoogleFonts.poppins(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 20),
                                                  ),
                                                )
                                              ],
                                            ).show();
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          backgroundColor: kBlueColor,
                                        ),
                                        child: Text(
                                          'Pay Now',
                                          style: whiteTextStyle.copyWith(
                                            fontSize: 16,
                                            fontWeight: semiBold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              } else {
                                return SpinKitFadingCircle(
                                  color: kBlueColor,
                                  size: 50,
                                );
                              }
                            }))
                      ],
                    )),
              ]),
            )));
  }
}
