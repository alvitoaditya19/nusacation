part of 'pages.dart';

class DetailDestinationPage extends StatelessWidget {
  final DestinationModel? destination;

  DetailDestinationPage(this.destination);

  @override
  Widget build(BuildContext context) {
    DestinationModel? dokterData;
    bool isWishlist = context.watch<FavoritBloc>().isWishlist(destination!);

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());

        return true;
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SafeArea(
          bottom: true,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(destination!.imageUrl!),
                  ),
                ),
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 320,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(28),
                      ),
                      color: kBackgroundColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                            top: 30,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      destination!.name!,
                                      style: blackTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: medium,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      destination!.city!,
                                      style: grey3TextStyle.copyWith(
                                        fontSize: 18,
                                        fontWeight: light,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // Text(
                                    //   destination!.spesialis!,
                                    //   style: greyTextStyle.copyWith(
                                    //     fontSize: 18,
                                    //     fontWeight: light,
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 28,
                                    width: 28,
                                    margin: EdgeInsets.only(
                                      right: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/ic-star.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 2,
                                    ),
                                    child: Text(
                                      destination!.rating.toString(),
                                      style: blackTextStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 18,
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kGrey2Color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Harga mulai dari',
                                style: blackTextStyle,
                              ),
                              Text(
                                '\Rp. ' + destination!.price.toString(),
                                style: blueTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: defaultMargin),
                          child: Text(
                            'Fasilitas',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: defaultMargin,
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       FacilityItem(
                        //         name: 'Konsultasi',
                        //         imageUrl: 'assets/icon_chat2.png',
                        //       ),
                        //       FacilityItem(
                        //         name: '10 Jam Kerja',
                        //         imageUrl: 'assets/icon_alarm.png',
                        //       ),
                        //       FacilityItem(
                        //         name: 'Resep Terbaik',
                        //         imageUrl: 'assets/icon_drug.png',
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 18,
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dokter Terkait',
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              // SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   child: Row(
                              //     children: [
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor1.jpg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor2.jpg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor3.jpg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor4.jpg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor5.jpg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor6.jpeg',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor7.png',
                              //       ),
                              //       PopularSpot(
                              //         imageUrl: 'assets/image_doctor8.png',
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 18,
                            left: defaultMargin,
                            right: defaultMargin,
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(defaultMargin),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 16,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                  vertical: 18,
                ),
                child: Row(
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
                          context.read<PageBloc>().add(GoToMainPage());
                        },
                        child: Image.asset(
                          'assets/btn-back.png',
                          width: 28,
                          height: 28,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                        context
                            .read<FavoritBloc>().setProduct(destination!);
                        if (context
                            .read<FavoritBloc>()
                            .isWishlist(destination!)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration( milliseconds: 700),
                              backgroundColor: kBlueColor,
                              content: Text(
                                'Has been added to the Wishlist',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration( milliseconds: 700),

                              backgroundColor: kRedColor,
                              content: Text(
                                'Has been removed from the Wishlist',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        context.watch<FavoritBloc>().isWishlist(destination!)
                            ? 'assets/ic-love-act.png'
                            : 'assets/ic-love-inact.png',
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
