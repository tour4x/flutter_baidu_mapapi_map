
import { BinaryMessenger, MessageCodec, PlatformView, PlatformViewFactory } from '@ohos/flutter_ohos';
import { MapPlatformView } from './MapPlatformView';

export class MapViewFactory extends PlatformViewFactory {

    message: BinaryMessenger;

    constructor(message: BinaryMessenger, createArgsCodes: MessageCodec<Object>) {
        super(createArgsCodes);
        this.message = message;
    }

    public create(context: Context, viewId: number, args: ESObject): PlatformView {
        return new MapPlatformView(context, viewId, args, this.message);
    }

}
