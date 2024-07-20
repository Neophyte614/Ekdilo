import 'package:flutter/material.dart';
import '../events/charityreggae.dart';
import '../events/outmosphere.dart';
import '../events/rappaholic.dart';
import '../events/globalcitizenconcert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchEvent(),
    );
  }
}

class SearchEvent extends StatefulWidget {
  const SearchEvent({super.key});

  @override
  State<SearchEvent> createState() => _SearchEventState();
}

class _SearchEventState extends State<SearchEvent> {
  List<Widget> eventsList = [
    const Rappaholic(
      id: "Rappaholic",
    ),
    const GlobalCitizenConcert(
      id: "Global Citizen Concert",
    ),
    const OutMosphere(
      id: "Outmosphere",
    ),
    const CharityReggaeFestival(
      id: "Charity Reggae Festival",
    )
  ];

  List<Widget> filteredEvents = [];

  void filterEvents(String query) {
    if (query.isEmpty) {
      filteredEvents = eventsList;
    } else {
      filteredEvents = eventsList.where((artist) {
        return artist.toString().toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  void initState() {
    filteredEvents = eventsList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Events'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}



// Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (text) {
//                 setState(() {
//                   _searchEvent(text);
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search events by name or location',
//               ),
//             ),
//             SizedBox(height: 16),
//             ListView.builder(
//               itemCount: _events.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_events[index]),
//                   onTap: () {
//                     // Navigate to event details page
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage(_events[index])));
//                   },
//                 );
//               },
//             ),
//           ],
//         ),