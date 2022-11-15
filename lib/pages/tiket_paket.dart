part of 'pages.dart';

class TiketPaket extends StatelessWidget {
  const TiketPaket({super.key});

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
                              .collection("dataTiket")
                              .where('user_id', isEqualTo: userState.user.id)
                              .snapshots(),
                          builder: (_, snapshot) {
                            if (!snapshot.hasData){
                              return SpinKitCircle(
                                  color: kBlueColor, size: 100);
                                  }
                            else if (snapshot.data!.size.bitLength == 0) {
                              return Center(
                                child: Text('Kamu Belum Memiliki Tiket Paket Liburan',
                                    style: grey3TextStyle),
                              );
                            }
                            return PaketDetailTiket(
                                paketTicket: snapshot.data!.docs);
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

class PaketDetailTiket extends StatelessWidget {
  final List<DocumentSnapshot> paketTicket;
  const PaketDetailTiket({super.key, required this.paketTicket});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 60),
        shrinkWrap: true,
        itemCount: paketTicket.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 20.0, left: 20, top: 10, bottom: 10),
                child: TicketWidget(
                  width: 350,
                  height: 400,
                  isCornerRounded: true,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border:
                                  Border.all(width: 1.0, color: Colors.green),
                            ),
                            child: const Center(
                              child: Text(
                                'TERVERIFIKASI',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                          Row(
                            children: const [
                              Text(
                                'NTT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(
                                  Icons.flight,
                                  color: Colors.pink,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'NTB',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          paketTicket[index]["Place"].toString().toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ticketDetailsWidget('Status', 'LUNAS', 'Tanggal',
                                paketTicket[index]["Date"].toString()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, right: 30.0),
                              child: ticketDetailsWidget(
                                  'Jumlah',
                                  paketTicket[index]["Traveler"].toString(),
                                  'Tujuan',
                                  paketTicket[index]["City"].toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: ticketDetailsWidget(
                                  'Total Harga',
                                  'Rp. ' +
                                      paketTicket[index]["Price"].toString() +
                                      '  (' +
                                      paketTicket[index]["Payment"].toString() +
                                      ')',
                                  '',
                                  ''),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 30.0, right: 30.0),
                        child: GestureDetector(
                          onTap: (() {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => SimpleDialog(
                                      title: Center(
                                        child: Text("Scan QR Code dibawah Ini",
                                            style: blackTextStyle.copyWith(
                                              fontWeight: semiBold,
                                            )),
                                      ),
                                      children: [
                                        Image.asset('assets/qrcode.png')
                                      ],
                                    ));
                          }),
                          child: Center(
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/qrcode.png'),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
