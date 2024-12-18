{ config, pkgs, ... }: 
let
	config = { 
		allowUnfree = true; 
		android_sdk.accept_license = true; 
	};

	android = pkgs.androidenv.composeAndroidPackages {
		buildToolsVersions = [ "33.0.1" "31.0.0" "30.0.3" "28.0.3" ];
		includeNDK = true;
		ndkVersions = [ "25.1.8937393" ];
		cmakeVersions = [ "3.22.1" ];
		platformVersions = [ "34" "33" "31" "28" ];
		abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
	};
	sdk = android.androidsdk;
in {
	environment = {
		systemPackages = with pkgs; [
			flutter
			jdk
			cmake
		];
		variables = {
			USE_CCACHE=1;
			ANDROID_SDK_ROOT="${sdk}/libexec/android-sdk";
			CHROME_EXECUTABLE="${pkgs.chromium}/bin/chromium";
			PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH";
			FLUTTER_SDK="${pkgs.flutter}";
		};
	};
}
