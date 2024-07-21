import 'package:ekdilo/events/afrochella.dart';
import 'package:ekdilo/events/afronation.dart';
import 'package:ekdilo/events/charityreggae.dart';
import 'package:ekdilo/events/globalcitizenconcert.dart';
import 'package:ekdilo/events/gospel_awards.dart';
import 'package:ekdilo/events/hobnob.dart';
import 'package:ekdilo/events/night_of_worship.dart';
import 'package:ekdilo/events/outmosphere.dart';
import 'package:ekdilo/events/promise_land.dart';
import 'package:ekdilo/events/rappaholic.dart';
import 'package:ekdilo/ui/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<String> artists = [
    "Afrochella",
    "Night of Worship",
    "Rappaholic",
    "Outmosphere",
    "Global Citizen Concert",
    "HobNob",
    "Modern Gospel Awards",
    "Charity Reggae Festival",
    "Promise Land",
    "Afronation",
  ];

  List<String> filteredArtists = [];

  void filterArtists(String query) {
    setState(() {
      filteredArtists = artists
          .where((artist) => artist.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    filteredArtists = artists;
    super.initState();
  }

  void navigateToPage(String artist) {
    switch (artist) {
      case "Global Citizen Concert":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const GlobalCitizenConcertPage()));
        break;
      case "Outmosphere":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OutMospherePage()));
        break;
      case "Night of Worship":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const NightOfWorshipPage()));
        break;
      case "Charity Reggae Festival":
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CharityReggaeFestivalPage()));
        break;
      case "Afrochella":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AfrochellaPage()));
        break;
      case "Rappaholic":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RappaholicPage()));
        break;
      case "Afronation":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AfronationEvent()));
        break;
      case "Modern Gospel Awards":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const GospelAwardsPage()));
        break;
      case "HobNob":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HobnobPage()));
        break;
      case "Promise Land":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PromiseLandPage()));
        break;
      // Add more cases for other artists and their respective pages
      default:
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Page not available for $artist')));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 15),
              child: TextFormField(
                controller: _searchController,
                autocorrect: true,
                onChanged: filterArtists,
                decoration: const InputDecoration(
                  hintText: "Enter search item here...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              // child: TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Search for',
              //     suffixIcon: IconButton(
              //         onPressed: () {}, icon: const Icon(Icons.search)),
              //   ),
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Searches',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SortDropDown(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: filteredArtists.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: InkWell(
                        onTap: () {
                          navigateToPage(filteredArtists[index]);
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red[100]),
                            child: Text(filteredArtists[index])),
                      ),
                    );
                  }),
            )
          ],
        ),
        bottomNavigationBar: const BottomNavPage());
  }
}

class SortDropDown extends StatefulWidget {
  const SortDropDown({super.key});

  @override
  State<SortDropDown> createState() => _SortDropDownState();
}

class _SortDropDownState extends State<SortDropDown> {
  String _sortValue = "Popularity";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _sortValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.blue[400],
      ),
      onChanged: (String? newValue) {
        setState(() {
          _sortValue = newValue!;
        });
      },
      items: <String>['Popularity', 'Date', 'Location', 'Alphabetical']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
