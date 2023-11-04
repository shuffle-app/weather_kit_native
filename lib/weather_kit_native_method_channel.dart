import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weather_kit_native/models/platform_weather.dart';

import 'weather_kit_native_platform_interface.dart';

/// An implementation of [WeatherKitNativePlatform] that uses method channels.
class MethodChannelWeatherKitNative extends WeatherKitNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('weather_kit_native');

  @override
  Future<PlatformWeather?> getCurrentWeather({required double latitude, required double longitude}) async {
    final json = await methodChannel
        .invokeMethod<Map<Object?, Object?>>('getCurrentWeather', {'longitude': longitude, 'latitude': latitude});
    return json == null ? null : PlatformWeather.fromJson(json);
  }
}
