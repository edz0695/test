package com.sambhavapps.sambhav;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import datamodels.PWEStaticDataModel;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCall;

import android.annotation.TargetApi;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.database.Cursor;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.provider.ContactsContract;

import com.easebuzz.payment.kit.PWECouponsActivity;
import com.google.gson.Gson;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "easebuzz";
    MethodChannel.Result channel_result;
    private boolean start_payment = true;
    private static final String CHANNEL2 = "com.sambhavapps/Contacts";

    List<Map> contacts = new ArrayList<Map>();

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        start_payment = true;

        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        channel_result = result;
                        if (call.method.equals("payWithEasebuzz")) {
                            if (start_payment) {
                                start_payment = false;
                                startPayment(call.arguments);
                            }
                        }
                    }
                }
        );

    }
    private void startPayment(Object arguments) {
        try {
            Gson gson = new Gson();
            JSONObject parameters = new JSONObject(gson.toJson(arguments));
            Intent intentProceed = new Intent(getActivity(), PWECouponsActivity.class);
            intentProceed.setFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            Iterator<?> keys = parameters.keys();
            while(keys.hasNext() ) {
                String value = "";
                String key = (String) keys.next();
                value = parameters.optString(key);
                if (key.equals("amount")){
                    Double amount = new Double(parameters.optString("amount"));
                    intentProceed.putExtra(key,amount);
                } else {
                    intentProceed.putExtra(key,value);
                }
            }
            startActivityForResult(intentProceed, PWEStaticDataModel.PWE_REQUEST_CODE );
        }catch (Exception e) {
            start_payment=true;
            Map<String, Object> error_map = new HashMap<>();
            Map<String, Object> error_desc_map = new HashMap<>();
            String error_desc = "exception occured:"+e.getMessage();
            error_desc_map.put("error","Exception");
            error_desc_map.put("error_msg",error_desc);
            error_map.put("result",PWEStaticDataModel.TXN_FAILED_CODE);
            error_map.put("payment_response",error_desc_map);
            channel_result.success(error_map);
        }
    }
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if(data != null ) {
            if(requestCode==PWEStaticDataModel.PWE_REQUEST_CODE)
            {
                start_payment=true;
                JSONObject response = new JSONObject();
                Map<String, Object> error_map = new HashMap<>();
                if(data != null ) {
                    String result = data.getStringExtra("result");
                    String payment_response = data.getStringExtra("payment_response");
                    try {
                        JSONObject obj = new JSONObject(payment_response);
                        response.put("result", result);
                        response.put("payment_response", obj);
                        channel_result.success(JsonConverter.convertToMap(response));
                    }catch (Exception e){
                        Map<String, Object> error_desc_map = new HashMap<>();
                        error_desc_map.put("error",result);
                        error_desc_map.put("error_msg",payment_response);
                        error_map.put("result",result);
                        error_map.put("payment_response",error_desc_map);
                        channel_result.success(error_map);
                    }
                }else{
                    Map<String, Object> error_desc_map = new HashMap<>();
                    String error_desc = "Empty payment response";
                    error_desc_map.put("error","Empty error");
                    error_desc_map.put("error_msg",error_desc);
                    error_map.put("result","payment_failed");
                    error_map.put("payment_response",error_desc_map);
                    channel_result.success(error_map);
                }
            }else
            {
                super.onActivityResult(requestCode, resultCode, data);
            }
        }
    }
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL2)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method == "getContactsList") {

                            }
                            getPhoneNumbers();
                            result.success(contacts);
                            // This method is invoked on the main thread.

                        }
                );
    }


    @TargetApi(VERSION_CODES.ECLAIR)
    private void getPhoneNumbers() {
        contacts.clear();

        Cursor phones = getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null);

        // Loop Through All The Numbers
        while (phones.moveToNext()) {

            String name = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME));
            String phoneNumber = phones.getString(phones.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER));

            // Cleanup the phone number
            phoneNumber = phoneNumber.replaceAll("[()\\s-]+", "");

            // Enter Into Hash Map
            Map<String, String> nameMap = new HashMap<String, String>();
            nameMap.put("Name", name);
            nameMap.put("MobileNumber", phoneNumber);
            contacts.add(nameMap);

        }

        phones.close();

    }
}
