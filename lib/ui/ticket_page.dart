import 'package:ekdilo/ui/homepage.dart';
import 'package:ekdilo/ui/favourite_page.dart';
import 'package:ekdilo/ui/profile_page.dart';
import 'package:ekdilo/ui/search_page.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF05043B),
            title: const Text("Tickets",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Upcoming'),
                Tab(text: 'Past Tickets'),
              ],
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          body: const TabBarView(
            children: [
              UpcomingTickets(),
              PastTickets(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const HomePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.home)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SearchPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.receipt)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const FavouritePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const ProfilePage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.person))
                ],
              )),
        ));
  }
}

class UpcomingTickets extends StatelessWidget {
  const UpcomingTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                TicketsEvents(
                  eventDate: "Mon, Apr 18 · 21:00 Pm ",
                  eventName: "Afrochella",
                  iconPath: "files/icons/tickets.png",
                  imagePath: "files/images/Afrochella.jpeg",
                  ticketCount: 2,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TicketsEvents(
                  eventDate: "Thu, Apr 19 · 20.00 Pm",
                  eventName: "Time with KK",
                  iconPath: "files/icons/tickets.png",
                  imagePath: "files/images/Kk.jpeg",
                  ticketCount: 1,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TicketsEvents(
                  eventDate: "Mon, Apr 23 · 20.00 Pm",
                  eventName: "Area Code's Jam",
                  iconPath: "files/icons/tickets.png",
                  imagePath: "files/images/blacko.jpg",
                  ticketCount: 5,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PastTickets extends StatelessWidget {
  const PastTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  child: const Text(
                    "2022",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                PastEvents(
                  eventDate: "Mon, Feb 11 · 21:00 Pm ",
                  eventName: "Burna Boy",
                  iconPath: "files/icons/tickets_old.png",
                  imagePath: "files/images/Burna_boy.jpg",
                  ticketCount: 3,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                PastEvents(
                  eventDate: "Sat, Jan 22 · 21:00 Pm ",
                  eventName: "The Waiters",
                  iconPath: "files/icons/tickets_old.png",
                  imagePath: "files/images/the_waiters.jpeg",
                  ticketCount: 1,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  child: const Text(
                    "2021",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                PastEvents(
                  eventDate: "Thu, May 18 · 21:30 Pm  ",
                  eventName: "Kanye West",
                  iconPath: "files/icons/tickets_old.png",
                  imagePath: "files/images/KANYE.jpg",
                  ticketCount: 1,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                PastEvents(
                  eventDate: "Fri, Mar 2 · 20:30 Pm ",
                  eventName: "Kwesi Arthur",
                  iconPath: "files/icons/tickets_old.png",
                  imagePath: "files/images/kwesi.webp",
                  ticketCount: 1,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                PastEvents(
                  eventDate: "Sat, Dec 25 · 20:30 Pm ",
                  eventName: "Rapperholic",
                  iconPath: "files/icons/tickets_old.png",
                  imagePath: "files/images/Sark.jpg",
                  ticketCount: 1,
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TicketsEvents extends StatelessWidget {
  // Parameters for event details, image paths, and tap callback
  final String eventName;
  final String eventDate;
  final int ticketCount;
  final String iconPath;
  final String imagePath;
  final VoidCallback? onTap;

  // Constructor to initialize the parameters
  const TicketsEvents({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.ticketCount,
    required this.iconPath,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap callback passed as a parameter
      onTap: onTap,
      child: Container(
        // Decoration for border and border radius
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300] ?? Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Container for the icon image
            Container(
              width: 100,
              height: 60,
              margin: const EdgeInsets.only(left: 10),
              child: FittedBox(
                child: Image(image: AssetImage(iconPath)),
              ),
            ),
            // Expanded widget to take available space
            Expanded(
              child: Container(
                height: 110,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event name text
                    Text(
                      eventName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Event date text
                    Text(
                      eventDate,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    // Number of tickets text
                    Text(
                      "$ticketCount Tickets",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            // Container for the event image
            Container(
              width: 100,
              height: 110,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PastEvents extends StatelessWidget {
  // Parameters for event details, image paths, and tap callback
  final String eventName;
  final String eventDate;
  final int ticketCount;
  final String iconPath;
  final String imagePath;
  final VoidCallback? onTap;

  // Constructor to initialize the parameters
  const PastEvents({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.ticketCount,
    required this.iconPath,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap callback passed as a parameter
      onTap: onTap,
      child: Container(
        // Decoration for border and border radius
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey[300] ?? Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Container for the icon image
            Container(
              width: 100,
              height: 60,
              margin: const EdgeInsets.only(left: 10),
              child: FittedBox(
                child: Image(image: AssetImage(iconPath)),
              ),
            ),
            // Expanded widget to take available space
            Expanded(
              child: Container(
                height: 110,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event name text
                    Text(
                      eventName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Event date text
                    Text(
                      eventDate,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const Spacer(),
                    // Number of tickets text
                    Text(
                      "$ticketCount Tickets",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            // Container for the event image
            Container(
              width: 100,
              height: 110,
              margin: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// class AfrochellaTicket extends StatefulWidget {
//   const AfrochellaTicket({super.key});

//   @override
//   State<AfrochellaTicket> createState() => _AfrochellaTicketState();
// }

// class _AfrochellaTicketState extends State<AfrochellaTicket> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: Colors.grey[300] ?? Colors.black,
//               width: 1,
//             )),
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 60,
//               margin: const EdgeInsets.only(
//                 left: 10,
//                 //right: 10,
//               ),
//               child: const FittedBox(
//                 child: Image(image: AssetImage("files/icons/tickets.png")),
//               ),
//             ),
//             Center(
//               child: Container(
//                   height: 110,
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.only(right: 10),
//                   decoration: const BoxDecoration(),
//                   child: const Column(
//                     children: [
//                       Text("Stonebwoy",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           )),
//                       Text(
//                         "Mon, Apr 18 · 21:00 Pm ",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       Spacer(),
//                       Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "2 Tickets",
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ))
//                     ],
//                   )),
//             ),
//             const Spacer(),
//             Container(
//               width: 100,
//               height: 110,
//               margin: const EdgeInsets.only(
//                 left: 10,
//                 //right: 10,
//               ),
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                   image: DecorationImage(
//                     image: AssetImage("files/images/Afrochella.jpeg"),
//                     fit: BoxFit.cover,
//                   )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
