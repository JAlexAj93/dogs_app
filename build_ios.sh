# Put this script at Tigo folder level and make sure that MasterApp-TigoMoney2.0-Mobile exists
# to run the following commands

# Run this command with `bash build_ios.sh` or `bash build_ios.sh run` to build the application. Make sure to enable the simulator for iOS

function print_bold() {
    echo -e "\033[1m$1\033[0m"
}

print_bold "Preparing environment for iOS"

print_bold "Executing flutter commands in"

pwd

print_bold "Executing flutter pub upgrade"

flutter pub upgrade

print_bold "Executing flutter clean"

flutter clean

print_bold "Cleaning iOS folder"

rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Podfile.lock
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec

sleep 4

print_bold "iOS folder cleaned"

print_bold "Cleaning cache -f"

flutter pub cache clean -f

print_bold "Getting libraries from flutter pub"

flutter pub get

print_bold "Installing pods for iOS"

cd ios
pod install --repo-update

echo "Next steps (Only for physcical devices):"
echo "1. Select your personal team to sign the app"
echo "2. Change the bundle id for another one like : \$bundle_id_2 to allow compile in real devices. Get help if your bundle id is not working"
echo "3. Select the In  Runner  ( Project - Tab)> Runner > Configurations > Debug qa > Select the configuration Set for each one asked (Select debug-qa) in the list of avails configuration set"
echo "4. Run the app with your favorite IDE or from the console using flutter commands"
echo "5. Trust on developer and go to Device Management in iOS to allow install the app in real devices. See more: https://docs.flutter.dev/get-started/install/macos#deploy-to-ios-devices"

echo "NOTE: If you are getting some issues that is not described above, may you have to fix it first and run again. Like fixing the Info.plist with correct data. Otherwise get some help."
echo "Almos always is just read the console errors and fix what it is asking for"

echo "\n"
echo "Use this script each time you switch between branches, sometimes the cache give us some errors."

# Return to flutter folder root
cd ..

if [ "$1" == run ]; then
     echo "Building flutter app"
     flutter run --flavor qaPA
fi

echo "Finished script"