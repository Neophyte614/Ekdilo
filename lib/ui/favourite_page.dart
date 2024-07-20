import 'package:ekdilo/events/afrochella.dart';
import 'package:ekdilo/events/charityreggae.dart';
import 'package:ekdilo/events/globalcitizenconcert.dart';
import 'package:ekdilo/events/gospel_awards.dart';
import 'package:ekdilo/events/hobnob.dart';
import 'package:ekdilo/events/night_of_worship.dart';
import 'package:ekdilo/events/outmosphere.dart';
import 'package:ekdilo/events/promise_land.dart';
import 'package:ekdilo/events/rappaholic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ekdilo/state_management/favourite_model.dart';
import 'package:ekdilo/events/afronation.dart';
import 'package:ekdilo/ui/bottom_navigation.dart'; // Import bottom navigation bar

// Define the FavouritePage as a StatefulWidget
class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

// Define the state for FavouritePage
class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: const Text('Favourite Items'), // AppBar with title
      ),
      body: Consumer<FavouriteModel>(
        // Consumer listens for changes in FavouriteModel
        builder: (context, favouriteModel, child) {
          final favouriteEvents =
              favouriteModel.favourites; // Get the list of favourite items
          return ListView.builder(
            itemCount: favouriteEvents.length, // Number of items in the list
            itemBuilder: (context, index) {
              // final favouriteEvent =
              //     favouriteEvents[index]; // Get the item at the current index
              switch (favouriteEvents[index]) {
                case "Rappaholic":
                  return Rappaholic(id: favouriteEvents[index]);
                case "Promise Land":
                  return PromiseLand(id: favouriteEvents[index]);
                case "Outmosphere":
                  return OutMosphere(id: favouriteEvents[index]);
                case 'Hobnob':
                  return Hobnob(id: favouriteEvents[index]);
                case 'Gospel Awards':
                  return GospelAwards(id: favouriteEvents[index]);
                case 'Global Citizen Concert':
                  return GlobalCitizenConcert(id: favouriteEvents[index]);
                case 'Afronation':
                  return Afronation(id: favouriteEvents[index]);
                case 'Charity Reggae Festival':
                  return CharityReggaeFestival(id: favouriteEvents[index]);
                case "Afrochella":
                  return AfroChellaEvent(id: favouriteEvents[index]);
                case "Night of Worship":
                  return NightOfWorship(id: favouriteEvents[index]);
                // Add other event types here
                default:
                  return ListTile(
                    title: Text('Unknown event: ${favouriteEvents[index]}'),
                  );
              }
            },
          );
        },
      ),
      bottomNavigationBar: const BottomNavPage(), // Bottom navigation bar
    );
  }
}






// import 'package:ekdilo/ui/bottom_navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:ekdilo/state_management/favourite_model.dart';
// import 'package:provider/provider.dart';

// class FavouritePage extends StatefulWidget {
//   const FavouritePage({super.key});

//   @override
//   State<FavouritePage> createState() => _FavouritePageState();
// }

// class _FavouritePageState extends State<FavouritePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red[100],
//           title: const Text('Favourite'),
//         ),
//         body: Consumer<FavouriteModel>(
//           builder: (context, favouriteModel, child) {
//             final favouriteIds = favouriteModel.favourites;
//             return ListView.builder(
//               itemCount: favouriteIds.length,
//               itemBuilder: (context, index) {
//                 final favouriteId = favouriteIds[index];
//                 return ListTile(
//                   title: Text('Item $favouriteId'),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.delete),
//                     onPressed: () {
//                       favouriteModel.removeFavourite(favouriteId);
//                     },
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//         bottomNavigationBar: const BottomNavPage());
//   }
// }
