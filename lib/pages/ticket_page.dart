part of 'pages.dart';


class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(child: Text('Destinasi')),
                Tab(child: Text('Paket')),
                Tab(child: Text('Akomodasi')),
              ],
            ),
            title: const Text('Tiket Saya'),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              DestinationTicket(),
              TiketPaket(),
              AkomodasiTicket()
            ],
          ),
        ),
      ),
    );
  }
}
