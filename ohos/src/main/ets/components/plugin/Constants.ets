
export default class  Constants {
  static  VIEW_METHOD_CHANNEL_PREFIX = "flutter_bmfmap/map_";

    // sConfigChangedAction = "com.baidu.flutter_bmfmap.configChanged";
    //
    // NATIVE_SDK_VERSION_CHANNEL = "flutter_bmfmap";
    // NATIVE_SDK_VERSION = "flutter_bmfmap/map/getNativeMapVersion";

    /**
     * view类型
     */

  static  ViewType_SMapView = "flutter_bmfmap/map/BMKMapView";

    // /**
    //  * overlayHandler类型
    //  */
    // public static class OverlayHandlerType {
    //     public static final int OVERLAY_COMMON_HANDLER = 0;
    //     public static final int CIRCLE_HANDLER = 1;
    //     public static final int DOT_HANDLER = 2;
    //     public static final int POLYGON_HANDLER = 3;
    //     public static final int POLYLINE_HANDLER = 4;
    //     public static final int TEXT_HANDLER = 5;
    //     public static final int ARCLINE_HANDLER = 6;
    //     public static final int GROUND_HANDLER = 7;
    //     public static final int MARKER_HANDLER = 8;
    //     public static final int INFOWINDOW_HANDLER = 9;
    //     public static final int PRISM_HANDLER = 10;
    //     public static final int BM3DMODEL_HANDLER = 11;
    //     public static final int MULTIPOINT_HANDLER = 12;
    //     public static final int TRACE_HANDLER = 13;
    // }
    //
    // /**
    //  * MapHandler类型
    //  */
    // public static class BMapHandlerType {
    //     public static final int CUSTOM_MAP = 0;
    //     public static final int MAP_STATE = 1;
    //     public static final int INDOOR_MAP = 2;
    //     public static final int MAP_SNAPSHOT = 3;
    //     public static final int CUSTOM_COMPASS = 4;
    //     public static final int CUSTOM_TRAFFIC_COLOR = 5;
    //     public static final int MAP_UPDATE = 6;
    //     public static final int HEAT_MAP = 7;
    //     public static final int TILE_MAP = 8;
    //     public static final int LOCATION_LAYER = 9;
    //     public static final int PROJECTION = 10;
    //     public static final int PARTICLE = 11;
    // }
    //
    // /**
    //  * 与flutter method协议约定
    //  */
    // public static class MethodProtocol {
    //     /**
    //      * 室内图状态协议
    //      */
    //     public static class IndoorMapProtocol {
    //         /**
    //          * map展示室内地图
    //          */
    //         sShowBaseIndoorMapMethod =
    //                 "flutter_bmfmap/map/showBaseIndoorMap";
    //
    //         /**
    //          * map室内图标注是否显示
    //          */
    //         sShowBaseIndoorMapPoiMethod =
    //                 "flutter_bmfmap/map/showBaseIndoorMapPoi";
    //
    //         /**
    //          * map设置室内图楼层
    //          */
    //         sSwitchBaseIndoorMapFloorMethod =
    //                 "flutter_bmfmap/map/switchBaseIndoorMapFloor";
    //
    //         /**
    //          * map获取当前聚焦的室内图信息
    //          */
    //         sGetFocusedBaseIndoorMapInfoMethod =
    //                 "flutter_bmfmap/map/getFocusedBaseIndoorMapInfo";
    //     }
    //
    //     /**
    //      * 个性化地图
    //      */
    //     public static class CustomMapProtocol {
    //         /**
    //          * 开启个性化地图
    //          */
    //         sMapSetCustomMapStyleEnableMethod =
    //                 "flutter_bmfmap/map/setCustomMapStyleEnable";
    //
    //         /**
    //          * 设置个性化地图样式路径
    //          */
    //         sMapSetCustomMapStylePathMethod =
    //                 "flutter_bmfmap/map/setCustomMapStylePath";
    //
    //         /**
    //          * 在线个性化样式加载状态回调接口
    //          */
    //         sMapSetCustomMapStyleWithOptionMethod =
    //                 "flutter_bmfmap/map/setCustomMapStyleWithOption";
    //     }
    //
    //     /**
    //      * overlay协议
    //      */
    //     public static class OverlayProtocol {
            /**
             * 删除overlay
             */
            // static sMapRemoveOverlayMethod =
            //         "flutter_bmfmap/overlay/removeOverlay";
    //     }
    //
    //     /**
    //      * marker协议
    //      */
    //     public static class MarkerProtocol {
  //           /**
  //            * 添加marker
  //            */
  //           static sMapAddMarkerMethod = "flutter_bmfmap/marker/addMarker";
  //
  //           /**
  //            * 添加markers
  //            */
  // static sMapAddMarkersMethod = "flutter_bmfmap/marker/addMarkers";
  //
  //           /**
  //            * 删除marker
  //            */
  // static sMapRemoveMarkerMethod =
  //                   "flutter_bmfmap/marker/removeMarker";
  //
  //           /**
  //            * 删除markers
  //            */
  // static sMapRemoveMarkersMethod =
  //                   "flutter_bmfmap/marker/removeMarkers";
  //
  //           /**
  //            * 清除所有的markers
  //            */
  // static sMapCleanAllMarkersMethod =
  //                   "flutter_bmfmap/marker/cleanAllMarkers";
    //
    //         /**
    //          * marker点击回调
    //          */
    //         sMapClickedmarkedMethod =
    //                 "flutter_bmfmap/marker/clickedMarker";
    //
    //         /**
    //          * marker 选中回调
    //          */
    //         sMapDidSelectMarkerMethod =
    //                 "flutter_bmfmap/marker/didSelectedMarker";
    //
    //         /**
    //          * marker取消选中回调
    //          */
    //         sMapDidDeselectMarkerMethod =
    //                 "flutter_bmfmap/marker/didDeselectMarker";
    //
    //         /**
    //          * marker拖拽
    //          */
    //         sMapDragMarkerMethod = "flutter_bmfmap/marker/dragMarker";
    //
    //         /**
    //          * marker更新
    //          */
    //         sMapUpdateMarkerMemberMethod =
    //                 "flutter_bmfmap/marker/updateMarkerMember";
    //
    //         /**
    //          * marker拖拽状态枚举
    //          */
    //         public static enum MarkerDragState {
    //             // 静止状态
    //             None,
    //
    //             // 开始拖动
    //             Starting,
    //
    //             // 拖动中
    //             Dragging,
    //
    //             // 取消拖动
    //             Canceling,
    //
    //             // 拖动结束
    //             Ending
    //         }
    //     }
    //
    //     /**
    //      * infowindow协议
    //      */
    //     public static class InfoWindowProtocol {
    //         /**
    //          * marker的infoWindow（iOS paopaoView）点击回调
    //          */
    //         sMapDidClickedInfoWindowMethod =
    //                 "flutter_bmfmap/map/didClickedInfoWindow";
    //
    //         // 添加infoWindow
    //         sAddInfoWindowMapMethod = "flutter_bmfmap/map/addInfoWindow";
    //
    //         // 添加infoWindow
    //         sAddInfoWindowsMapMethod =
    //                 "flutter_bmfmap/map/addInfoWindows";
    //
    //         // 移除infoWindow
    //         sRemoveInfoWindowMapMethod =
    //                 "flutter_bmfmap/map/removeInfoWindow";
    //     }
    //
    //     /**
    //      * polyline协议
    //      */
    //     public static class PolylineProtocol {
            /**
             * 添加polyline
             */
            // static sMapAddPolylineMethod = "flutter_bmfmap/overlay/addPolyline";
    //         /**
    //          * polyline点击事件
    //          */
    //         sMapOnClickedOverlayCallback =
    //                 "flutter_bmfmap/overlay/onClickedOverlay";
    //
    //         /**
    //          * 更新polyline属
    //          */
    //         sMapUpdatePolylineMemberMethod =
    //                 "flutter_bmfmap/overlay/updatePolylineMember";
    //         /**
    //          * 3.1.0新增 添加大地曲线
    //          */
    //         MAP_ADD_GEODESIC_LINE_METHOD =
    //                 "flutter_bmfmap/overlay/addGeodesicLine";
    //
    //         /**
    //          * 3.1.0新增 添加渐变色
    //          */
    //         MAP_ADD_GRADIENT_LINE_METHOD =
    //                 "flutter_bmfmap/overlay/addGradientLine";
    //
    //         /**
    //          * 更新geodesicline属性
    //          */
    //         MAP_UPDATE_GEODESIC_LINE_MEMBER_METHOD =
    //                 "flutter_bmfmap/overlay/updateGeodesicLineMember";
    //
    //         /**
    //          * 更新gradientLine属性
    //          */
    //         MAP_UPDATE_GRADIENT_LINE_MEMBER_METHOD =
    //                 "flutter_bmfmap/overlay/updateGradientLinMember";
    //     }
    //
    //     /**
    //      * polygon协议
    //      */
    //     public static class PolygonProtocol {
    //         /**
    //          * 添加polyline
    //          */
    //         sMapAddPolygonMethod = "flutter_bmfmap/overlay/addPolygon";
    //
    //         /**
    //          * 更新polygon属性
    //          */
    //         sMapUpdatePolygonMemberMethod =
    //                 "flutter_bmfmap/overlay/updatePolygonMember";
    //     }
    //
    //     /**
    //      * arline协议
    //      */
    //     public static class ArclineProtocol {
    //         /**
    //          * 添加arcline
    //          */
    //         sMapAddArclinelineMethod =
    //                 "flutter_bmfmap/overlay/addArcline";
    //
    //         /**
    //          * 更新arcline属性
    //          */
    //         sMapUpdateArclineMemberMethod =
    //                 "flutter_bmfmap/overlay/updateArclineMember";
    //     }
    //
    //     /**
    //      * circleline协议
    //      */
    //     public static class CirclelineProtocol {
    //         /**
    //          * 添加circlr
    //          */
    //         sMapAddCirclelineMethod = "flutter_bmfmap/overlay/addCircle";
    //
    //         /**
    //          * 更新circle属性
    //          */
    //         sMapUpdateCircleMemberMethod =
    //                 "flutter_bmfmap/overlay/updateCircleMember";
    //
    //         /**
    //          * 添加渐变圆
    //          */
    //         MAP_ADD_GRADIENT_CIRCLE_METHOD = "flutter_bmfmap/overlay/addGradientCircle";
    //     }
    //
    //     /**
    //      * dot协议
    //      */
    //     public static class DotProtocol {
    //         /**
    //          * 添加Dot
    //          */
    //         sMapAddDotMethod = "flutter_bmfmap/overlay/addDot";
    //
    //         /**
    //          * 更新Dot属性
    //          */
    //         sMapUpdateDotMemberMethod = "flutter_bmfmap/overlay"
    //                 + "/updateDotMember";
    //     }
    //
    //     /**
    //      * Text协议
    //      */
    //     public static class TextProtocol {
    //         /**
    //          * 添加Text
    //          */
    //         sMapAddTextMethod = "flutter_bmfmap/overlay/addText";
    //
    //         /**
    //          * 更新Text属性
    //          */
    //         sMapUpdateTextMemberMethod =
    //                 "flutter_bmfmap/overlay/updateTextMember";
    //     }
    //
    //     /**
    //      * Ground协议
    //      */
    //     public static class GroundProtocol {
    //         /**
    //          * 添加Ground
    //          */
    //         sMapAddGroundMethod = "flutter_bmfmap/overlay/addGround";
    //
    //         /**
    //          * 更新Ground属性
    //          */
    //         sMapUpdateGroundMemberMethod =
    //                 "flutter_bmfmap/overlay/updateGroundMember";
    //     }
    //
    //     /**
    //      * 3.1.0 3D棱柱
    //      */
    //     public static class PrismProtocol {
    //         /**
    //          * 添加3D棱柱
    //          */
    //         MAP_ADD_PRISM_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/addPrismOverlay";
    //         /**
    //          * 更新prismOverlay属性
    //          */
    //         MAP_UPDATE_PRISM_OVERLAY_MEMBER_METHOD =
    //                 "flutter_bmfmap/overlay/updatePrismOverlayMember";
    //
    //         /**
    //          * 楼层动画结束
    //          */
    //         PRISM_OVERLAY_ANIMATION_DID_END_CALLBACK =
    //                 "flutter_bmfmap/overlay/prismOverlayViewFloorAnimationDidEnd";
    //     }
    //
    //     /**
    //      * 3.1.0 3D模型
    //      */
    //     public static class BM3DModelProtocol {
    //         /**
    //          * 添加3D模型
    //          */
    //         MAP_ADD_3DMODEL_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/add3DModelOverlay";
    //         /**
    //          * 更新3d模型属性
    //          */
    //         MAP_UPDATE_3DMODEL_OVERLAY_MEMBER_METHOD =
    //                 "flutter_bmfmap/overlay/update3DModelOverlayMember";
    //     }
    //
    //     /**
    //      * 3.1.0 multiPoint Overlay
    //      */
    //     public static class MultiPointProtocol {
    //         /**
    //          * 添加multiPointOverlay
    //          */
    //         MAP_ADD_MULTIPOINT_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/addMultiPointOverlay";
    //     }
    //
    //     /**
    //      * 3.1.0 Trace Overlay
    //      */
    //     public static class TraceProtocol {
    //         /**
    //          * 添加traceOverlay
    //          */
    //         MAP_ADD_TRACE_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/addTraceOverlay";
    //
    //         MAP_REMOVE_TRACE_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/removeTraceOverlay";
    //
    //         /** 暂停轨迹动画绘制 */
    //         MAP_PAUSE_TRACE_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/pauseTraceOverlayDraw";
    //
    //         /** 继续轨迹动画绘制 */
    //         MAP_RESUME_TRACE_OVERLAY_METHOD =
    //                 "flutter_bmfmap/overlay/resumeTraceOverlayDraw";
    //
    //         /**
    //          * 动态轨迹动画开始
    //          */
    //         TRACE_OVERLAY_ANIMATION_DID_START_CALLBACK =
    //                 "flutter_bmfmap/overlay/traceOverlayAnimationDidStart";
    //
    //         /**
    //          * 动态轨迹动画进度
    //          */
    //         TRACE_OVERLAY_ANIMATION_RUNNING_PROGRESS_CALLBACK =
    //                 "flutter_bmfmap/overlay/traceOverlayAnimationRunningProgress";
    //
    //         /**
    //          * 动态轨迹动画结束
    //          */
    //         TRACE_OVERLAY_ANIMATION_DID_END_CALLBACK =
    //                 "flutter_bmfmap/overlay/traceOverlayAnimationDidEnd";
    //
    //         /**
    //          * 动态轨迹动画更新当前位置
    //          */
    //         TRACE_OVERLAY_ANIMATION_UPDATE_POSITION_CALLBACK =
    //                 "flutter_bmfmap/overlay/traceOverlayAnimationUpdatePosition";
    //     }
    //
    //     public static class HeatMapProtocol {
    //         /**
    //          * 添加HeapMap
    //          */
    //         sMapAddHeatMapMethod = "flutter_bmfmap/heatMap/addHeatMap";
    //
    //         /**
    //          * 更新热力图
    //          */
    //         MAP_UPDATE_HEATMAP_METHOD = "flutter_bmfmap/heatMap/updateHeatMap";
    //
    //         /**
    //          * 开关
    //          */
    //         sMapRemoveHeatMapMethod =
    //                 "flutter_bmfmap/heatMap/removeHeatMap";
    //
    //         /**
    //          * 是否展示热力图
    //          */
    //         sShowHeatMapMethod = "flutter_bmfmap/heatMap/showHeatMap";
    //
    //
    //         /**
    //          * 开始热力图动画
    //          */
    //         sStartHeatFrameAnimationMethod =
    //                 "flutter_bmfmap/heatMap/startHeatFrameAnimation";
    //
    //         /**
    //          * 停止热力图动画
    //          */
    //         sStopHeatFrameAnimationMethod =
    //                 "flutter_bmfmap/heatMap/stopHeatFrameAnimation";
    //
    //         /**
    //          * 控制渲染帧索引
    //          */
    //         sSetHeatFrameAnimationIndexMethod =
    //                 "flutter_bmfmap/heatMap/setHeatFrameAnimationIndex";
    //
    //         /**
    //          * 渲染帧索引回调
    //          */
    //         sHeatMapFrameAnimationIndexCallbackMethod =
    //                 "flutter_bmfmap/heatMap/heatMapFrameAnimationIndexCallback";
    //     }
    //
    //     /**
    //      * mapState协议
    //      */
    //     public static class MapStateProtocol {
    //         // 更新地图参数
  //          static  sMapUpdateMethod = "flutter_bmfmap/map/updateMapOptions";
  //   //
  //           // map放大一级比例尺
  // static sMapZoomInMethod = "flutter_bmfmap/map/zoomIn";
  //   //
  //   //         // map缩小一级比例尺
  //   //         sMapZoomOutMethod = "flutter_bmfmap/map/zoomOut";
  //   //
  //   //         // 设置路况颜色
  //   //         sMapSetCustomTrafficColorMethod =
  //   //                 "flutter_bmfmap/map/setCustomTrafficColor";
  //   //
  //   //         // 更新地图状态
  //   //         sMapSetMapStatusMethod = "flutter_bmfmap/map/setMapStatus";
  //   //
  //           // 获取地图状态
  //           static sMapGetMapStatusMethod = "flutter_bmfmap/map/getMapStatus";
  //   //
  //   //         // 按像素移动地图中心点
  //   //         sMapSetScrollByMethod = "flutter_bmfmap/map/setScrollBy";
  //   //
  //   //         // 根据给定增量缩放地图级别
  //   //         sMapSetZoomByMethod = "flutter_bmfmap/map/setZoomBy";
  //   //
  //   //         // 根据给定增量以及给定的屏幕坐标缩放地图级别
  //   //         sMapSetZoomPointByMethod =
  //   //                 "flutter_bmfmap/map/setZoomPointBy";
  //   //
  //   //         // 设置地图缩放级别
  //   //         sMapSetZoomToMethod = "flutter_bmfmap/map/setZoomTo";
  //   //
  //           // 设定地图中心点坐标
  //           static sMapSetCenterCoordinateMethod =
  //                   "flutter_bmfmap/map/setCenterCoordinate";
  //   //
  //           // 设置地图中心点以及缩放级别
  //           static sMapSetCenterZoomMethod =
  //                   "flutter_bmfmap/map/setMapCenterZoom";
  //   //
  //           // 获得地图当前可视区域截图
  //           static  sMapTakeSnapshotMethod = "flutter_bmfmap/map/takeSnapshot";
  //   //
  //   //         // 获得地图指定区域截图
  //   //         sMapTakeSnapshotWithRectMethod =
  //   //                 "flutter_bmfmap/map/takeSnapshotWithRect";
  //   //
  //   //         // 设置罗盘的图片
  //   //         sMapSetCompassImageMethod =
  //   //                 "flutter_bmfmap/map/setCompassImage";
  //   //
  //           // 设置显示在屏幕中的地图地理范围
  //           static sMapSetVisibleMapBoundsMethod =
  //                   "flutter_bmfmap/map/setVisibleMapBounds";
  //
  //           // 设定地图的显示范围,并使mapRect四周保留insets指定的边界区域
  // static sMapSetVisibleMapBoundsWithPaddingMethod =
  //                   "flutter_bmfmap/map/setVisibleMapBoundsWithPadding";
  //   //
  //           // map加载完成
  //           static sMapDidLoadCallback =
  //                   "flutter_bmfmap/map/mapViewDidFinishLoad";
    //
    //         // map渲染完成
    //         sMapDidFinishRenderCallback =
    //                 "flutter_bmfmap/map/mapViewDidFinishRender";
    //
    //         // 地图渲染每一帧画面过程中，以及每次需要重绘地图时（例如添加覆盖物）都会调用此接口
    //         sMapOnDrawMapFrameCallback =
    //                 "flutter_bmfmap/map/mapViewOnDrawMapFrame";
    //
    //         // 地图绘制出有效数据的监听
    //         sMapRenderValidDataCallback =
    //                 "flutter_bmfmap/map/mapRenderValidDataCallback";
    //
    //         // 地图View进入/移出室内图
    //         sMapInOrOutBaseIndoorMapCallback =
    //                 "flutter_bmfmap/map/mapViewInOrOutBaseIndoorMap";
    //
    //         // 地图区域即将改变时会调用此接口
    //         sMapRegionWillChangeCallback =
    //                 "flutter_bmfmap/map/mapViewRegionWillChange";
    //
    //         // 地图区域即将改变时会调用此接口reason
    //         sMapRegionWillChangeWithReasonCallback =
    //                 "flutter_bmfmap/map/mapViewRegionWillChangeWithReason";
    //
    //         // 地图区域改变完成后会调用此接口
    //         sMapRegionDidChangeCallback =
    //                 "flutter_bmfmap/map/mapViewRegionDidChange";
    //
    //         // 地图区域改变完成后会调用此接口reason
    //         sMapRegionDidChangeWithReasonCallback =
    //                 "flutter_bmfmap/map/mapViewRegionDidChangeWithReason";
    //
    //         // 点中底图空白处会回调此接口
    //         sMapOnClickedMapBlankCallback =
    //                 "flutter_bmfmap/map/mapViewOnClickedMapBlank";
    //
    //         // 点中底图标注后会回调此接口
    //         sMapOnClickedMapPoiCallback =
    //                 "flutter_bmfmap/map/mapViewonClickedMapPoi";
    //
    //         // 双击地图时会回调此接口
    //         sMapOnDoubleClickCallback =
    //                 "flutter_bmfmap/map/mapViewOnDoubleClick";
    //
    //         // 长按地图时会回调此接口
    //         sMapOnLongClickCallback =
    //                 "flutter_bmfmap/map/mapViewOnLongClick";
    //
    //         // 地图状态改变完成后会调用此接口
    //         sMapStatusDidChangedCallback =
    //                 "flutter_bmfmap/map/mapViewStatusDidChanged";
    //
    //         // widget 状态更新
    //         sMapDidUpdateWidget = "flutter_bmfmap/map/didUpdateWidget";
    //
    //         // widget 热重载
    //         sMapReassemble = "flutter_bmfmap/map/reassemble";
    //
    //         /**
    //          * 地图overlay图层与POI图层交换位置
    //          */
    //         SWITCH_OVERLAY_LAYER_AND_POI_LAYER =
    //                 "flutter_bmfmap/map/switchOverlayLayerAndPOILayer";
    //
    //
    //         /**
    //          * 地图是否展示底图poi标签 3.4.0新增
    //          */
    //         SWITCH_OVERLAY_LAYER_AND_POI_TAG_TYPE
    //                 = "flutter_bmfmap/map/poiTagTypeEnableAndPoiTagType";
    //
    //         /**
    //          * 地图交换图层顺序 since 3.6.0
    //          */
    //         SWITCH_LAYER_ORDER = "flutter_bmfmap/map/switchLayerOrder";
    //
    //         /**
    //          * 地图点击海量点
    //          */
    //         MAP_ON_CLICK_MULTI_POINT_OVERLAY_ITEM_CALLBACK  =
    //                 "flutter_bmfmap/overlay/onClickedMultiPointOverlayItem";
    //
    //         // 获取地图版权信息
    //         MAP_COPYRINGHT_INFO = "flutter_bmfmap/map/getMapCopyrightInformation";
    //
    //         // 获取地图测绘资质
    //         MAP_MAPPING_QUALIFICATION = "flutter_bmfmap/map/getMapMappingQualification";
    //
    //         // 获取基础地图审图号
    //         MAP_APPROVAL_NUMBER = "flutter_bmfmap/map/getMapApprovalNumber";
    //
    //     }
    //
    //     /**
    //      * 地图获取属性方法id集合
    //      */
    //     public static class BMFMapGetPropertyMethodId {
    //
    //         // 获取map的展示类型
    //         sMapGetMapTypeMethod = "flutter_bmfmap/map/getMapType";
    //
    //         /** 获取map的语言类型 */
    //         MAP_GET_MAPLANGUAGE_TYPE_METHOD =
    //                 "flutter_bmfmap/map/getMapLanguageType";
    //
    //         /** 获取map的字体大小 */
    //         MAP_GET_MAP_FONTSIZE_LEVEL_METHOD =
    //                 "flutter_bmfmap/map/getMapFontSizeLevel";
    //
            // 获取map的比例尺级别
            // static  sMapGetZoomLevelMethod = "flutter_bmfmap/map/getZoomLevel";
    //
    //         // 获取map的自定义最小比例尺级别
    //         sMapGetMinZoomLevelMethod =
    //                 "flutter_bmfmap/map/getMinZoomLevel";
    //
    //         // 获取map的自定义最大比例尺级别
    //         sMapGetMaxZoomLevelMethod =
    //                 "flutter_bmfmap/map/getMaxZoomLevel";
    //
    //         // 获取map的旋转角度
    //         sMapGetRotationMethod = "flutter_bmfmap/map/getRotation";
    //
    //         // 获取map的地图俯视角度
    //         sMapGetOverlookingMethod =
    //                 "flutter_bmfmap/map/getOverlooking";
    //
    //         // 获取map的是否现显示3D楼块效果
    //         sMapGetBuildingsEnabledMethod =
    //                 "flutter_bmfmap/map/getBuildingsEnabled";
    //
    //         // 获取map的是否打开路况图层
    //         sMapGetTrafficEnabledMethod =
    //                 "flutter_bmfmap/map/getTrafficEnabled";
    //
    //         // 获取map的是否打开百度城市热力图图层
    //         sMapGetBaiduHeatMapEnabledMethod =
    //                 "flutter_bmfmap/map/getBaiduHeatMapEnabled";
    //
    //         // 获取map的是否支持所有手势操作
    //         sMapGetGesturesEnabledMethod =
    //                 "flutter_bmfmap/map/getGesturesEnabled";
    //
    //         // 获取map是否支持缩放
    //         sMapGetZoomEnabledMethod =
    //                 "flutter_bmfmap/map/getZoomEnabled";
    //
    //         // 获取map是否支持拖拽手势
    //         sMapGetScrollEnabledMethod =
    //                 "flutter_bmfmap/map/getScrollEnabled";
    //
    //         // 获取map是否支持俯仰角
    //         sMapGetOverlookEnabledMethod =
    //                 "flutter_bmfmap/map/getOverlookEnabled";
    //
    //         // 获取map是否支持旋转
    //         sMapGetRotateEnabledMethod =
    //                 "flutter_bmfmap/map/getRotateEnabled";
    //
    //         // 获取map的比例尺的位置
    //         sMapGetMapScaleBarPositionMethod =
    //                 "flutter_bmfmap/map/getMapScaleBarPosition";
    //
    //         // 获取map的logo位置
    //         sMapGetLogoPositionMethod =
    //                 "flutter_bmfmap/map/getLogoPosition";
    //
    //         // 获取map的可视范围
    //         sMapGetVisibleMapBoundsMethod =
    //                 "flutter_bmfmap/map/getVisibleMapBounds";
    //
    //         // 获取map的显示室内图
    //         sMapGetBaseIndoorMapEnabledMethod =
    //                 "flutter_bmfmap/map/getBaseIndoorMapEnabled";
    //
    //         // 获取map的室内图标注是否显示
    //         sMapGetShowIndoorMapPoiMethod = "flutter_bmfmap/map"
    //                 + "/getShowIndoorMapPoi";
    //
    //         /**
    //          *  获取map的运营图层是否显示
    //          */
    //         MAP_GET_SHOW_OPERATE_LAYER_METHOD =
    //                 "flutter_bmfmap/map/getShowOperateLayer";
    //     }
    //
    //     public static class BMFOfflineMethodId {
    //         // 初使化
    //         sMapInitOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/initOfflineMap";
    //
    //         // 状态回调
    //         sMapOfflineCallBackMethod =
    //                 "flutter_bmfmap/offlineMap/offlineCallBack";
    //
    //         // 启动下载指定城市ID的离线地图，或在暂停更新某城市后继续更新下载某城市离线地图
    //         sMapStartOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/startOfflineMap";
    //
    //         // 启动更新指定城市ID的离线地图
    //         sMapUpdateOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/updateOfflineMap";
    //
    //         // 暂停下载或更新指定城市ID的离线地图
    //         sMapPauseOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/pauseOfflineMap";
    //
    //         // 删除指定城市ID的离线地图
    //         sMapRemoveOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/removeOfflineMap";
    //
    //         // 销毁离线地图管理模块，不用时调用
    //         sMapDestroyOfflineMethod =
    //                 "flutter_bmfmap/offlineMap/destroyOfflineMap";
    //
    //         // 返回热门城市列表
    //         sMapGetHotCityListMethod =
    //                 "flutter_bmfmap/offlineMap/getHotCityList";
    //
    //         // 返回支持离线地图城市列表
    //         sMapGetOfflineCityListMethod =
    //                 "flutter_bmfmap/offlineMap/getOfflineCityList";
    //
    //         // 根据城市名搜索该城市离线地图记录
    //         sMapSearchCityMethod =
    //                 "flutter_bmfmap/offlineMap/searchCityList";
    //
    //         // 返回各城市离线地图更新信息
    //         sMapGetAllUpdateInfoMethod =
    //                 "flutter_bmfmap/offlineMap/getAllUpdateInfo";
    //
    //         // 返回指定城市ID离线地图更新信息
    //         sMapGetUpdateInfoMethod =
    //                 "flutter_bmfmap/offlineMap/getUpdateInfo";
    //     }
    //
    //     public static class ParticleMethodId {
    //         /**
    //          * 显示粒子效果 since 3.5.0
    //          */
    //         SHOW_MAP_PARTICLE_METHOD =
    //                 "flutter_bmfmap/map/showMapParticleEffectMethod";
    //
    //         /**
    //          * 关闭粒子效果 since 3.5.0
    //          */
    //         CLOSE_MAP_PARTICLE_METHOD =
    //                 "flutter_bmfmap/map/closeMapParticleEffectMethod";
    //
    //         /**
    //          * 自定义粒子效果 since 3.5.0
    //          */
    //         CUSTOM_MAP_PARTICLE_METHOD =
    //                 "flutter_bmfmap/map/customMapParticleEffectMethod";
    //     }
    //
    //     public static class ProjectionMethodId {
    //         //屏幕坐标转地理坐标ID
    //         sFromScreenLocation =
    //                 "flutter_bmfmap/projection/coordinateFromScreenPoint";
    //
    //         //将地理坐标转换成屏幕坐标
    //         sToScreenLocation =
    //                 "flutter_bmfmap/projection/screenPointfromCoordinate";
    //
    //         //米为计量单位的距离（沿赤道）在当前缩放水平下转换到一个以像素（水平）为计量单位的距离
    //         sMetersToEquatorPixels =
    //                 "flutter_bmfmap/map/metersToEquatorPixels";
    //
    //         /**
    //          * 将三维地理坐标转化为屏幕坐标
    //          */
    //         SCREEN_POINT_FROM_MAP_POINT_3METHOD =
    //                 "flutter_bmfmap/projection/screenPointFromMapPoint3";
    //     }
    //
    //     public static class TileMapProtocol {
            // 添加室内地图
            // static sAddTileMapMethod = "flutter_bmfmap/overlay/addTile";
    //
    //         // 展示室内地图
    //         sRemoveTileMapMethod = "flutter_bmfmap/overlay/removeTile";
    //     }
    // }
    //
    // public static class ErrorCode {
    //
    //     /**
    //      * 没有错误
    //      */
    //     public static final int sErrorNon = 0;
    //
    //     /**
    //      * flutter传递参数为空
    //      */
    //     public static final int sErrorNullFlutterParam = 1;
    //
    //     /**
    //      * flutter参数缺少指定内容
    //      */
    //     public static final int sErrorFlutterParamMissingContent = 2;
    //
    //     /**
    //      * flutter参数类型不对
    //      */
    //     public static final int sErrorFlutterParamType = 3;
    //
    //     /**
    //      * flutter参数转换出错
    //      */
    //     public static final int sErrorParamConvertFailed = 4;
    //
    //     /**
    //      * flutter参数转换出错
    //      */
    //     public static final int sErrorEngineError = 5;
    // }
    //
    // 定位图层
    // public static class LocationLayerMethodId {
  //       // 设定是否显示定位图层
  //       static sMapShowUserLocationMethod =
  //               "flutter_bmfmap/userLocation/showUserLocation";
  //   //
  //       // 设定定位模式，取值为：BMFUserTrackingMode
  //       static sMapUserTrackingModeMethod =
  //               "flutter_bmfmap/userLocation/userTrackingMode";
  //   //
  //       // 动态定制我的位置样式
  // static sMapUpdateLocationDisplayParamMethod =
  //               "flutter_bmfmap/userLocation/updateLocationDisplayParam";
  //   //
  //       // 动态更新我的位置数据
  //       static sMapUpdateLocationDataMethod =
  //               "flutter_bmfmap/userLocation/updateLocationData";
    // }
    //
    // /**
    //  * 枚举：室内图切换楼层结果
    //  */
    // public class SwitchIndoorFloorError {
    //     /**
    //      * 切换楼层成功
    //      */
    //     public static final int SUCCESS = 0;
    //
    //     /**
    //      * 切换楼层失败
    //      */
    //     public static final int FAILED = 1;
    //
    //     /**
    //      * 地图还未聚焦到传入的室内图
    //      */
    //     public static final int NOT_FOCUSED = 2;
    //
    //     /**
    //      * 当前室内图不存在该楼层
    //      */
    //     public static final int NOT_EXIST = 3;
    //
    //     /**
    //      * 切换楼层, 室内ID信息错误 [android] 独有
    //      */
    //     public static final int SWICH_FLOOR_INFO_ERROR = 4;
    // }
    //
    // /**
    //  * 镂空类型
    //  */
    // public class HoleType {
    //
    //     /**
    //      * circle(圆形)镂空类型
    //      */
    //     public static final int CIRCLE_HOLE_TYPE = 0;
    //
    //     /**
    //      * (polygon)多边形镂空类型
    //      */
    //     public static final int POLYGON_HOLE_TYPE = 1;
    // }
}
