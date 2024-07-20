import 'package:ekdilo/ui/homepage.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TypeCityName(),
        Expanded(child: ListOfCities())
      ],
    ));
  }
}

class TypeCityName extends StatefulWidget {
  const TypeCityName({super.key});

  @override
  State<TypeCityName> createState() => _TypeCityNameState();
}

class _TypeCityNameState extends State<TypeCityName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: TextField(
              decoration: InputDecoration(
            hintText: 'Enter City Name',
            prefixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          )),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Most Searched",
                style: TextStyle(color: Colors.grey),
              )),
        )
      ],
    );
  }
}

class ListOfCities extends StatelessWidget {
  const ListOfCities({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Ahafo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Ashanti',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Bono',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Bono East',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Central',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Eastern',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Greater Accra',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomePage(),
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
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'North East',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Northern',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Oti',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Savannah',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Upper East',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Upper West',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Volta',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Western',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 25, 0),
          child: ListTile(
            title: const Text(
              'Western North',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text('Ghana'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
