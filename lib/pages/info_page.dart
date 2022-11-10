part of 'pages.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin),
                  child: Column(children: [
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Informasi',
                          style: blackTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                    InformationCard(),
                    // DestinationCard()
                  ]),
                ),
                SafeArea(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 8, top: 12, bottom: 12, right: 12),
                    margin: EdgeInsets.only(left: defaultMargin, top: 14),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: InkWell(
                      onTap: () {
                        context.read<PageBloc>().add(GoToMainPage());
                      },
                      child: Image.asset(
                        'assets/btn-back.png',
                        width: 28,
                        height: 28,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
