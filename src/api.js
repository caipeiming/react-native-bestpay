import { RNBestpayModule } from './native-module';
import { NativeEventEmitter } from 'react-native'

class Api {
    /**
     * 支付
     * @type {[type]} string    支付参数
     * @type {[type]} string	商户 APP 申请的安全键盘 License
     */
    pay(paramsStr: string, license: string) {
        RNBestpayModule.pay(paramsStr, license);
    }
}

export const Bestpay = new Api();