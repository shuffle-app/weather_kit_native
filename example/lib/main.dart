import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:weather_kit_native/models/platform_weather.dart';
import 'package:weather_kit_native/weather_kit_native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PlatformWeather? _platformWeather;
  final _weatherKitNativePlugin = WeatherKitNative();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    PlatformWeather? platformWeather;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformWeather = await _weatherKitNativePlugin.getCurrentWeather(latitude: 51.1, longitude: 1.1);
    } on PlatformException {
      log('catched PlatformException', name: 'WeatherKitNative');
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformWeather = platformWeather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'Got weather: condition ${_platformWeather?.condition} temperature ${_platformWeather?.temperature} isDayLight ${_platformWeather?.isDayLight}'),
        ),
      ),
    );
  }
}
