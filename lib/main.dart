// Dart Imports
import 'dart:convert';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Local Imports
import 'pages/resources.dart';
import '../data/resource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict view orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  List<Resource> resources = List.empty(growable: true);

  String jsonString = await rootBundle.loadString('assets/resources.json');
  List<dynamic> json = jsonDecode(jsonString);
  resources = List.empty(growable: true);

  _loadResource(dynamic resource) => resources.add(Resource.fromJson(resource));

  json.forEach(_loadResource);

  runApp(QueerUpApp(
    resources: resources,
  ));
}

class QueerUpApp extends StatelessWidget {
  const QueerUpApp({
    Key? key,
    required this.resources,
  }) : super(key: key);

  final List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queer Up',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Futura',
      ),

      home: Resources(
        title: 'Queer Up',
        resources: resources,
      ),

      //Removes the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
