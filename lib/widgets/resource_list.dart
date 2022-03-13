// Flutter Imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:url_launcher/url_launcher.dart';

// Local Imports
import '../size_config.dart';
import '../data/resource.dart';
import '../widgets/resource_item.dart';

class ResourceList extends StatelessWidget {
  const ResourceList({
    Key? key,
    required this.resources,
  }) : super(key: key);

  final List<Resource> resources;

  void _openResourceUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
          bottom:
              kFloatingActionButtonMargin + SizeConfig.blockSizeVertical * 15),
      itemCount: resources.length,
      itemBuilder: (context, index) {
        return MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            _openResourceUrl(resources[index].url);
          },
          child: ResourceItem(
            resource: resources[index],
          ),
        );
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
