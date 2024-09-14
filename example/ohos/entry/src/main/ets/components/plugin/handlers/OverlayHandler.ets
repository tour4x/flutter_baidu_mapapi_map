import { ImageEntity, MapController, Polyline, SysEnum } from '@bdmap/map';
import { LatLng } from '@bdmap/base';
import { ArrayList } from '@kit.ArkTS';


export class OverlayHandler extends Object {
  /**
   * 删除overlay
   */
  static sMapRemoveOverlayMethod =
    "flutter_bmfmap/overlay/removeOverlay";

  //添加瓦片地图
  static sAddTileMapMethod = "flutter_bmfmap/overlay/addTile";

  /**
   * 添加polyline
   */
  static sMapAddPolylineMethod = "flutter_bmfmap/overlay/addPolyline";

  /**
   //          * 更新polyline属
   //          */
  static sMapUpdatePolylineMemberMethod =
                  "flutter_bmfmap/overlay/updatePolylineMember";

  polyLineList : ArrayList<Polyline> = new ArrayList()

  removeOverlay(mapController : MapController | null, args: ESObject) {
    let id : string = args.get('id')
    for(let i = 0; i < this.polyLineList.length; i++) {
      let polyline : Polyline = this.polyLineList[i]
      if (polyline.uuid == id) {
        this.polyLineList.remove(polyline)
        break
      }
    }
  }

  addTile(mapController : MapController | null, args: ESObject) {

  }


  addPolyline(mapController: MapController | null, args: ESObject) {

    // 'id': this.id,
    // 'visible': visible,//
    // 'zIndex': zIndex,//
    // 'className': this.className,
    // 'customMap': this.customMap,
    // 'coordinates': this.coordinates.map((coord) => coord.toMap()).toList(),//
    // 'indexs': this.indexs?.map((index) => index).toList(),//
    // 'width': this.width,//
    // 'colors'://
    // this.colors?.map((color) => color.value.toRadixString(16)).toList(),//
    // 'textures': this.textures,//
    // 'dottedLine': this.dottedLine,//
    // 'lineDashType': this.lineDashType?.index,//
    // 'lineCapType': this.lineCapType?.index,//
    // 'lineJoinType': this.lineJoinType?.index,//
    // 'lineDirectionCross180': this.lineDirectionCross180?.index,//
    // 'isThined': this.isThined,//
    // 'clickable': this.clickable,//
    // 'isKeepScale': this.isKeepScale,
    // 'isFocus': this.isFocus,
    // 'lineBloomMode': this.lineBloomMode?.index,
    // 'lineBloomWidth': this.lineBloomWidth,
    // 'lineBloomAlpha': this.lineBloomAlpha,
    // 'lineBloomGradientASPeed': this.lineBloomGradientASPeed,
    // 'lineBloomBlurTimes': this.lineBloomBlurTimes,

    let coords : LatLng[] = []
    let coordinates : Array<ESObject> = args.get('coordinates')
    coordinates.forEach((element : ESObject) => {
      coords.push(new LatLng(element.get('latitude'), element.get('longitude')))
    });
    let textures : ImageEntity[] = []
    let texturesArray : Array<string> = args.get('textures')
    texturesArray.forEach((element : string) => {
      textures.push(new ImageEntity(`rawfile://flutter_assets/${element}`))
    });
    let colors : string[] = []
    let colorsArray : Array<string> = args.get('colors')
    colorsArray.forEach((element : string) => {
      colors.push(`#${element}`)
    });
    // ImageEntity(`rawfile://flutter_assets/${icon}`)
    // let polyLine = new Polyline({
    //   visible: args.get('visible'),
    //   zIndex: args.get('zIndex'),
    //   points: coords,
    //   width: args.get('width'),
    //   textures: textures,
    //   join: args.get('lineJoinType'),
    //   cap: args.get('lineCapType'),
    //   // isGeodesic: false,
    //   directionCross180: args.get('lineDirectionCross180'),
    //   // fillcolor: 'rgba(255, 235, 59 ,0.7)',
    //   isThined: args.get('isThined'),
    //   dottedline: args.get('dottedLine'),
    //   // dottedlineType: args.get('lineDashType'),
    //   dottedlineType: SysEnum.PolylineDottedLineType.DOTTED_LINE_CIRCLE,
    //   // colorList: colors,
    //   indexList: args.get('indexs'),
    //   isClickable: args.get('clickable'),
    // })
    let polyLine : Polyline
    let width:number = args.get('width')
    if(textures.length > 0) {
      polyLine = new Polyline({
        points: coords,
        width: width,
        join: SysEnum.LineJoinType.ROUND,
        cap: SysEnum.LineCapType.ROUND,
        textures: textures,
      })
    } else {
      polyLine = new Polyline({
        points: coords,
        fillcolor: colors[0],
        width: width,
        join: SysEnum.LineJoinType.ROUND,
        cap: SysEnum.LineCapType.ROUND,
        dottedline: true,
        dottedlineType: 'dotted_line_circle'
      });
    }
    polyLine.uuid = args.get('id')
    mapController?.addOverlay(polyLine)

    this.polyLineList.add(polyLine)
  }

  updatePolylineMember(args: ESObject){

    // 'id': this.id,
    // 'member': 'coordinates',
    // 'value': coordinates.map((coordinate) => coordinate.toMap()).toList(),
    // 'indexs':
    let member : string = args.get('member')
    if(member == 'coordinates') {
      let coords : LatLng[] = []
      let coordinates : Array<ESObject> = args.get('value')
      coordinates.forEach((element : ESObject) => {
        coords.push(new LatLng(element.get('latitude'), element.get('longitude')))
      });
      let id : string = args.get('id')
      for(let i = 0; i < this.polyLineList.length; i++) {
        let polyline : Polyline = this.polyLineList[i]
        if (polyline.uuid == id) {
          polyline.setPoints(coords)
          break
        }
      }
    }
  }

  clean(){
    this.polyLineList.forEach((value: Polyline) => value.remove())
    this.polyLineList.clear()
  }
}