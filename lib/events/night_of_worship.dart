import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:share_plus/share_plus.dart';

class NightOfWorship extends StatefulWidget {
  final String id;

  const NightOfWorship({super.key, required this.id});

  @override
  State<NightOfWorship> createState() => _NightOfWorshipState();
}

class _NightOfWorshipState extends State<NightOfWorship> {
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
                  const NightOfWorshipPage(),
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
                    image: AssetImage("files/images/worship.jpg"),
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Container(
                  height: 110,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  margin: const EdgeInsets.only(right: 0),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("21st July"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Text("Night Of Worship",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
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
                                      "Don't miss an Amazing opportunity to have a blast with the Stars at Afronation\n Happening live at Lifecity Chapel Auditorium \nDownload Ekdilo app for more information here",
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
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                            ),
                            Text("Lifecity Chapel Auditorium")
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

class NightOfWorshipPage extends StatefulWidget {
  const NightOfWorshipPage({super.key});

  @override
  State<NightOfWorshipPage> createState() => _NightOfWorshipPageState();
}

class _NightOfWorshipPageState extends State<NightOfWorshipPage> {
  // ADDING EVENT TO THE CALENDAR.
  final Event nightOfWorshipToCalendar = Event(
    title: "Night of Worship",
    startDate: DateTime(2024, 7, 21, 16, 0),
    endDate: DateTime(2024, 7, 21, 22, 0),
    location: "Life City Chapel Auditorium, Ayimensah",
    description:
        "Join us for an unforgettable Night of Worship & Honor on July 21st, 2024, at the Lifecity Chapel Auditorium in Ayimensah.",
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
                      'files/images/nightofworship.webp',
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
                                  "Don't miss an Amazing opportunity to have a blast with the Stars at Afronation\n Happening live at Lifecity Chapel Auditorium \nDownload Ekdilo app for more information here",
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
                    "Night of Worship",
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
                                    "21st July",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("16 : 00"),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Add2Calendar.addEvent2Cal(
                                          nightOfWorshipToCalendar);
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
                                    "Lifecity Chapel Auditorium, Ayimensah",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("Kumasi, Ghana"),
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
                        "Join us for an unforgettable Night of Worship & Honor on July 21st, 2024, at the Lifecity Chapel Auditorium in Ayimensah. Hosted by Wendy Fory, this evening promises to be a soul-stirring experience, featuring guest ministers Chris Ametepe, Jacquline Oforiwaa-Amanfo, Minister Success, Nii Praiz, Jonas Botchwey, and many more. With performances by the Genesis Choir and other talented artists, this event will uplift and inspire your spirit. The night begins at 4:00 pm, and admission is free, but seats are limited, so secure yours now for an evening of worship and reverence.")
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
                  Text("Free to all")
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
                    // Navigator.push(
                    //   context,
                    //   PageRouteBuilder(
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         const TicketType(),
                    //     transitionsBuilder:
                    //         (context, animation, secondaryAnimation, child) {
                    //       return FadeTransition(
                    //         opacity: animation,
                    //         child: child,
                    //       );
                    //     },
                    //   ),
                    // );
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
