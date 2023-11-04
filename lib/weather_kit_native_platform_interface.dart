import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:weather_kit_native/models/platform_weather.dart';

import 'weather_kit_native_method_channel.dart';

abstract class WeatherKitNativePlatform extends PlatformInterface {
  /// Constructs a WeatherKitNativePlatform.
  WeatherKitNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static WeatherKitNativePlatform _instance = MethodChannelWeatherKitNative();

  /// The default instance of [WeatherKitNativePlatform] to use.
  ///
  /// Defaults to [MethodChannelWeatherKitNative].
  static WeatherKitNativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WeatherKitNativePlatform] when
  /// they register themselves.
  static set instance(WeatherKitNativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<PlatformWeather?> getCurrentWeather({required double latitude, required double longitude}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
