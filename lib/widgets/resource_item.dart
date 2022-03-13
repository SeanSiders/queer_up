// Flutter Imports
import 'package:flutter/material.dart';

// Local Imports
import '../data/resource.dart';
import '../size_config.dart';

class ResourceItem extends StatelessWidget {
  const ResourceItem({
    Key? key,
    required this.resource,
  }) : super(key: key);

  final Resource resource;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * .5,
        bottom: SizeConfig.blockSizeVertical * .5,
      ),
      child: Container(
          padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 5,
            right: SizeConfig.blockSizeHorizontal * 5,
          ),
          height: SizeConfig.blockSizeVertical * 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  resource.name,
                ),
              ),
              resource.loadProfileImage()
            ],
          )),
    );
  }
}
