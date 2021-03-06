package top.cpming.rn.bestpay;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import com.bestpay.app.PaymentTask;
import com.facebook.react.bridge.ActivityEventListener;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class RNBestpayModule extends ReactContextBaseJavaModule implements ActivityEventListener {
    private final ReactApplicationContext reactContext;
    private final String TAG = "RNBestpayModule";

    public RNBestpayModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
        this.reactContext.addActivityEventListener(this);
    }

    @Override
    public String getName() {
        return "RNBestpay";
    }

    @Override
    public void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
        Log.e(TAG, requestCode + "  " + resultCode);
        this.sendEvent(Arguments.fromBundle(data.getExtras()));
    }

    @Override
    public void onNewIntent(Intent intent) {

    }

    @ReactMethod
    public void pay(String paramsStr, String license) {
        PaymentTask paymentTask = new PaymentTask(getCurrentActivity());
        paymentTask.pay(paramsStr, license);
    }

    private void sendEvent(WritableMap response) {
        reactContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit("BestPay_Response", response);
    }

}
