part of "pages.dart";

class TransportaionPage extends StatelessWidget {
  const TransportaionPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _enabled = true;

    Widget vacationSpot() {
      return Container(
        constraints: BoxConstraints(
            minHeight: 100,
            minWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height),
        child: BlocBuilder<TransportationBloc, TransportationState>(
          builder: (_, hotelState) {
            if (hotelState is TransportationLoaded) {
              List<DestinationModel>? transportation= hotelState.transportation;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: transportation!.length,
                itemBuilder: (_, index) => DestinationCard(
                  transportation[index],
                  onTap: () {
                    context
                        .read<PageBloc>()
                        .add(GoToDetailHotelPage(transportation[index]));
                  },
                ),
              );
            } else {
              return LoadingShimmer(_enabled);
            }
          },
        ),
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
                        'Transportation',
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
