// Flutter Imports
import 'package:flutter/material.dart';

class Resource {
  const Resource({
    required this.name,
    required this.url,
    required this.facebookID,
    required this.imagePath,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    String name = json['name'];
    return Resource(
      name: name,
      url: json['url'],
      facebookID: json['facebookID'],
      imagePath: getImagePath(name),
    );
  }

  static String getImagePath(String name) {
    return 'assets/images/$name.png';
  }

  Widget loadProfileImage() {
    if (facebookID.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset(
          'assets/images/GayPrideFlag.png',
          fit: BoxFit.fitHeight,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        'https://graph.facebook.com/$facebookID/picture?type=normal',
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/images/GayPrideFlag.png',
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  final String name;
  final String url;
  final String facebookID;
  final String imagePath;
}
