// // utils/widget_mapper.dart
// import 'package:ekdilo/ui/homepage.dart';
// import 'package:flutter/material.dart';

// // Define your widget factory map here
// final Map<String, Widget Function()> widgetFactory = {
//   'sarkodie': () => const Sarkodie(id: 'sarkodie'),
//   // Add other widgets and their constructors here
// };

// // The function to get the widget by ID
// Widget getWidgetById(String id) {
//   final widgetBuilder = widgetFactory[id];
//   if (widgetBuilder != null) {
//     return widgetBuilder();
//   } else {
//     // Return a placeholder or error widget if the id is not found
//     return const SizedBox.shrink();
//   }
// }
