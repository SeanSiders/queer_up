// Dart Imports
import 'dart:io';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package Impots
import 'package:rainbow_color/rainbow_color.dart';

// Local Imports
import '../widgets/resource_list.dart';
import '../widgets/buttons/exit_now_button.dart';
import '../data/resource.dart';
import '../size_config.dart';

class Resources extends StatefulWidget {
  const Resources({
    Key? key,
    required this.title,
    required this.resources,
  }) : super(key: key);

  final String title;
  final List<Resource> resources;

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  final Rainbow _rainbow = Rainbow(spectrum: const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.red,
  ], rangeStart: 0.0, rangeEnd: 300.0);

  // Close the app
  void _closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else {
      exit(0);
    }
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 15), vsync: this);

    animation = Tween<double>(
            begin: _rainbow.rangeStart.toDouble(),
            end: _rainbow.rangeEnd.toDouble())
        .animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize media queries
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, _) => Column(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          _rainbow[animation.value],
                          _rainbow[(50.0 + animation.value) % _rainbow.rangeEnd]
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ResourceList(
        resources: widget.resources,
      ),
      floatingActionButton: ExitNowButton(
        label: 'EXIT APP NOW',
        icon: const Icon(Icons.close),
        onPressed: _closeApp,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
