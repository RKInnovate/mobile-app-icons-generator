# iOS and Android App Icon and Launch Screen Generator

This script automates the process of generating app icons and launch screen images for both iOS and Android platforms using a single input image.

## Prerequisites

1. **ImageMagick**
   - The script relies on ImageMagick for image resizing and manipulation. Make sure it is installed on your system.
   - The script includes an automatic installation process for ImageMagick if it is not already installed.

## Features

- Generates iOS app icons in various sizes and formats, compatible with the `AppIcon.appiconset` folder.
- Generates iOS launch screen images and their associated `Contents.json` file.
- Generates Android app icons for all `res` drawable folders (e.g., `mdpi`, `hdpi`, `xhdpi`, `xxhdpi`, `xxxhdpi`).
- Generates Android launch screen background configuration.

## Usage

1. Place your source image in the default location: `./assets/images/app_launcher_icon.jpg`.
2. Run the script:
   ```bash
   ./generator.zsh
   ```
   Alternatively, provide a custom input image as an argument:
   ```bash
   ./generator.zsh /path/to/your/image.jpg
   ```

## Generated Assets

### iOS

#### App Icons
- The script generates app icons for all required sizes and organizes them into the `ios/Runner/Assets.xcassets/AppIcon.appiconset` directory.
- A `Contents.json` file is also generated to define the icon set.

#### Launch Screen Images
- The launch images are created in the `ios/Runner/Assets.xcassets/LaunchImage.imageset` directory.
- A `Contents.json` file is generated for the launch images.

### Android

#### App Icons
- App icons are generated for the following drawable folders:
  - `mipmap-mdpi`
  - `mipmap-hdpi`
  - `mipmap-xhdpi`
  - `mipmap-xxhdpi`
  - `mipmap-xxxhdpi`
- Icons are saved as `ic_launcher.png` and `ic_launcher_round.png` in their respective directories.

#### Launch Screen Background
- The launch background is configured in `android/app/src/main/res/drawable/launch_background.xml`.
- A simple color-based background is defined, which can be customized.

## Installation

### Installing ImageMagick

If ImageMagick is not installed, the script will attempt to install it automatically. You can also install it manually:

- **macOS** (using Homebrew):
  ```bash
  brew install imagemagick
  ```

- **Ubuntu/Linux** (using apt):
  ```bash
  sudo apt-get update
  sudo apt-get install -y imagemagick
  ```

## Notes

- The default input image should ideally be a square image with a resolution of at least 1024x1024 for optimal results.
- Ensure you have appropriate permissions to create and modify files in the target directories.
