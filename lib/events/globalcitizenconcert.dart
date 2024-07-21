import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:ekdilo/ui/ticket_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_2_calendar/add_2_calendar.dart';

class GlobalCitizenConcert extends StatefulWidget {
  final String id;

  const GlobalCitizenConcert({super.key, required this.id});

  @override
  State<GlobalCitizenConcert> createState() => _GlobalCitizenConcertState();
}

class _GlobalCitizenConcertState extends State<GlobalCitizenConcert> {
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
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 237, 237),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const GlobalCitizenConcertPage(),
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
        child: Row(
          children: [
            Container(
              width: 100,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("files/images/Globalcitizen.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Container(
                  height: 110,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("24th September"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Global Citizen Concert",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const Spacer(),
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
                                  Provider.of<FavouriteModel>(context,
                                          listen: false)
                                      .addFavourite(widget.id);
                                } else {
                                  Provider.of<FavouriteModel>(context,
                                          listen: false)
                                      .removeFavourite(widget.id);
                                }
                              },
                            ),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.share))
                          ],
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Black Star Square")
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class GlobalCitizenConcertPage extends StatefulWidget {
  const GlobalCitizenConcertPage({super.key});

  @override
  State<GlobalCitizenConcertPage> createState() =>
      _GlobalCitizenConcertPageState();
}

class _GlobalCitizenConcertPageState extends State<GlobalCitizenConcertPage> {
  // ADDING EVENT TO THE CALENDAR.
  final Event globalCitizenToCalendar = Event(
    title: "Global Citizen Concert",
    startDate: DateTime(2024, 9, 24, 18, 0),
    endDate: DateTime(2024, 9, 25, 2, 0),
    location: "Black Star Square, Accra",
    description:
        "Ghana’s first-ever Global Citizen Festival marks the 65th anniversary of the country’s independence. It’s in this spirit of self-determination and unity that Accra’s Global Citizen Festival at Black Star Square will bring together artists and world leaders to achieve an ambitious policy agenda focused on empowering girls and women, defending the planet, and creating change.",
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
                      'files/images/Globalcitizen.png',
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
                              // Add your share logic here
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
                    "Global Citizen Concert",
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
                                    "24th November",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("18 : 00 - 02 : 00"),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Add2Calendar.addEvent2Cal(
                                          globalCitizenToCalendar);
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
                                    "Black Star Square",
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
                        "Ghana’s first-ever Global Citizen Festival marks the 65th anniversary of the country’s independence. It’s in this spirit of self-determination and unity that Accra’s Global Citizen Festival at Black Star Square will bring together artists and world leaders to achieve an ambitious policy agenda focused on empowering girls and women, defending the planet, and creating change. Global Citizen organized an outstanding concert at the Black Star Square in Accra, Ghana on September 24, 2022, featuring performances by SZA, Sarkodie, Stormzy, Tems, Usher, and other stars.")
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
                  Text("GHS 40.00 - GHS 200.00")
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
