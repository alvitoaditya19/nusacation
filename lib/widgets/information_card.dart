import 'package:flutter/material.dart';
import 'package:nusacation/shared/shared.dart';

class InformationCard extends StatelessWidget {

  const InformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 174,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img-info1.png"))),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flores, NTT',
                            style: greyTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Pulau Komodo Berkunjung',
                            style: blackTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'IDR 421.833',
                            style: blueTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                 
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
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
             ],
            ),
          ),
        ],
      ),
    );
  }
}
