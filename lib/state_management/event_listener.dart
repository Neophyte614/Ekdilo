import 'package:flutter/material.dart';

class Event {
  final String imageUrl;
  final String dateTime;
  final String eventName;
  final String location;
  bool isFavorite;

  Event({
    required this.imageUrl,
    required this.dateTime,
    required this.eventName,
    required this.location,
    this.isFavorite = false,
  });
}

class EventProvider with ChangeNotifier {
  final List<Event> _events = [
    // Add your initial events here
  ];

  List<Event> get events => _events;

  List<Event> get favoriteEvents =>
      _events.where((event) => event.isFavorite).toList();

  void toggleFavoriteStatus(Event event) {
    event.isFavorite = !event.isFavorite;
    notifyListeners();
  }
}
