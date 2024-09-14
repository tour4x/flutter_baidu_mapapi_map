import { LocationLayer, MapController } from '@bdmap/map';
import { LatLng } from '@bdmap/base';


export class LocationLayerHandler extends Object {

  // 设定是否显示定位图层
  static sMapShowUserLocationMethod =
    "flutter_bmfmap/userLocation/showUserLocation";
  //
  // 设定定位模式，取值为：BMFUserTrackingMode
  static sMapUserTrackingModeMethod =
    "flutter_bmfmap/userLocation/userTrackingMode";
  //
  // 动态定制我的位置样式
  static sMapUpdateLocationDisplayParamMethod =
    "flutter_bmfmap/userLocation/updateLocationDisplayParam";
  //
  // 动态更新我的位置数据
  static sMapUpdateLocationDataMethod =
    "flutter_bmfmap/userLocation/updateLocationData";

  showUserLocation(mapController: MapController | null, args: ESObject) {

  }

  userTrackingMode(mapController: MapController | null, args: ESObject) {

  }

  updateLocationDisplayParam(mapController: MapController | null, args: ESObject) {

  }

  updateLocationData(loc: LocationLayer|null, args: ESObject) {

    if(loc != null) {
      let userLocation: ESObject = args.get('userLocation')
      let location: ESObject = userLocation.get('location')
      let coordinate: ESObject = location.get('coordinate')
      let lat : number = coordinate.get('latitude')
      let lon : number = coordinate.get('longitude')
      let course : number = location.get('course')

      loc.location = new LatLng(lat, lon);
      loc.direction = course;
    }

  }
}