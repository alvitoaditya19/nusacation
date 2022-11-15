part of 'pages.dart';

class AkomodasiTicket extends StatelessWidget {
  const AkomodasiTicket({super.key});

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
                              .collection("dataTiketAkomodasi")
                              .where('user_id', isEqualTo: userState.user.id)
                              .snapshots(),
                          builder: (_, snapshot) {
                            if (!snapshot.hasData){
                              return SpinKitCircle(
                                  color: kBlueColor, size: 100);}
                            else if (snapshot.data!.size.bitLength == 0) {
                              return Center(
                                child: Text('Kamu Belum Memiliki Tiket Akomodasi',
                                    style: grey3TextStyle),
                              );
                            }
                            return AkomTicketList(
                                akomTicket: snapshot.data!.docs);
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
            )
          ],
        ),
      ),
    );
  }
}

class AkomTicketList extends StatelessWidget {
  final List<DocumentSnapshot> akomTicket;

  AkomTicketList({super.key, required this.akomTicket});
  var whatsapp = "+6282297145285";

  void customLaunch(command) async {
    await launch(command);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: akomTicket.length,
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
                  baseColor: Colors.cyan[50],
                  expandedColor: Color.fromARGB(255, 237, 229, 229),
                  key: key,
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                        NetworkImage(akomTicket[index]["Gambar"].toString()),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(akomTicket[index]["Place"].toString()),
                  subtitle: Text("TIKET WISATA NON PAKET"),
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
                              akomTicket[index]["Date"].toString() +
                              "\nJumlah Pengunjung : " +
                              akomTicket[index]["Traveler"].toString() +
                              "\nTotal Harga : Rp. " +
                              akomTicket[index]["Price"].toString() +
                              "\nMetode Pembayaran : " +
                              akomTicket[index]["Payment"].toString(),
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
                                              )),
                                        ),
                                        children: [
                                          Image.asset('assets/qrcode.png')
                                        ],
                                      ));
                            },
                            child: Icon(Icons.qr_code_scanner),
                          ),
                          GestureDetector(
                            onTap: () {
                              customLaunch(
                                  "https://wa.me/+62822-9714-5285?text=Halo,%20Saya%20Ingin%20Konfirmasi%20Pemesanan%20Saya");
                            },
                            child: Icon(Icons.chat_outlined),
                          )
                        ])
                  ],
                ),
              ),
            ],
          );
        });
  }
}
