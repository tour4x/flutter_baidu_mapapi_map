import { MapController, LatLngBound, WinRound } from '@bdmap/map';
import { Bounds, LatLng } from '@bdmap/base';
import { MethodChannel } from '@ohos/flutter_ohos';

interface FTLatLng {
  'latitude': number;
  'longitude': number;
}

interface FTBounds {
  'southwest': FTLatLng;
  'northeast': FTLatLng;
}

interface FTVisibleMapBounds {
  'visibleMapBounds': FTBounds;
}

export class MapStateHandler extends Object {
  // 更新地图参数
  static sMapUpdateMethod = "flutter_bmfmap/map/updateMapOptions";
  // map放大一级比例尺
  static sMapZoomInMethod = "flutter_bmfmap/map/zoomIn";
  // 获取地图状态
  static sMapGetMapStatusMethod = "flutter_bmfmap/map/getMapStatus";
  // 设定地图中心点坐标
  static sMapSetCenterCoordinateMethod =
    "flutter_bmfmap/map/setCenterCoordinate";
  // 设置地图中心点以及缩放级别
  static sMapSetCenterZoomMethod =
    "flutter_bmfmap/map/setMapCenterZoom";
  // 获得地图当前可视区域截图
  static sMapTakeSnapshotMethod = "flutter_bmfmap/map/takeSnapshot";
  // 设置显示在屏幕中的地图地理范围
  static sMapSetVisibleMapBoundsMethod =
    "flutter_bmfmap/map/setVisibleMapBounds";
  // 设定地图的显示范围,并使mapRect四周保留insets指定的边界区域
  static sMapSetVisibleMapBoundsWithPaddingMethod =
    "flutter_bmfmap/map/setVisibleMapBoundsWithPadding";
  // map加载完成
  static sMapDidLoadCallback =
    "flutter_bmfmap/map/mapViewDidFinishLoad";
  // 获取map的比例尺级别
  static sMapGetZoomLevelMethod = "flutter_bmfmap/map/getZoomLevel";
  // 地图区域改变完成后会调用此接口reason
  static sMapRegionDidChangeWithReasonCallback =
    "flutter_bmfmap/map/mapViewRegionDidChangeWithReason";
  // 点中底图空白处会回调此接口
  static sMapOnClickedMapBlankCallback =
    "flutter_bmfmap/map/mapViewOnClickedMapBlank";
  // 双击地图时会回调此接口
  static sMapOnDoubleClickCallback =
    "flutter_bmfmap/map/mapViewOnDoubleClick";

  updateMapOptions(mapController: MapController | null, args: ESObject) {

  }

  zoomIn(mapController: MapController | null, args: ESObject) {
    mapController?.zoomInOne()
  }

  getMapStatus(mapController: MapController | null, args: ESObject): ESObject {
    if (mapController != null) {
      let bound: LatLngBound = mapController.mapStatus.geoRound
      let sw = bound.sw
      let ne = bound.ne
      if (sw != null && ne != null) {
        return {
          'mapStatus': ({
            'visibleMapBounds': ({
              'southwest': ({
                'latitude': sw.lat,
                'longitude': sw.lng
              } as FTLatLng),
              'northeast': ({ 'latitude': ne.lat, 'longitude': ne.lng } as FTLatLng)
            } as FTBounds)
          } as FTVisibleMapBounds)
        }
      }
    }
    return {}
  }

  setCenterCoordinate(mapController: MapController | null, args: ESObject) {

    let coordinate: ESObject = args.get('coordinate')
    let lat: number = coordinate.get('latitude')
    let lon: number = coordinate.get('longitude')
    let isAnimate: boolean = args.get('animated')
    let animateDuration: number = args.get('animateDurationMs')
    mapController?.setMapCenter(new LatLng(lat, lon), null, isAnimate, animateDuration)

  }

  setMapCenterZoom(mapController: MapController | null, args: ESObject) {
    // 'coordinate': coordinate.toMap(),
    // 'zoom': zoom,
    // 'animateDurationMs': animateDurationMs
    let coordinate: ESObject = args.get('coordinate')
    let lat: number = coordinate.get('latitude')
    let lon: number = coordinate.get('longitude')
    let animateDuration: number = args.get('animateDurationMs')
    let zoom: number = args.get('zoom')
    mapController?.zoomTo(zoom, new LatLng(lat, lon), null)
  }

  takeSnapshot(mapController: MapController | null, args: ESObject) {

  }

  setVisibleMapBounds(mapController: MapController | null, args: ESObject) {
    // visibleMapBounds animated insets
    let visibleMapBounds: ESObject = args.get('visibleMapBounds')
    let animated: boolean = args.get('animated')
    let ne: ESObject = visibleMapBounds.get('northeast') // 'latitude' 'longitude'
    let sw: ESObject = visibleMapBounds.get('southwest')
    let bounds = new Bounds(new LatLng(sw.get('latitude'), sw.get('longitude')),
      new LatLng(ne.get('latitude'), ne.get('longitude')))
    mapController?.fitVisibleMapRect(bounds, new WinRound(0,0,0,0), animated)
  }

  setVisibleMapBoundsWithPadding(mapController: MapController | null, args: ESObject) {
    let visibleMapBounds: ESObject = args.get('visibleMapBounds')
    let animated: boolean = args.get('animated')
    let ne: ESObject = visibleMapBounds.get('northeast') // 'latitude' 'longitude'
    let sw: ESObject = visibleMapBounds.get('southwest')
    let bounds = new Bounds(new LatLng(sw.get('latitude'), sw.get('longitude')),
      new LatLng(ne.get('latitude'), ne.get('longitude')))
    let insets: ESObject = args.get('insets') // 'top' 'left' 'bottom' 'right'
    let inset = new WinRound(insets.get('left'), insets.get('right'), insets.get('top'), insets.get('bottom'),)
    mapController?.fitVisibleMapRect(bounds, inset, animated)
  }

  mapViewDidFinishLoad(methodChannel: MethodChannel) {
    methodChannel.invokeMethod(MapStateHandler.sMapDidLoadCallback, null);
  }

  getZoomLevel(mapController: MapController | null, args: ESObject): ESObject {
    return {'zoomLevel':mapController?.getZoom()}
  }
}
