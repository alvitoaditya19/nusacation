part of 'pages.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin:
                  EdgeInsets.only(left: defaultMargin, right: defaultMargin),
              child: Column(children: [
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Text(
                    'My Ticket',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: medium,
                    ),
                  ),
                ),

                // DestinationCard()
              ]),
            ),
          ),
        ));
  }
}
