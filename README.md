# JNHorizontalGroupAvatarCollectionView

[![Version](https://img.shields.io/cocoapods/v/JNHorizontalGroupAvatarCollectionView.svg?style=flat)](http://cocoapods.org/pods/JNHorizontalGroupAvatarCollectionView)
[![License](https://img.shields.io/cocoapods/l/JNHorizontalGroupAvatarCollectionView.svg?style=flat)](http://cocoapods.org/pods/JNHorizontalGroupAvatarCollectionView)
[![Platform](https://img.shields.io/cocoapods/p/JNHorizontalGroupAvatarCollectionView.svg?style=flat)](http://cocoapods.org/pods/JNHorizontalGroupAvatarCollectionView)

**JNHorizontalGroupAvatarCollectionView** is used to show a collection of avatar images with the option to show initials, it shows as much as the phone screen can present with a horizontal scrolling to see more.

## Screenshots
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot1.png" width="280"/><img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot2.png" width="280"/>
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot3.png" width="280"/>
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot4.png" width="280"/>
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot5.png" width="280"/>
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot6.png" width="280"/>
<img src="https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/raw/master/Images/screenshot7.png" width="280"/>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+ / macOS 10.10+
- Xcode 9.0+
- Swift 4+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate JNHorizontalGroupAvatarCollectionView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby

use_frameworks!

target '<Your Target Name>' do
pod 'JNHorizontalGroupAvatarCollectionView'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

#### To add JNHorizontalGroupAvatarCollectionView in interface builder:

1. Put some UIView and change the class to "JNHorizontalGroupAvatarCollectionView"

2. Add refrence for it in the view controller.

3. Implement JNHorizontalGroupAvatarCollectionViewDelegate in your view controller and set delegate like the following:

```swift

/**
Number of items
- Returns: The number of items in collection view
*/
func horizontalGroupAvatarCollectionViewNumberOfItems() -> Int

/**
Data for item at index
- Parameter index: The item index
- Returns: The data for the item
*/
func horizontalGroupAvatarCollectionView(dataForItemAt index: Int) -> [JNGroupAvatar]

/**
Did clear data
*/
func horizontalGroupAvatarCollectionViewDidClearData()
```

4. Implement JNGroupAvatar In your items 'like users' class like the following:

```swift

/**
Get display name which will be used for the initials.
- Returns: The display name for the avatar
*/
func getGroupAvatarDisplayName() -> String

/**
Get Avatar image url which will be used as avatar url
- Returns: The image url
*/
func getGroupAvatarImageUrl() -> String

/**
Get Avatar image which will be used as avatar
- Returns: The image
*/
func getGroupAvatarImage() -> UIImage
```

* cellPadding : The padding between each avatars image.
* avatars : Array fo JNGroupAvatar which will be used to draw .
* imagesLayoutDirection : The image layout direction to use (right to left or left to right).
* avatarsMargin : The margin between avatars (separator with or height).
* separatorColor : The separator color to use.
* placeHolderImage : The placeholder to use if the image failed to load.
* showInitails : Show initials if the image failed to load or not, if false then set placeholder image.
* initialsFont : The font to use for the initials.
* initialTextColor : The text color to use for the initials.

> The libarary is dependant on [JNGroupAvatarImageView](https://github.com/JNDisrupter/JNGroupAvatarImageView), check it for more info.


## Author

Jayel Zaghmoutt, Mohammad Nabulsi & Ali Hamad

## License

JNHorizontalGroupAvatarCollectionView is available under the MIT license. See the [LICENSE](https://github.com/JNDisrupter/JNHorizontalGroupAvatarCollectionView/blob/master/LICENSE) file for more info.
