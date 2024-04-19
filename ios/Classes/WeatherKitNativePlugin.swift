import Flutter
import UIKit
import WeatherKit
import CoreLocation

public class WeatherKitNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "weather_kit_native", binaryMessenger: registrar.messenger())
    let instance = WeatherKitNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult)   {
    switch call.method {
    case "getCurrentWeather":
        let myArgs = call.arguments as! [String: Any]
        let currentLocation = CLLocation(latitude: myArgs["latitude"] as! Double,longitude: myArgs["longitude"] as! Double)
        Task {
            await getWeather(currentLocation: currentLocation,result: result)
        }
    case "getWeatherAttribution":
        Task {
        do {
            let service = WeatherService()
            let attribution = try await service.attribution
            if #available(iOS 16.4, *) {
                result(["legalPageURL" : attribution.legalPageURL.absoluteString, "serviceName": attribution.serviceName, "legalAttributionText":attribution.legalAttributionText])
            } else {
                result(["legalPageURL" : attribution.legalPageURL, "serviceName": attribution.serviceName,"legalAttributionText":""])
            }
        } catch {
            result(FlutterError.init(code: "errorGetAttribution", message: "error in obtainong weatherAttribution", details: nil))
                }
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    
    func getWeather(currentLocation:CLLocation, result: @escaping FlutterResult) async {
        do {
            let service = WeatherService()
            let weather = try await service.weather(for: currentLocation)
            result(["temperature":weather.currentWeather.temperature.value,"condition":weather.currentWeather.condition.rawValue,"isDayLight":weather.currentWeather.isDaylight])
        } catch {
            result(FlutterError.init(code: "errorGetCurrentWeather", message: "error in obtainong weather", details: nil))
        }
    }
}
