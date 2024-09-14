import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_baidu_mapapi_map_method_channel.dart';

abstract class FlutterBaiduMapapiMapPlatform extends PlatformInterface {
  /// Constructs a FlutterBaiduMapapiMapPlatform.
  FlutterBaiduMapapiMapPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBaiduMapapiMapPlatform _instance = MethodChannelFlutterBaiduMapapiMap();

  /// The default instance of [FlutterBaiduMapapiMapPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBaiduMapapiMap].
  static FlutterBaiduMapapiMapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBaiduMapapiMapPlatform] when
  /// they register themselves.
  static set instance(FlutterBaiduMapapiMapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
