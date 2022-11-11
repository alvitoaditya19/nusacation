part of "pages.dart";

class HotelsPage extends StatelessWidget {
  const HotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
        Widget vacationSpot() {
      return  Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: listDestination.length,
              itemBuilder: (BuildContext contextt, int index) {
                return DestinationCard(
                    listDestination[index],
             );
          
              },
            ),

            // DestinationCard()
          ],
    
      );
    }
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin),
                  child: Column(children: [
                    SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'Penginapan',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                      SizedBox(
                      height: 20,
                    ),
vacationSpot(),
                    // DestinationCard()
                  ]),
                ),
                
              ),
              SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 12, bottom: 12, right: 12),
                  margin: EdgeInsets.only(left: defaultMargin, top: 14),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kWhiteColor),
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
        ));
  }
}
