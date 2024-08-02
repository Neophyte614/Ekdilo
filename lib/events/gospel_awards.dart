import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:ekdilo/ui/ticket_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:share_plus/share_plus.dart';

class GospelAwards extends StatefulWidget {
  final String id;

  const GospelAwards({super.key, required this.id});

  @override
  State<GospelAwards> createState() => _GospelAwardsState();
}

class _GospelAwardsState extends State<GospelAwards> {
  bool _isFavourite = false;
  @override
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
                  const GospelAwardsPage(),
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
                    image: AssetImage("files/images/gospel.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Container(
                  height: 110,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("28th September"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("Gospel Awards",
                                  style: TextStyle(
                                    fontSize: 18,
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
                                onPressed: () {
                                  Share.share(
                                      "Come for an eventful night at Modern Gospel Awards.\nHappening live at Accra City Hall. \nDownload Ekdilo app for more information here",
                                      subject: "Night of Worship");
                                },
                                icon: const Icon(Icons.share))
                          ],
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Accra City Hall")
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

class GospelAwardsPage extends StatefulWidget {
  const GospelAwardsPage({super.key});

  @override
  State<GospelAwardsPage> createState() => _GospelAwardsPageState();
}

class _GospelAwardsPageState extends State<GospelAwardsPage> {
  // ADDING EVENT TO THE CALENDAR.
  final Event gospelAwardsToCalendar = Event(
    title: "Modern Gospel Awards",
    startDate: DateTime(2024, 9, 28, 18, 0),
    endDate: DateTime(2024, 9, 28, 23, 0),
    location: "Accra City Hall",
    description:
        "Modern Gospel Awards have seen great personalities and talents over the years in the gospel industry who holds the gospel music in high esteem.",
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
                      'files/images/gospel_awards.jpg',
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
                                  "Come for an eventful night at Modern Gospel Awards.\nHappening live at Accra City Hall. \nDownload Ekdilo app for more information here",
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
                    "Modern Gospel Awards",
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
                                    "28th September",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("18 : 00 to 23 : 00 "),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Add2Calendar.addEvent2Cal(
                                          gospelAwardsToCalendar);
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
                                    "Accra City Hall",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text(
                                      "Omanye Aba Hall, HQ2W+9HV, Accra, Ghana"),
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
                        "Modern Gospel Awards have seen great personalities and talents over the years in the gospel industry who holds the gospel music in high esteem. Many of them made great impact and are still making greater impacts in the lives of many people with their songs through motivation and inspiration.Their immerse contribution can never be overlook and need massive recognition. As an award scheme which has the gospel music industry at heart there’s the need to geared up and put respect honor and recognition on these great and hardworking musicians and all the workers in the Gospel Vineyard. With regards to building a strong effective and vibrant Gospel Music Industry accross the globe It is the vision of this great award scheme to honor and reward the hardworking Gospel Creatives who are putting Ghana Africa and the world Gospel Music on the Map.")
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
