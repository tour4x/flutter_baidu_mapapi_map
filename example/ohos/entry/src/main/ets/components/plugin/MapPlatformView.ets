import {
  BinaryMessenger,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
  PlatformView,
  StandardMethodCodec
} from '@ohos/flutter_ohos';
import { Params } from '@ohos/flutter_ohos/src/main/ets/plugin/platform/PlatformView';
import { common } from '@kit.AbilityKit';
import { LocationLayer, MapComponent, MapController, MapOptions, SysEnum, MapEvent, Event, EventBundle } from '@bdmap/map';
import { AsyncCallback, emitter } from '@kit.BasicServicesKit';
import Constants from './Constants';
import { MarkerHandler } from './handlers/MarkerHandler';
import { OverlayHandler } from './handlers/OverlayHandler';
import { MapStateHandler } from './handlers/MapStateHandler';
import { LocationLayerHandler } from './handlers/LocationLayerHandler';
import { CoordTrans, LatLng } from '@bdmap/base';

export class MapPlatformView extends PlatformView implements MethodCallHandler {
  methodChannel: MethodChannel;
  mapController: MapController | null = null;
  callback?: AsyncCallback<MapController>;
  mapOpt: MapOptions;

  ///定位图层
  loc:LocationLayer|null = null


  ///handler
  locationLayerHandler : LocationLayerHandler = new LocationLayerHandler()
  markerHandler : MarkerHandler = new MarkerHandler()
  mapStateHandler : MapStateHandler = new MapStateHandler()
  overlayHandler : OverlayHandler = new OverlayHandler()

  constructor(context: common.Context, viewId: number, args: ESObject, message: BinaryMessenger) {
    super();
    console.log("nodeController viewId:" + viewId)
    // 注册消息通道，消息通道根据具体需求添加，代码仅作为示例
    this.methodChannel =
      new MethodChannel(message, `${Constants.VIEW_METHOD_CHANNEL_PREFIX}${viewId}`, StandardMethodCodec.INSTANCE);
    this.methodChannel.setMethodCallHandler(this);
    // 地图初始化的回调
    this.callback = async (err, mapController: MapController) => {
      this.mapStateHandler.mapViewDidFinishLoad(this.methodChannel)
      if (!err) {
        // 获取地图的控制器类，用来操作地图
        this.mapController = mapController;
        this.setupMapControllerCallBack(mapController)

        let result = this.mapController.getLayerByTag(SysEnum.LayerTag.LOCATION);
        if(result){
          this.loc = result as LocationLayer
          this.loc.radius = 5
        }

        emitter.emit({ eventId:  Event.LocationCom }, {
          data: {
            show: false,
            mapViewId: this.mapController?.mapViewId
          }
        })
        emitter.emit({ eventId: Event.ScaleCom }, {
          data: {
            show: false,
            mapViewId: this.mapController?.mapViewId
          }
        })
        emitter.emit({ eventId: Event.ZoomCom }, {
          data: {
            show: false,
            mapViewId: this.mapController?.mapViewId
          }
        })
      }
    };
    // showZoomControl: false,
    // zoomLevel: MapMarco.defaultZoomLevel,//
    // maxZoomLevel: MapMarco.maxZoomLevel,//
    // minZoomLevel: MapMarco.minZoomLevel,//
    // mapType: BMFMapType.None,
    // rotateEnabled: false,//
    // overlookEnabled: false,//
    // showMapPoi: false,
    // showIndoorMapPoi: false,
    // backgroundColor: HexColor(_mapBaseInfo.mapBackgroundColor??MapBase.defaultMapColor),

    // this.mapOpt.mapStatus.setCenterPoint(new LatLng(40.03592, 116.340739)); // 设置地图中心点
    this.mapOpt = new MapOptions()
    this.mapOpt.mapStatus.setLevel(args.get('zoomLevel'))
    this.mapOpt.mapStatus.maxZoom = args.get('maxZoomLevel')
    this.mapOpt.mapStatus.minZoom = args.get('minZoomLevel')
    this.mapOpt.rotateGesturesEnabled = args.get('rotateEnabled')
    this.mapOpt.overlookingGesturesEnabled = args.get('overlookEnabled')
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    // 接受Dart侧发来的消息
    let method: string = call.method;
    switch (method) {
        ///地图状态管理
      case MapStateHandler.sMapUpdateMethod:
        this.mapStateHandler.updateMapOptions(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapZoomInMethod:
        this.mapStateHandler.zoomIn(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapGetMapStatusMethod:
        let status : ESObject = this.mapStateHandler.getMapStatus(this.mapController, call.args)
        result.success(status)
        break;
      case MapStateHandler.sMapSetCenterCoordinateMethod:
        this.mapStateHandler.setCenterCoordinate(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapSetCenterZoomMethod:
        this.mapStateHandler.setMapCenterZoom(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapTakeSnapshotMethod:
        this.mapStateHandler.takeSnapshot(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapSetVisibleMapBoundsMethod:
        this.mapStateHandler.setVisibleMapBounds(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapSetVisibleMapBoundsWithPaddingMethod:
        this.mapStateHandler.setVisibleMapBoundsWithPadding(this.mapController, call.args)
        result.success(true)
        break;
      case MapStateHandler.sMapGetZoomLevelMethod:
        let level : ESObject = this.mapStateHandler.getZoomLevel(this.mapController, call.args)
        result.success(level)
        break;
        ///地图标注管理
      case MarkerHandler.sMapAddMarkerMethod:
        this.markerHandler.addMarker(this.mapController, call.args, this.methodChannel);
        result.success(true)
        break;
      case MarkerHandler.sMapAddMarkersMethod:
        this.markerHandler.addMarkers(this.mapController, call.args, this.methodChannel);
        result.success(true)
        break;
      case MarkerHandler.sMapRemoveMarkerMethod:
        this.markerHandler.removeMarker(this.mapController, call.args);
        result.success(true)
        break;
      case MarkerHandler.sMapRemoveMarkersMethod:
        this.markerHandler.removeMarkers(this.mapController, call.args);
        result.success(true)
        break;
      case MarkerHandler.sMapCleanAllMarkersMethod:
        this.markerHandler.cleanAllMarkers();
        result.success(true)
        break;
      case MarkerHandler.sMapUpdateMarkerMemberMethod:
        this.markerHandler.updateMarker(this.mapController, call.args);
        result.success(true)
        break;
        ///定位展示管理
      case LocationLayerHandler.sMapShowUserLocationMethod:
        this.locationLayerHandler.showUserLocation(this.mapController, call.args);
        result.success(true)
        break;
      case LocationLayerHandler.sMapUserTrackingModeMethod:
        this.locationLayerHandler.userTrackingMode(this.mapController, call.args);
        result.success(true)
        break;
      case LocationLayerHandler.sMapUpdateLocationDisplayParamMethod:
        this.locationLayerHandler.updateLocationDisplayParam(this.mapController, call.args);
        result.success(true)
        break;
      case LocationLayerHandler.sMapUpdateLocationDataMethod:
        this.locationLayerHandler.updateLocationData(this.loc, call.args)
        result.success(true)
        break;
        ///地图覆盖物管理
      case OverlayHandler.sMapRemoveOverlayMethod:
        this.overlayHandler.removeOverlay(this.mapController, call.args);
        result.success(true)
        break;
      case OverlayHandler.sMapAddPolylineMethod:
        this.overlayHandler.addPolyline(this.mapController, call.args);
        result.success(true)
        break;
      case OverlayHandler.sAddTileMapMethod:
        this.overlayHandler.addTile(this.mapController, call.args);
        result.success(true)
        break;
      case OverlayHandler.sMapUpdatePolylineMemberMethod:
        this.overlayHandler.updatePolylineMember(call.args);
        result.success(true)
        break;

      default :
        result.notImplemented()

    }
  }

  getView(): WrappedBuilder<[Params]> {
    return new WrappedBuilder(MapBuilder);
  }

  dispose(): void {
    this.overlayHandler.clean()
    this.markerHandler.cleanAllMarkers()
    this.methodChannel.setMethodCallHandler(null)
  }

  setupMapControllerCallBack(mapController: MapController){
    mapController.addEventListener(MapEvent.MAPSTATUSCHANGEFINISH, (event) => {
        let bound = mapController.mapStatus.geoRound
        let ne = CoordTrans.baiduToGcj(bound.ne)
        let sw = CoordTrans.baiduToGcj(bound.sw)
        this.methodChannel.invokeMethod(MapStateHandler.sMapRegionDidChangeWithReasonCallback, {'reason':0,'mapStatus': {
          'fLevel' : mapController.getZoom(),
          'visibleMapBounds': {
            'northeast': {
              'latitude': ne?.lat, 'longitude': ne?.lng
            },
            'southwest': {
              'latitude': sw?.lat, 'longitude': sw?.lng
            }
          }
        }})
    })
    mapController.addEventListener(MapEvent.CLICK, (event) => {
      event = event as EventBundle;
      this.methodChannel.invokeMethod(MapStateHandler.sMapOnClickedMapBlankCallback, {'coord' : {'latitude': event.geo.lat, 'longitude': event.geo.lng}})
    })
    mapController.addEventListener(MapEvent.DOUBLECLICK, (event) => {
      event = event as EventBundle;
      this.methodChannel.invokeMethod(MapStateHandler.sMapOnDoubleClickCallback, {'coord' : {'latitude': event.geo.lat, 'longitude': event.geo.lng}})
    })
  }
}

@Builder
function MapBuilder(param: Params) {
  MapComponent({
    mapOptions: (param.platformView as MapPlatformView).mapOpt,
    onReady: (param.platformView as MapPlatformView).callback
  })
}
