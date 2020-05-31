
# react-native-bestpay

[![npm version](https://img.shields.io/npm/v/react-native-bestpay.svg)](https://www.npmjs.com/package/react-native-bestpay)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

本插件参考了 [翼支付 - App支付文档](https://h5.bestpay.com.cn/subapps/merchant-portal-h5/index.html#/documentDetails/app?firstId=1006&name=APP%E6%94%AF%E4%BB%98&docId=1013)。

## 安装

```bash
yarn add react-native-bestpay
```

### React Native 0.59 以下

```sh
react-native link react-native-china-unionpay
```

### iOS 配置

1. 添加白名单：将字段BestPay添加进系统的白名单，如下图

<p align="center"><img src="https://raw.githubusercontent.com/caipeiming/react-native-bestpay/master/1.png" alt="Xcode set iOS urltypes"></p>

2. 兼容http协议，因为iOS9系统默认协议为https协议，因此需要在系统中设置允许http协议。如下图：

<p align="center"><img src="https://raw.githubusercontent.com/caipeiming/react-native-bestpay/master/2.png" alt="Xcode set iOS NSAppTransportSecurity"></p>

3. 由于安全键盘库中使用了分类方法, 所以需要在 TARGETS -> Build Setting -> Linking -> Other Linker Flags 添加 -ObjC -all_load

## 使用

```javascript
import {Bestpay, BestpayEmitter} from 'react-native-bestpay';
```

### pay

使用"翼支付"支付

```javascript
Bestpay.pay(order, license);
```

order - 参数order是一个对象，里面包含了跳转类型，订单key=value串（参见参数表），订单详细信息，具体参数和拼接规则请阅览《接口文档》及SDK使用文档。

license - LICENSE申请方式，请联系翼支付对应联调人员获取。

### BestpayEmitter

用于支付结果的事件订阅。

```javascript
export default class App extends Component {
    constructor(props) {
        super(props);
        this.onBestpayResponse = this._onBestpayResponse.bind(this);
    }

    componentDidMount() {
        BestpayEmitter.on("BestPay_Response", this.onBestpayResponse);
    }

    componentWillUnmount() {
        BestpayEmitter.removeListener('BestPay_Response', this.onBestpayResponse);
    }

    _onBestpayResponse(data) {
        console.log(data);
    }
}
```
