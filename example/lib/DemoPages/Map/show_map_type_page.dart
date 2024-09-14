import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_baidu_mapapi_map_example/CustomWidgets/map_appbar.dart';
import 'package:flutter_baidu_mapapi_map_example/CustomWidgets/map_base_page_state.dart';
import 'package:flutter_baidu_mapapi_map_example/DemoPages/Map/show_create_map_page.dart';
import 'package:flutter_baidu_mapapi_map_example/constants.dart';

/// 地图类型示例
class ShowMapTypePage extends StatefulWidget {
  ShowMapTypePage({
    Key? key,
  }) : super(key: key);

  @override
  _ShowMapTypePageState createState() => _ShowMapTypePageState();
}

class _ShowMapTypePageState extends BMFBaseMapState<ShowMapTypePage> {
  BMFMapType mapType = BMFMapType.Standard;
  late BMFMarker? _swPoint = null;
  late BMFMarker? _nePoint = null;
  bool addingPoint = false;
  late BMFCoordinate? southWest = null;

  /// 创建完成回调
  @override
  void onBMFMapCreated(BMFMapController controller) {
    super.onBMFMapCreated(controller);


    /// 地图渲染每一帧画面过程中，以及每次需要重绘地图时（例如添加覆盖物）都会调用此接口
    myMapController.setMapOnDrawMapFrameCallback(
        callback: (BMFMapStatus mapStatus) {
//       print('地图渲染每一帧\n mapStatus = ${mapStatus.toMap()}');
        });

    myMapController.setMapRenderValidDataCallback(
        callback: (bool isValid, int errorCode, String errorMessage) {

          print('渲染状态回调 \n isValid = ${isValid} \n errorCode = ${errorCode} \n errorMessage = ${errorMessage}');

        });

    /// 地图区域即将改变时会调用此接口
    /// mapStatus 地图状态信息
    myMapController.setMapRegionWillChangeCallback(
        callback: (BMFMapStatus mapStatus) {
          print('地图区域即将改变时会调用此接口1\n mapStatus = ${mapStatus.toMap()}');
        });

    /// 地图区域改变完成后会调用此接口
    /// mapStatus 地图状态信息
    myMapController.setMapRegionDidChangeCallback(
        callback: (BMFMapStatus mapStatus) {
          print('地图区域改变完成后会调用此接口2\n mapStatus = ${mapStatus.toMap()}');
        });

    /// 地图区域即将改变时会调用此接口
    /// mapStatus 地图状态信息
    /// reason 地图改变原因
    myMapController.setMapRegionWillChangeWithReasonCallback(callback:
        (BMFMapStatus mapStatus, BMFRegionChangeReason regionChangeReason) {
      print(
          '地图区域即将改变时会调用此接口3\n mapStatus = ${mapStatus.toMap()}\n reason = ${regionChangeReason.index}');
    });

    /// 地图区域改变完成后会调用此接口
    /// mapStatus 地图状态信息
    /// reason 地图改变原因
    myMapController.setMapRegionDidChangeWithReasonCallback(callback:
        (BMFMapStatus mapStatus, BMFRegionChangeReason regionChangeReason) {
      print(
          '地图区域改变完成后会调用此接口4\n mapStatus = ${mapStatus.toMap()}\n reason = ${regionChangeReason.index}');

        if(_swPoint != null) {
          myMapController.removeMarker(_swPoint!);
        }
        if(mapStatus.coordinateBounds?.southwest != null){
          BMFMarker swMarker = BMFMarker.icon(
              icon: 'resources/start.png',
              position: mapStatus.coordinateBounds!.southwest,
              enabled: false,
              displayPriority: BMFMarkerDisplayPriority.Middle - 2,
              zIndex: BMFMarkerDisplayPriority.Middle - 2,
              centerOffset: BMFPoint(0, 0)
          );
          myMapController.addMarker(swMarker);
          _swPoint = swMarker;
        }

        if(_nePoint != null) {
          myMapController.removeMarker(_nePoint!);
        }
        if(mapStatus.coordinateBounds?.northeast != null){
          BMFMarker neMarker = BMFMarker.icon(
              icon: 'resources/end.png',
              position: mapStatus.coordinateBounds!.northeast,
              enabled: false,
              displayPriority: BMFMarkerDisplayPriority.Middle - 2,
              zIndex: BMFMarkerDisplayPriority.Middle - 2,
              centerOffset: BMFPoint(0, 0)
          );
          myMapController.addMarker(neMarker);
          _nePoint = neMarker;
        }
    });
  }

  @override
  void dispose() {
    // _mapController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return generateMap();
  }

  /// 设置地图参数
  @override
  BMFMapOptions initMapOptions() {
    BMFCoordinate center = BMFCoordinate(39.91788,116.397071);
    BMFMapOptions mapOptions = BMFMapOptions(
        mapType: BMFMapType.Standard,
        zoomLevel: 19,
        maxZoomLevel: 21,
        minZoomLevel: 4,
        logoPosition: BMFLogoPosition.LeftBottom,
        overlookEnabled: false,
        rotateEnabled: false,
        center: center);
    return mapOptions;
  }
}
