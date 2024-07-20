import 'package:ekdilo/ui/city_page.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _LocationPageContent(),
      ),
    );
  }
}

class _LocationPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HeaderSection(),
        _DescriptionSection(),
        _ButtonSection(),
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 120),
        Image(image: AssetImage("files/images/select_logo.png")),
        SizedBox(height: 30),
        Text(
          "Select Location",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Let's find your next event. Stay in tune with",
          style: TextStyle(color: Color.fromARGB(255, 126, 123, 123)),
        ),
        Text(
          "what's happening in your area",
          style: TextStyle(color: Color.fromARGB(255, 126, 123, 123)),
        ),
      ],
    );
  }
}

class _ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 7, 31, 51),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const CityPage(),
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
            "Choose city",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
