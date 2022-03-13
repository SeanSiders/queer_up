// Flutter Imports
import 'package:flutter/material.dart';

// Local Imports
import '../../size_config.dart';

class ExitNowButton extends StatelessWidget {
  const ExitNowButton({
    Key? key,
    this.width = double.infinity,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final double width;
  final String label;
  final Icon icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical * 1.0,
        bottom: SizeConfig.blockSizeVertical * .5,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height: SizeConfig.blockSizeVertical * 8.0,
          width: width,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(SizeConfig.blockSizeHorizontal * 2.5),
            color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Text(
                label,
                style: TextStyle(
                  fontSize: SizeConfig.h1,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
