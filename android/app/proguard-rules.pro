# === Flutter Wrapper ===
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.maps.** { *; }
-keep class com.google.maps.android.** { *; }
-dontwarn io.flutter.embedding.**

# Suppress warnings for WebView
-dontwarn android.webkit.**
-dontwarn android.window.BackEvent
-keep class android.window.** { *; }  # Keep all window-related classes
-keep class io.flutter.plugin.webview.** { *; }

-keep public class * extends org.microg.safeparcel.AutoSafeParcelable {
    @org.microg.safeparcel.SafeParcelable.Field *;
    @org.microg.safeparcel.SafeParceled *;
}

# Keep asInterface method cause it's accessed from SafeParcel
-keepattributes InnerClasses
-keepclassmembers interface * extends android.os.IInterface {
    public static class *;
}
-keep public class * extends android.os.Binder { public static *; }


# Ignore warnings related to any missing Flutter dependencies
-ignorewarnings

# === React Native ===
-keep,allowobfuscation @interface com.facebook.proguard.annotations.DoNotStrip
-keep,allowobfuscation @interface com.facebook.proguard.annotations.KeepGettersAndSetters
-keep,allowobfuscation @interface com.facebook.common.internal.DoNotStrip

-keep @com.facebook.proguard.annotations.DoNotStrip class *
-keep @com.facebook.common.internal.DoNotStrip class *
-keepclassmembers class * {
    @com.facebook.proguard.annotations.DoNotStrip *;
    @com.facebook.common.internal.DoNotStrip *;
}

-keepclassmembers @com.facebook.proguard.annotations.KeepGettersAndSetters class * {
    void set*(***);
    *** get*();
}

-keep class * extends com.facebook.react.bridge.JavaScriptModule { *; }
-keep class * extends com.facebook.react.bridge.NativeModule { *; }
-keepclassmembers,includedescriptorclasses class * { native <methods>; }
-keepclassmembers class * { @com.facebook.react.uimanager.UIProp <fields>; }
-keepclassmembers class * { @com.facebook.react.uimanager.annotations.ReactProp <methods>; }
-keepclassmembers class * { @com.facebook.react.uimanager.annotations.ReactPropGroup <methods>; }

# Suppress warnings related to React Native
-dontwarn com.facebook.react.**

# Keep React Native bridge classes
-keep,includedescriptorclasses class com.facebook.react.bridge.** { *; }

# === OkHttp ===
-keepattributes Signature
-keepattributes *Annotation*
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**

# === Okio ===
-keep class sun.misc.Unsafe { *; }
-dontwarn java.nio.file.*
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-keep class okio.** { *; }
-dontwarn okio.**

# === WebRTC ===
-keep class org.webrtc.** { *; }
-dontwarn org.chromium.build.BuildHooksAndroid

# === Additional Rules for Flutter and React Native ===
-keep class com.facebook.react.bridge.CatalystInstanceImpl { *; }
-keep class com.facebook.react.bridge.ExecutorToken { *; }
-keep class com.facebook.react.bridge.JavaScriptExecutor { *; }
-keep class com.facebook.react.bridge.ModuleRegistryHolder { *; }
-keep class com.facebook.react.bridge.ReadableType { *; }
-keep class com.facebook.react.bridge.queue.NativeRunnable { *; }
-keep class com.facebook.react.devsupport.** { *; }

# Suppress warnings from other libraries
-dontwarn com.facebook.react.devsupport.**
-dontwarn com.google.appengine.**
-dontwarn com.squareup.okhttp.**
-dontwarn javax.servlet.**
-dontwarn com.android.org.conscrypt.SSLParametersImpl

# === SVG Support ===
-keep public class com.horcrux.svg.** { *; }

# === Hermes ===
-keep class com.facebook.hermes.unicode.** { *; }

# === Fix for Missing Classes ===
# Suppress warnings related to BackEvent and other window classes
-dontwarn android.window.BackEvent
-keep class android.window.BackEvent { *; }
-keep class io.flutter.view.FlutterView {
    void startBackGesture(android.window.BackEvent);
}
-keep class android.window.** { *; }  # Keep all window-related classes