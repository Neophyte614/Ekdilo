import 'package:ekdilo/ui/payment_page.dart';
import 'package:flutter/material.dart';

int totalPrice = 0;

class TicketType extends StatefulWidget {
  const TicketType({super.key});

  @override
  State<TicketType> createState() => _TicketTypeState();
}

class _TicketTypeState extends State<TicketType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: const [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                'Afrochella',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mon, Apr 18 · 21:00",
                textAlign: TextAlign.center, // Optional: to center the text
              ),
              SizedBox(height: 5),
              Text(
                "Osu, Accra Ghana",
                textAlign: TextAlign.center, // Optional: to center the text
              ),
              SizedBox(height: 50),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TicketItem(
              title: 'Early Bird',
              price: '\$45.00',
              fee: '\$2 Fee',
              salesEnd: 'Sales end on Apr 17, 2022',
              isSoldOut: true,
            ),
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TicketItem(
              title: 'Second Release',
              price: '\$55.00',
              fee: '\$2 Fee',
              salesEnd: 'Sales end on Apr 17, 2022',
              isSoldOut: false,
            ),
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Divider(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TicketItem(
              title: 'General',
              price: '\$65.00',
              fee: '\$2 Fee',
              salesEnd: 'Sales end on Apr 17, 2022',
              isSoldOut: false,
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: const Color.fromARGB(255, 228, 225, 225),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "GHS $totalPrice",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                            const PaymentPage(),
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
                    "Buy",
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

class TicketItem extends StatefulWidget {
  final String title;
  final String price;
  final String fee;
  final String salesEnd;
  final bool isSoldOut;

  const TicketItem({
    super.key,
    required this.title,
    required this.price,
    required this.fee,
    required this.salesEnd,
    required this.isSoldOut,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TicketItemState createState() => _TicketItemState();
}

class _TicketItemState extends State<TicketItem> {
  int selectedValue = 0;

  // void calcualateTotal(tickets) {
  //   totalPrice = selectedValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.price),
                    const TextSpan(text: ' + '),
                    TextSpan(text: widget.fee),
                  ],
                ),
              ),
              Text(widget.salesEnd),
            ],
          ),
        ),
        if (widget.isSoldOut)
          const Text('Sold Out!', style: TextStyle(color: Colors.red))
        else
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(5),
            child: DropdownButton<int>(
              value: selectedValue,
              items: List.generate(10, (index) => index)
                  .map((value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value!;
                });
              },
            ),
          ),
      ],
    );
  }
}
