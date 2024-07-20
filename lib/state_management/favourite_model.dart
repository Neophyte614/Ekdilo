import 'package:flutter/material.dart';

class FavouriteModel with ChangeNotifier {
  final List<String> _favouriteIds = [];

  List<String> get favourites => List.unmodifiable(_favouriteIds);

  bool isFavourite(String id) {
    return _favouriteIds.contains(id);
  }

  void addFavourite(String id) {
    if (!_favouriteIds.contains(id)) {
      _favouriteIds.add(id);
      notifyListeners();
    }
  }

  void removeFavourite(String id) {
    if (_favouriteIds.contains(id)) {
      _favouriteIds.remove(id);
      notifyListeners();
    }
  }
}
