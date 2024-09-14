import {
  BinaryMessenger,
  FlutterPlugin,
  FlutterPluginBinding,
  StandardMessageCodec,
} from '@ohos/flutter_ohos';
import Constants from './Constants';
import { MapViewFactory } from './MapViewFactory';

/** FlutterBaiduMapapiMapPlugin **/
export default class FlutterBaiduMapapiMapPlugin implements FlutterPlugin {
  constructor() {
  }

  getUniqueClassName(): string {
    return "FlutterBaiduMapapiMapPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {

    // this.channel = new MethodChannel(binding.getBinaryMessenger(), "flutter_baidu_mapapi_map");
    // this.channel.setMethodCallHandler(this)

    let mMessenger: BinaryMessenger = binding.getBinaryMessenger();

    binding.getPlatformViewRegistry().registerViewFactory(
      Constants.ViewType_SMapView,
      new MapViewFactory(mMessenger, StandardMessageCodec.INSTANCE));

  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    // if (this.channel != null) {
    //   this.channel.setMethodCallHandler(null)
    // }
  }

  // onMethodCall(call: MethodCall, result: MethodResult): void {
  //   if (call.method == "getPlatformVersion") {
  //     result.success("OpenHarmony ^ ^ ")
  //   } else {
  //     result.notImplemented()
  //   }
  // }
}