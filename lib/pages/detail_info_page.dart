part of 'pages.dart';

class DetailInfoPage extends StatelessWidget {
  const DetailInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          bottom: true,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 8, top: 12, bottom: 12, right: 12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kWhiteColor),
                        child: InkWell(
                          onTap: () {
                            context.read<PageBloc>().add(GoToInfoPage());
                          },
                          child: Image.asset(
                            'assets/btn-back.png',
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                        decoration: BoxDecoration(
                          color: kBlueColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(children: [
                          Text(
                            'Travelling',
                            style: whiteTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/ic-fire.png",
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              'Trending 1',
                              style: grey3TextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '10 Tempat Destinasi Wisata terbaik di daera FLores, NTT',
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/img-people.png",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Theresa Mazzie',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          '9-10-2022',
                          style: grey3TextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/img-info1.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Nusa Tenggara Timur adalah sebuah provinsi di Indonesia yang meliputi bagian timur Kepulauan Nusa Tenggara. Provinsi ini memiliki ibu kota di Kota Kupang dan memiliki 22 kabupaten/kota.',
                    style: grey3TextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                     SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Nusa Tenggara Timur sempat dinobatkan sebagai destinasi terbaik di dunia versi Lonely Planet. Berdasarkan kategori bernama Best Value, melihat Nusa Tenggara Timur merupakan destinasi yang akan sustainable.',
                    style: grey3TextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                         SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Saat memasuki kawasan Taman Nasional Komodo, kamu bisa menemukan pantai yang sangat unik. Biasanya, hamparan pasir pantai berwarna putih atau hitam. Anehnya, pantai ini punya hamparan pasir yang berwarna merah muda. Warnanya mencolok banget, apalagi saat terkena sinar matahari.',
                    style: grey3TextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
