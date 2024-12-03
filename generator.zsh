#!/bin/zsh

# Default input image paths
DEFAULT_INPUT_ICON="./assets/images/app_launcher_icon.jpg"

# Use provided arguments or default values
INPUT_ICON=${1:-$DEFAULT_INPUT_ICON}

# Define paths
IOS_ICON_PATH="./ios/Runner/Assets.xcassets/AppIcon.appiconset"
IOS_LAUNCH_PATH="./ios/Runner/Assets.xcassets/LaunchImage.imageset"
IOS_STORYBOARD_PATH="./ios/Runner/Base.lproj/LaunchScreen.storyboard"
ANDROID_RES_PATH="./android/app/src/main/res"
ANDROID_DRAWABLE_PATH="./android/app/src/main/res/drawable"
ANDROID_VALUES_PATH="./android/app/src/main/res/values"
ANDROID_LAUNCH_PATH="./android/app/src/main/res/drawable/launch_background.xml"

# Function to install ImageMagick
install_imagemagick() {
    echo "ImageMagick is not installed. Installing ImageMagick..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS (using Homebrew)
        if command -v brew &> /dev/null; then
            brew install imagemagick
        else
            echo "Homebrew is not installed. Please install Homebrew first (https://brew.sh/)."
            exit 1
        fi
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux (apt-based systems)
        if command -v apt-get &> /dev/null; then
            sudo apt-get update
            sudo apt-get install -y imagemagick
        else
            echo "Unsupported package manager. Please install ImageMagick manually."
            exit 1
        fi
    else
        echo "Unsupported operating system. Please install ImageMagick manually."
        exit 1
    fi
}

# Ensure ImageMagick is installed
if ! command -v magick &> /dev/null; then
    install_imagemagick
fi

# Create iOS App Icons (in the designated folder)
mkdir -p $IOS_ICON_PATH

echo "Generating iOS App Icons..."
magick $INPUT_ICON -resize 20x20   "$IOS_ICON_PATH/Icon-App-20x20@1x.png"
magick $INPUT_ICON -resize 40x40   "$IOS_ICON_PATH/Icon-App-20x20@2x.png"
magick $INPUT_ICON -resize 60x60   "$IOS_ICON_PATH/Icon-App-20x20@3x.png"
magick $INPUT_ICON -resize 29x29   "$IOS_ICON_PATH/Icon-App-29x29@1x.png"
magick $INPUT_ICON -resize 58x58   "$IOS_ICON_PATH/Icon-App-29x29@2x.png"
magick $INPUT_ICON -resize 87x87   "$IOS_ICON_PATH/Icon-App-29x29@3x.png"
magick $INPUT_ICON -resize 40x40   "$IOS_ICON_PATH/Icon-App-40x40@1x.png"
magick $INPUT_ICON -resize 80x80   "$IOS_ICON_PATH/Icon-App-40x40@2x.png"
magick $INPUT_ICON -resize 120x120 "$IOS_ICON_PATH/Icon-App-40x40@3x.png"
magick $INPUT_ICON -resize 120x120 "$IOS_ICON_PATH/Icon-App-60x60@2x.png"
magick $INPUT_ICON -resize 180x180 "$IOS_ICON_PATH/Icon-App-60x60@3x.png"
magick $INPUT_ICON -resize 76x76   "$IOS_ICON_PATH/Icon-App-76x76@1x.png"
magick $INPUT_ICON -resize 152x152 "$IOS_ICON_PATH/Icon-App-76x76@2x.png"
magick $INPUT_ICON -resize 167x167 "$IOS_ICON_PATH/Icon-App-83.5x83.5@2x.png"
magick $INPUT_ICON -resize 1024x1024 "$IOS_ICON_PATH/Icon-App-1024x1024@1x.png"

# Generate iOS Contents.json for App Icons
cat > "$IOS_ICON_PATH/Contents.json" << EOL
{
  "images" : [
    { "size" : "20x20", "idiom" : "iphone", "filename" : "Icon-App-20x20@2x.png", "scale" : "2x" },
    { "size" : "20x20", "idiom" : "iphone", "filename" : "Icon-App-20x20@3x.png", "scale" : "3x" },
    { "size" : "29x29", "idiom" : "iphone", "filename" : "Icon-App-29x29@1x.png", "scale" : "1x" },
    { "size" : "29x29", "idiom" : "iphone", "filename" : "Icon-App-29x29@2x.png", "scale" : "2x" },
    { "size" : "29x29", "idiom" : "iphone", "filename" : "Icon-App-29x29@3x.png", "scale" : "3x" },
    { "size" : "40x40", "idiom" : "iphone", "filename" : "Icon-App-40x40@2x.png", "scale" : "2x" },
    { "size" : "40x40", "idiom" : "iphone", "filename" : "Icon-App-40x40@3x.png", "scale" : "3x" },
    { "size" : "60x60", "idiom" : "iphone", "filename" : "Icon-App-60x60@2x.png", "scale" : "2x" },
    { "size" : "60x60", "idiom" : "iphone", "filename" : "Icon-App-60x60@3x.png", "scale" : "3x" },
    { "size" : "20x20", "idiom" : "ipad", "filename" : "Icon-App-20x20@1x.png", "scale" : "1x" },
    { "size" : "20x20", "idiom" : "ipad", "filename" : "Icon-App-20x20@2x.png", "scale" : "2x" },
    { "size" : "29x29", "idiom" : "ipad", "filename" : "Icon-App-29x29@1x.png", "scale" : "1x" },
    { "size" : "29x29", "idiom" : "ipad", "filename" : "Icon-App-29x29@2x.png", "scale" : "2x" },
    { "size" : "40x40", "idiom" : "ipad", "filename" : "Icon-App-40x40@1x.png", "scale" : "1x" },
    { "size" : "40x40", "idiom" : "ipad", "filename" : "Icon-App-40x40@2x.png", "scale" : "2x" },
    { "size" : "76x76", "idiom" : "ipad", "filename" : "Icon-App-76x76@1x.png", "scale" : "1x" },
    { "size" : "76x76", "idiom" : "ipad", "filename" : "Icon-App-76x76@2x.png", "scale" : "2x" },
    { "size" : "83.5x83.5", "idiom" : "ipad", "filename" : "Icon-App-83.5x83.5@2x.png", "scale" : "2x" },
    { "size" : "1024x1024", "idiom" : "ios-marketing", "filename" : "Icon-App-1024x1024@1x.png", "scale" : "1x" }
  ],
  "info" : { "version" : 1, "author" : "xcode" }
}
EOL

# Create iOS Launch Images (only 2x and 3x) in the designated folder
mkdir -p $IOS_LAUNCH_PATH

echo "Generating iOS Launch Images..."
magick $INPUT_ICON -resize 512x512 "$IOS_LAUNCH_PATH/LaunchImage@2x.png"
magick $INPUT_ICON -resize 768x768 "$IOS_LAUNCH_PATH/LaunchImage@3x.png"
magick $INPUT_ICON -resize 1024x1024 "$IOS_LAUNCH_PATH/LaunchImage.png"

# Generate iOS Contents.json for Launch Images
cat > "$IOS_LAUNCH_PATH/Contents.json" << EOL
{
  "images": [
    { "idiom": "universal", "filename": "LaunchImage@3x.png", "scale": "3x" },
    { "idiom": "universal", "filename": "LaunchImage@2x.png", "scale": "2x" },
    { "idiom": "universal", "filename": "LaunchImage.png", "scale": "1x" },
  ],
  "info": { "version": 1, "author": "xcode" }
}
EOL



if [[ -f "$IOS_STORYBOARD_PATH" ]]; then
  echo "Modifying $IOS_STORYBOARD_PATH to update the background color to #FFFFFF..."

  # Replace the background color with the new color #FFFFFF (RGB: 255, 255, 255)
  sed -i '' 's|<color key="backgroundColor"[^>]*>|<color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>|' $IOS_STORYBOARD_PATH

else
  echo "LaunchScreen.storyboard not found. Please check if it's created correctly."
fi

# Android - Place the launch image and update the launch_background.xml
echo "Updating Android drawable and launch background..."

# Ensure drawable and values directories exist
mkdir -p $ANDROID_DRAWABLE_PATH
mkdir -p $ANDROID_VALUES_PATH

# Generate Android launcher icons for different densities
magick $INPUT_ICON -resize 48x48   "$ANDROID_RES_PATH/mipmap-mdpi/ic_launcher_foreground.png"
magick $INPUT_ICON -resize 72x72   "$ANDROID_RES_PATH/mipmap-hdpi/ic_launcher_foreground.png"
magick $INPUT_ICON -resize 96x96   "$ANDROID_RES_PATH/mipmap-xhdpi/ic_launcher_foreground.png"
magick $INPUT_ICON -resize 144x144 "$ANDROID_RES_PATH/mipmap-xxhdpi/ic_launcher_foreground.png"
magick $INPUT_ICON -resize 192x192 "$ANDROID_RES_PATH/mipmap-xxxhdpi/ic_launcher_foreground.png"
magick $INPUT_ICON -resize 512x512 "$ANDROID_RES_PATH/ic_launcher_playstore.png"  # Play Store icon

# Generate icons for adaptive icons (foreground)
magick $INPUT_ICON -resize 432x432 "$ANDROID_RES_PATH/mipmap-xxxhdpi/ic_launcher_foreground_adaptive.png"
magick $INPUT_ICON -resize 324x324 "$ANDROID_RES_PATH/mipmap-xxhdpi/ic_launcher_foreground_adaptive.png"
magick $INPUT_ICON -resize 216x216 "$ANDROID_RES_PATH/mipmap-xhdpi/ic_launcher_foreground_adaptive.png"
magick $INPUT_ICON -resize 162x162 "$ANDROID_RES_PATH/mipmap-hdpi/ic_launcher_foreground_adaptive.png"
magick $INPUT_ICON -resize 108x108 "$ANDROID_RES_PATH/mipmap-mdpi/ic_launcher_foreground_adaptive.png"

# Configure android launcher icon config.
launch_background='<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/white"/>
    <!-- <foreground android:drawable="@mipmap/ic_launcher"/> -->
    <foreground>
    <inset
        android:drawable="@mipmap/ic_launcher_foreground_adaptive"
        android:inset="16%" />
    </foreground>
</adaptive-icon>'

# Create directory for any dpi 
mkdir -p "$ANDROID_RES_PATH/mipmap-anydpi-v26"

# Add android icon config content to file
cat > "$ANDROID_RES_PATH/mipmap-anydpi-v26/ic_launcher.xml" << EOL
$launch_background
EOL


# Update launch_background.xml
if [[ -f "$ANDROID_LAUNCH_PATH" ]]; then
  echo "Modifying $ANDROID_LAUNCH_PATH to update the background color and add the launch image..."

  # Replace the existing background color with @color/white
  sed -i '' 's|<item android:drawable="?android:colorBackground" />|<item android:drawable="@color/white" />|' $ANDROID_LAUNCH_PATH

  sed -i '' '/<\/layer-list>/ i\
    <item>\
        <bitmap android:src="@mipmap/ic_launcher_foreground" android:gravity="center" />\
    </item>' $ANDROID_LAUNCH_PATH

else
  echo "launch_background.xml not found. Please check if it's created correctly."
fi

# Create or update colors.xml for primaryColor
cat > "$ANDROID_VALUES_PATH/colors.xml" << EOL
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="white">#FFFFFF</color>
</resources>
EOL

echo "iOS and Android assets generation complete!"
