
# react-native-bestpay

## Getting started

`$ npm install react-native-bestpay --save`

### Mostly automatic installation

`$ react-native link react-native-bestpay`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-bestpay` and add `RNBestpay.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBestpay.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import top.cpming.rn.bestpay.RNBestpayPackage;` to the imports at the top of the file
  - Add `new RNBestpayPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-bestpay'
  	project(':react-native-bestpay').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-bestpay/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-bestpay')
  	```


## Usage
```javascript
import RNBestpay from 'react-native-bestpay';

// TODO: What to do with the module?
RNBestpay;
```
  