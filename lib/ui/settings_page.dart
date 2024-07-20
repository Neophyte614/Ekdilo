// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // Entry point of the application
// void main() {
//   runApp(const MyApp());
// }

// // Root widget of the application
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       // Providing the SettingsModel to the widget tree
//       create: (context) => SettingsModel(),
//       child: const MaterialApp(
//         home: SettingsPage(),
//       ),
//     );
//   }
// }

// // Settings model to manage the state of the settings
// class SettingsModel extends ChangeNotifier {
//   bool _notificationsEnabled = true; // State for notifications toggle
//   bool _remindersEnabled = true; // State for reminders toggle
//   String _location = 'New York'; // State for location selection
//   final List<String> _following = []; // State for following list

//   // Getters for the private fields
//   bool get notificationsEnabled => _notificationsEnabled;
//   bool get remindersEnabled => _remindersEnabled;
//   String get location => _location;
//   List<String> get following => _following;

//   // Method to toggle notifications
//   void toggleNotifications(bool value) {
//     _notificationsEnabled = value;
//     notifyListeners(); // Notify listeners to rebuild UI
//   }

//   // Method to toggle reminders
//   void toggleReminders(bool value) {
//     _remindersEnabled = value;
//     notifyListeners(); // Notify listeners to rebuild UI
//   }

//   // Method to set location
//   void setLocation(String value) {
//     _location = value;
//     notifyListeners(); // Notify listeners to rebuild UI
//   }

//   // Method to add a following item
//   void addFollowing(String value) {
//     _following.add(value);
//     notifyListeners(); // Notify listeners to rebuild UI
//   }

//   // Method to remove a following item
//   void removeFollowing(String value) {
//     _following.remove(value);
//     notifyListeners(); // Notify listeners to rebuild UI
//   }
// }

// // Main settings page
// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'), // Title of the app bar
//       ),
//       body: Consumer<SettingsModel>(
//         builder: (context, settings, child) {
//           return ListView(
//             children: <Widget>[
//               ListTile(
//                 title: const Text('Account Settings'),
//                 trailing:
//                     const Icon(Icons.arrow_forward), // Icon for navigation
//                 onTap: () {
//                   // Action on tap, navigate to account settings
//                 },
//               ),
//               SwitchListTile(
//                 title: const Text('Enable Notifications'),
//                 value: settings.notificationsEnabled, // Bind to state
//                 onChanged: (bool value) {
//                   settings.toggleNotifications(value); // Update state
//                 },
//               ),
//               SwitchListTile(
//                 title: const Text('Enable Reminders'),
//                 value: settings.remindersEnabled, // Bind to state
//                 onChanged: (bool value) {
//                   settings.toggleReminders(value); // Update state
//                 },
//               ),
//               ListTile(
//                 title: const Text('Location'),
//                 subtitle: Text(settings.location), // Display current location
//                 onTap: () {
//                   _selectLocation(context); // Show location selection dialog
//                 },
//               ),
//               ListTile(
//                 title: const Text('Following'),
//                 subtitle: Text(
//                     settings.following.join(', ')), // Display followed items
//                 onTap: () {
//                   _manageFollowing(context); // Show manage following dialog
//                 },
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   // Method to show location selection dialog
//   Future<void> _selectLocation(BuildContext context) async {
//     String? location = await showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         String selectedLocation = 'New York'; // Initialize with a default value
//         return AlertDialog(
//           title: const Text('Select Location'),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return DropdownButton<String>(
//                 value: selectedLocation,
//                 items: <String>[
//                   'New York',
//                   'Los Angeles',
//                   'Chicago',
//                   'Houston',
//                   'Phoenix'
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedLocation = newValue!;
//                   });
//                 },
//               );
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close dialog without selecting
//               },
//             ),
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context)
//                     .pop(selectedLocation); // Return selected location
//               },
//             ),
//           ],
//         );
//       },
//     );

//     if (location != null && location.isNotEmpty) {
//       // ignore: use_build_context_synchronously
//       Provider.of<SettingsModel>(context, listen: false)
//           .setLocation(location); // Update location in state
//     }
//   }

//   // Method to show manage following dialog
//   Future<void> _manageFollowing(BuildContext context) async {
//     List<String>? following = await showDialog<List<String>>(
//       context: context,
//       builder: (BuildContext context) {
//         List<String> selectedFollowing = List.from(
//             Provider.of<SettingsModel>(context, listen: false).following);
//         return StatefulBuilder(
//           builder: (BuildContext context, StateSetter setState) {
//             return AlertDialog(
//               title: const Text('Manage Following'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   TextField(
//                     decoration: const InputDecoration(
//                       labelText: 'Add New',
//                     ),
//                     onSubmitted: (String value) {
//                       setState(() {
//                         if (!selectedFollowing.contains(value)) {
//                           selectedFollowing.add(value); // Add to local state
//                         }
//                       });
//                     },
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: selectedFollowing.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                           title: Text(selectedFollowing[index]),
//                           trailing: IconButton(
//                             icon: const Icon(Icons.delete),
//                             onPressed: () {
//                               setState(() {
//                                 selectedFollowing
//                                     .removeAt(index); // Remove from local state
//                               });
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               actions: <Widget>[
//                 TextButton(
//                   child: const Text('Cancel'),
//                   onPressed: () {
//                     Navigator.of(context).pop(); // Close dialog without saving
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('OK'),
//                   onPressed: () {
//                     Navigator.of(context)
//                         .pop(selectedFollowing); // Return selected items
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );

//     if (following != null) {
//       SettingsModel settingsModel =
//           // ignore: use_build_context_synchronously
//           Provider.of<SettingsModel>(context, listen: false);
//       settingsModel._following.clear(); // Clear current following list
//       settingsModel._following
//           .addAll(following); // Update following list with new selection
//       settingsModel.notifyListeners(); // Notify listeners to rebuild UI
//     }
//   }
// }
