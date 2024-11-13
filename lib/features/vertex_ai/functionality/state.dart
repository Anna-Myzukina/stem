// import 'package:flutter/material.dart';

// import '../models/message_with_suggested_questions.dart';


// class AppState extends ChangeNotifier {
//   MessageWithSuggestionModel? metadata;

//   void updateMetadata(MessageWithSuggestionModel newMetadata) {
//     metadata = newMetadata;
//     notifyListeners();
//   }

//   void clearMetadata() {
//     metadata = null;
//     notifyListeners();
//   }
// }

// class ThemeNotifier extends ChangeNotifier {
//   bool darkMode = false;

//   Brightness get brightness => darkMode ? Brightness.dark : Brightness.light;

//   void toggleDarkMode(bool val) {
//     darkMode = val;
//     notifyListeners();
//   }
// }