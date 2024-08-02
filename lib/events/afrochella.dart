import 'package:ekdilo/ui/ticket_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:share_plus/share_plus.dart';

import '../state_management/favourite_model.dart';

class AfroChellaEvent extends StatefulWidget {
  final String id;

  const AfroChellaEvent({super.key, required this.id});

  @override
  State<AfroChellaEvent> createState() => _AfroChellaEventState();
}

class _AfroChellaEventState extends State<AfroChellaEvent> {
  bool _isFavourite = false;

  @override
  void initState() {
    super.initState();
    _isFavourite = Provider.of<FavouriteModel>(context, listen: false)
        .isFavourite(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 221, 213, 213),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AfrochellaPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image(image: AssetImage("files/images/Afrochella.jpeg")),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text("28th - 29th December · 21:00 PM"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "AfroChella",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.black54),
                    SizedBox(width: 5),
                    Text("El Wak Stadium, Accra"),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, bottom: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                            _isFavourite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavourite ? Colors.red : null),
                        onPressed: () {
                          setState(() {
                            _isFavourite = !_isFavourite;
                          });
                          if (_isFavourite) {
                            Provider.of<FavouriteModel>(context, listen: false)
                                .addFavourite(widget.id);
                          } else {
                            Provider.of<FavouriteModel>(context, listen: false)
                                .removeFavourite(widget.id);
                          }
                        },
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {
                          Share.share(
                              "Come experience an eventful night with 1Gad Stonebwoy.\nHappening live at El Wak Sports Stadium. \nDownload Ekdilo app for more information here",
                              subject: "Night of Worship");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AfrochellaPage extends StatefulWidget {
  const AfrochellaPage({super.key});

  @override
  State<AfrochellaPage> createState() => _AfrochellaPageState();
}

class _AfrochellaPageState extends State<AfrochellaPage> {
  // ADDING EVENT TO THE CALENDAR.
  final Event afrochellaToCalendar = Event(
    title: "Afrochella",
    startDate: DateTime(2024, 9, 28, 21, 0),
    endDate: DateTime(2024, 9, 29, 5, 0),
    location: "El Wak Stadium, Accra, Ghana",
    description:
        "Afrochella is a vibrant music festival celebrating African music, art, and culture. It's a VICE Media and Accra-based startup, EchoHouse, production.",
    timeZone: "GMT",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 190,
                color: Colors.red,
                child: Stack(
                  children: [
                    Image.asset(
                      'files/images/Afrochella.jpeg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    Positioned(
                      top: 145,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Share.share(
                                  "Come experience an eventful night with 1Gad Stonebwoy.\nHappening live at El Wak Sports Stadium. \nDownload Ekdilo app for more information here",
                                  subject: "Night of Worship");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Afrochella",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Aligns all children to the left
                                children: [
                                  const Text(
                                    "28th - 29th December",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("21:00 - 03:00 "),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Add2Calendar.addEvent2Cal(
                                          afrochellaToCalendar);
                                    },
                                    child: const Text(
                                      "Add to Calendar",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Aligns all children to the left
                                children: [
                                  const Text(
                                    "El Wak Sports Stadium",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("Accra, Ghana"),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "View on Map",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Aligns all children to the left
                                children: [
                                  Text(
                                    "Refund Policy",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text("Purchases are non-refundable"),
                                  SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment:
                    Alignment.centerLeft, // Align the content to the left
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to the left
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        "Afrochella is a vibrant music festival celebrating African music, art, and culture. It's a VICE Media and Accra-based startup, EchoHouse, production. The festival showcases a diverse range of talented artists, musicians, and DJs from Africa and the diaspora, featuring genres like Afrobeats, Highlife, Afrohouse, and more. Afrochella is held annually at the El Wak Stadium in Accra, Ghana. The festival typically takes place over two days in December, coinciding with Ghana's festive season and the Year of Return celebrations")
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: const Color.fromARGB(255, 228, 225, 225),
        child: Row(
          children: [
            SizedBox(
              // Take up half of the screen
              width: MediaQuery.of(context).size.width / 2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text("GHS 30.00 - GHS 150.00")
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        //horizontal: 20,
                        vertical: 20,
                      ),
                      backgroundColor: const Color(0xFF05043B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const TicketType(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Tickets",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
