import { RNBestpayModule } from './native-module';
import { NativeEventEmitter } from 'react-native'

class Api {
    /**
     * 支付
     * @type {[type]} string    支付参数
     * @return {[type]} Promise
     */
    pay(paramsStr: string) : Promise {
        return RNBestpayModule.pay(paramsStr);
    }
}

export const Bestpay = new Api();