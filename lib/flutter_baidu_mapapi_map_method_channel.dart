import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_baidu_mapapi_map_platform_interface.dart';

/// An implementation of [FlutterBaiduMapapiMapPlatform] that uses method channels.
class MethodChannelFlutterBaiduMapapiMap extends FlutterBaiduMapapiMapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_baidu_mapapi_map');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
