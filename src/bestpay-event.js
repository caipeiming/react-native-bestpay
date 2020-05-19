import { NativeEventEmitter } from 'react-native'
import EventEmitter from 'events';
import { RNBestpayModule } from './native-module'

class MyEmitter extends EventEmitter {}

export const BestpayEmitter = new MyEmitter();

const nativeEventEmitter = new NativeEventEmitter(RNBestpayModule);

nativeEventEmitter.addListener('BestPay_Response', (data) => {
    BestpayEmitter.emit('BestPay_Response', data);
});