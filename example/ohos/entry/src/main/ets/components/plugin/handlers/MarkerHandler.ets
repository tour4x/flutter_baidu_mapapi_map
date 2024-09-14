import { ImageEntity, MapController, Marker, OverlayEvent } from '@bdmap/map';
import { LatLng } from '@bdmap/base';
import { image } from '@kit.ImageKit';
import { MethodChannel } from '@ohos/flutter_ohos';
import { display } from '@kit.ArkUI';
import { ArrayList } from '@kit.ArkTS';


export class MarkerHandler extends Object {
  /**
   * 添加marker
   */
  static sMapAddMarkerMethod = "flutter_bmfmap/marker/addMarker";
  /**
   * 添加markers
   */
  static sMapAddMarkersMethod = "flutter_bmfmap/marker/addMarkers";
  /**
   * 删除marker
   */
  static sMapRemoveMarkerMethod =
    "flutter_bmfmap/marker/removeMarker";
  /**
   * 删除markers
   */
  static sMapRemoveMarkersMethod =
    "flutter_bmfmap/marker/removeMarkers";
  /**
   * 清除所有的markers
   */
  static sMapCleanAllMarkersMethod =
    "flutter_bmfmap/marker/cleanAllMarkers";
  /**
            * marker更新
            */
  static sMapUpdateMarkerMemberMethod =
    "flutter_bmfmap/marker/updateMarkerMember";
  /**
   * marker点击回调
   */
  static sMapClickedmarkedMethod =
    "flutter_bmfmap/marker/clickedMarker";

  ///存储marker
  public markerArray: ArrayList<Marker> = new ArrayList<Marker>()

  async addMarker(mapController: MapController | null, args: ESObject, methodChannel: MethodChannel) {

    let position: ESObject = args.get('position')
    let centerOffset: ESObject = args.get('centerOffset')
    let markerImage: Nullable<ImageEntity>;
    if (args.get('iconData') != null) {
      let bufferArr: Uint8Array = args.get('iconData')
      let imageSource: image.ImageSource = image.createImageSource(bufferArr.buffer);
      let decodingOptions: image.DecodingOptions = {
        fitDensity: display.getDefaultDisplaySync().densityPixels
      }
      let pixelMap: image.PixelMap = await imageSource.createPixelMap(decodingOptions)
      markerImage = new ImageEntity(pixelMap)
    } else if (args.get('icon') != null) {
      let icon: string = args.get('icon')
      markerImage = new ImageEntity(`rawfile://flutter_assets/${icon}`)
    }
    if (markerImage != null) {
      let marker: Marker = new Marker(
        {
          icon: markerImage,
          visible: args.get('visible'),
          zIndex: args.get('zIndex'),
          position: new LatLng(position.get('latitude'), position.get('longitude')),
          xOffset: centerOffset.get('x'),
          yOffset: centerOffset.get('y'),
          scaleX: args.get('scaleX'),
          scaleY: args.get('scaleY'),
          alpha: args.get('alpha'),
          isJoinCollision: args.get('isOpenCollisionDetection'),
          priority: args.get('collisionDetectionPriority')
        }
      )
      marker.uuid = args.get('id')
      marker.addEventListener(OverlayEvent.CLICK, () => {
        methodChannel.invokeMethod(MarkerHandler.sMapClickedmarkedMethod, {
          'marker': {
            'id': marker.uuid,
            'position': {
              'latitude': marker.getPosition().lat,
              'longitude': marker.getPosition().lng
            }
          }
        })
      })

      mapController?.addOverlay(marker)

      this.markerArray.add(marker)
    } else {
      console.log(`图片不存在${args.get('title')}`);
    }
  }

  addMarkers(mapController: MapController | null, args: ESObject, methodChannel: MethodChannel) {

    for (let index = 0; index < args.length; index++) {
      let entry: ESObject = args[index];
      this.addMarker(mapController, entry, methodChannel)
    }

  }

  removeMarker(mapController: MapController | null, args: ESObject) {
  let index : Nullable<number>
    for (let i = 0; i < this.markerArray.length; i++) {
      let marker : Marker = this.markerArray[i];
      if (marker.uuid == args.get('id')) {
        marker.remove()
        index = i
        break
      }
    }
    if (index != null) this.markerArray.removeByIndex(index)
  }

  removeMarkers(mapController: MapController | null, args: ESObject) {
    for (let index = 0; index < args.length; index++) {
      let entry: ESObject = args[index];
      this.removeMarker(mapController, entry)
    }

  }

  cleanAllMarkers() {
    for (let i = 0; i < this.markerArray.length; i++) {
      this.markerArray[i].remove()
    }
    this.markerArray.clear()
  }

  async updateMarker(mapController: MapController | null, args: ESObject) {

    for (let index = 0; index < this.markerArray.length; index++) {
      let marker : Marker = this.markerArray[index];
      if (marker.uuid == args.get('id')) {
        if (args.get('member') == 'iconData') {
          let bufferArr: Uint8Array = args.get('value')
          let imageSource: image.ImageSource = image.createImageSource(bufferArr.buffer);
          let decodingOptions: image.DecodingOptions = {
            fitDensity: display.getDefaultDisplaySync().densityPixels
          }
          let pixelMap: image.PixelMap = await imageSource.createPixelMap(decodingOptions)
          let size = pixelMap.getImageInfoSync().size;
          marker.updateBmIcon(new ImageEntity(pixelMap))
          break
        } else if (args.get('member') == 'position') {
          let position: ESObject = args.get('value')
          marker.setPosition(new LatLng(position.get('latitude'), position.get('longitude')))
          break
        }
      }
    }
  }
}