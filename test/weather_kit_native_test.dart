import 'package:flutter_test/flutter_test.dart';
import 'package:weather_kit_native/weather_kit_native_platform_interface.dart';
import 'package:weather_kit_native/weather_kit_native_method_channel.dart';

void main() {
  final WeatherKitNativePlatform initialPlatform = WeatherKitNativePlatform.instance;

  test('$MethodChannelWeatherKitNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWeatherKitNative>());
  });
}
