import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_kit_native/weather_kit_native_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelWeatherKitNative platform = MethodChannelWeatherKitNative();
  const MethodChannel channel = MethodChannel('weather_kit_native');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });


}
