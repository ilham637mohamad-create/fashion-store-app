plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutter_application_1"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.flutter_application_1"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ========== FIX FOR MISSING APK ==========
// This ensures the APK is copied to the location Flutter expects
tasks.register("syncFlutterApks", Copy) {
    def flutterOutDir = file("$buildDir/outputs/flutter-apk")
    def cliOutDir = new File(rootDir.parentFile, "build/app/outputs/flutter-apk")
    from(flutterOutDir)
    into(cliOutDir)
    doFirst { cliOutDir.mkdirs() }
}

android.applicationVariants.all { variant ->
    def cap = variant.name.capitalize()
    ["package${cap}", "assemble${cap}"].each { tname ->
        tasks.matching { it.name == tname }.all { t ->
            t.finalizedBy(tasks.named("syncFlutterApks"))
        }
    }
}
// ========== END OF FIX ==========