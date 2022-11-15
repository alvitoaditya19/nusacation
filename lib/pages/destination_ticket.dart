part of 'pages.dart';

class DestinationTicket extends StatelessWidget {
  const DestinationTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) {
                  if (userState is UserLoaded) {
                    return MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("dataTiketDestinasi")
                              .where('user_id', isEqualTo: userState.user.id)
                              .snapshots(),
                          builder: (_, snapshot) {
                            if (!snapshot.hasData) {
                              return SpinKitCircle(
                                  color: kBlueColor, size: 100);
                            } else if (snapshot.data!.size.bitLength == 0) {
                              return Center(
                                child: Text(
                                    'Kamu Belum Memiliki Tiket Destinasi',
                                    style: grey3TextStyle),
                              );
                            }
                            return DestTicketList(
                                destTicket: snapshot.data!.docs);
                          }),
                    );
                  } else {
                    return SpinKitFadingCircle(
                      color: kBlueColor,
                      size: 50,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestTicketList extends StatelessWidget {
  final List<DocumentSnapshot> destTicket;

  DestTicketList({super.key, required this.destTicket});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: destTicket.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20, top: 10, bottom: 10),
                child: ExpansionTileCard(
                  borderRadius: BorderRadius.circular(10),
                  baseColor: kWhiteColor,
                  expandedColor: Color(0xffC3F8FF),
                  key: key,
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage(destTicket[index]["Gambar"].toString()),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(
                    destTicket[index]["Place"].toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      "Tiket Wisata Non Paket",
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          "Jadwal Kunjungan : " +
                              destTicket[index]["Date"].toString() +
                              "\nJumlah Pengunjung : " +
                              destTicket[index]["Traveler"].toString() +
                              "\nTotal Harga : Rp. " +
                              destTicket[index]["Price"].toString() +
                              "\nMetode Pembayaran : " +
                              destTicket[index]["Payment"].toString(),
                          style: blackTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      SimpleDialog(
                                        title: Center(
                                          child: Text(
                                              "Scan QR Code dibawah Ini",
                                              style: blackTextStyle.copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 16)),
                                        ),
                                        children: [
                                          Image.asset('assets/qrcode.png')
                                        ],
                                      ));
                            },
                            child: Icon(Icons.qr_code_scanner),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          );
        });
  }
}
