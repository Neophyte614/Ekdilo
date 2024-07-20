import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:ekdilo/ui/ticket_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hobnob extends StatefulWidget {
  final String id;

  const Hobnob({super.key, required this.id});

  @override
  State<Hobnob> createState() => _HobnobState();
}

class _HobnobState extends State<Hobnob> {
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
                  const HobnobPage(),
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
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("26th July"),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Text("HobNob Accra",
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
                            Text("Buro")
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

class HobnobPage extends StatefulWidget {
  const HobnobPage({super.key});

  @override
  State<HobnobPage> createState() => _HobnobPageState();
}

class _HobnobPageState extends State<HobnobPage> {
  bool _isFavourite = false;

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
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  _isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      _isFavourite ? Colors.red : Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isFavourite = !_isFavourite;
                                  });
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
                    "HobNob Accra",
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
                                    "26th July",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("17:00 - 22:00 "),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  InkWell(
                                    onTap: () {},
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
                                    "Buro, Accra",
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
                                  Text(
                                      "Fees for tickets purchased are non-refundable"),
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
                        "Hobnob Accra,the Ghana South Africa Business Chamber, and Buro Ghana presents the 4th edition of Hobnob Accra.Hobnob Accra is a networking event exclusively for professionals, the working class, businesspersons, and expatriates. Since 2020, Hobnob Accra has evolved into a business consortium, and various editions of Hobnob Accra have been graced by government officials, such as the former Deputy High Commissioner of Britain to Ghana, Tom Hartley, and supported by businesses and organisations such as the Italian Business Association Ghana, Pan African Tv, Doughman Ghana, and exciting performances by Ghana's top rock band: Dark Suburb and many more...Network, advertise, market your products, and interact both the local and international business community in the heart of Accra at the beautiful Buro-Ghana.For business stands/presentation/marketing/advertisement slots WhatsApp the Hobnob Accra team at: 024 816 5851")
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
