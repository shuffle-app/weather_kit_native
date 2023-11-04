import 'models/platform_weather.dart';
import 'weather_kit_native_platform_interface.dart';

class WeatherKitNative {
  Future<PlatformWeather?> getCurrentWeather({required double latitude, required double longitude}) {
    return WeatherKitNativePlatform.instance.getCurrentWeather(latitude: latitude, longitude: longitude);
  }
}
