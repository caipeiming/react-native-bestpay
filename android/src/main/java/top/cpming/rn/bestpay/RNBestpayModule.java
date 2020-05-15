
package top.cpming.rn.bestpay;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;

public class RNBestpayModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNBestpayModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNBestpay";
  }
}