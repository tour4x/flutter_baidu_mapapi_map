import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map_platform_interface.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBaiduMapapiMapPlatform
    with MockPlatformInterfaceMixin
    implements FlutterBaiduMapapiMapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBaiduMapapiMapPlatform initialPlatform = FlutterBaiduMapapiMapPlatform.instance;

  test('$MethodChannelFlutterBaiduMapapiMap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBaiduMapapiMap>());
  });

  test('getPlatformVersion', () async {
    FlutterBaiduMapapiMap flutterBaiduMapapiMapPlugin = FlutterBaiduMapapiMap();
    MockFlutterBaiduMapapiMapPlatform fakePlatform = MockFlutterBaiduMapapiMapPlatform();
    FlutterBaiduMapapiMapPlatform.instance = fakePlatform;

    expect(await flutterBaiduMapapiMapPlugin.getPlatformVersion(), '42');
  });
}
