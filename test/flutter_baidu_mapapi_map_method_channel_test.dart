import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map_method_channel.dart';

void main() {
  MethodChannelFlutterBaiduMapapiMap platform = MethodChannelFlutterBaiduMapapiMap();
  const MethodChannel channel = MethodChannel('flutter_baidu_mapapi_map');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
