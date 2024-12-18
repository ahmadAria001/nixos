with (import <nixpkgs> { 
	config = { 
		allowUnfree = true; 
		android_sdk.accept_license = true; 
	}; 
});
let
	android = pkgs.androidenv.composeAndroidPackages {
		buildToolsVersions = [ "33.0.1" "31.0.0" "30.0.3" "28.0.3" ];
		includeNDK = true;
		ndkVersions = [ "25.1.8937393" ];
		cmakeVersions = [ "3.22.1" ];
		platformVersions = [ "34" "33" "31" "28" ];
		abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
	};
	sdk = android.androidsdk;
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      flutter
      jdk17
      cmake
      # buildFHSUserEnv
    ];

    shellHook=''
	export USE_CCACHE=1
        export ANDROID_SDK_ROOT=${sdk}/libexec/android-sdk;
	export CHROME_EXECUTABLE=${pkgs.chromium}/bin/chromium;
	export PATH=$ANDROID_HOME/tools:$PATH
	export PATH=$ANDROID_HOME/platform-tools:$PATH
	export FLUTTER_SDK=${pkgs.flutter}
    '';
 }
