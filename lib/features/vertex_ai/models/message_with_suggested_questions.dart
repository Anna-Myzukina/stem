// class MessageWithSuggestionModel {
//   String name = '';
//   String description = '';
//   List<String> suggestedQuestions = [];

//   MessageWithSuggestionModel({
//     required this.name,
//     required this.description,
//     required this.suggestedQuestions,
//   });

//   MessageWithSuggestionModel.fromJson(Map<String, dynamic> jsonMap) {
//     String localName;
//     String localDescription;
//     List<dynamic> localSuggestedQuestions;

//     {
//       'name': localName,
//       'description': localDescription,
//       'suggestedQuestions': localSuggestedQuestions,
//     } = jsonMap;

//     name = localName;
//     description = localDescription;
//     suggestedQuestions = List<String>.from(localSuggestedQuestions);
//   }

//   @override
//   String toString() =>
//       'Metadata(name: $name, description: $description, suggestedQuestions: $suggestedQuestions)';
// }