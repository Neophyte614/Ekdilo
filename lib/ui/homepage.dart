import 'package:ekdilo/events/afrochella.dart';
import 'package:ekdilo/events/afronation.dart';
import 'package:ekdilo/events/gospel_awards.dart';
import 'package:ekdilo/events/hobnob.dart';
import 'package:ekdilo/events/night_of_worship.dart';
import 'package:ekdilo/events/promise_land.dart';
import 'package:ekdilo/ui/bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../events/charityreggae.dart';
import '../events/outmosphere.dart';
import '../events/rappaholic.dart';
import '../events/globalcitizenconcert.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
          children: const [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                AfroChellaEvent(
                  id: "Afrochella",
                ),
                NightOfWorship(
                  id: "Night of Worship",
                ),
                SizedBox(height: 10),
                Rappaholic(
                  id: "Rappaholic",
                ),
                SizedBox(
                  height: 10,
                ),
                OutMosphere(
                  id: "Outmosphere",
                ),
                SizedBox(
                  height: 10,
                ),
                GlobalCitizenConcert(
                  id: "Global Citizen Concert",
                ),
                SizedBox(
                  height: 10,
                ),
                Hobnob(
                  id: "Hobnob",
                ),
                SizedBox(height: 10),
                GospelAwards(
                  id: "Gospel Awards",
                ),
                SizedBox(height: 10),
                CharityReggaeFestival(
                  id: "Charity Reggae Festival",
                ),
                SizedBox(
                  height: 10,
                ),
                PromiseLand(
                  id: "Promise Land",
                ),
                SizedBox(
                  height: 10,
                ),
                Afronation(
                  id: "Afronation",
                )
              ],
            ),
          ],
        )),
        bottomNavigationBar: const BottomNavPage());
  }
}
