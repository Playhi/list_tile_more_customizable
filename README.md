# list_tile_more_customizable

A ListTile with more customizable details.

## Introduction

This project is a modified version of Flutter ListTile, 
and provides more customizable functions, 
with these functions, 
you can set the horizontalTitleGap, minVerticalPadding, minLeadingWidth
and get the TapDownDetails when onTap or onLongPress occurred.

## Usage

```dart
ListTileMoreCustomizable(
    title: Text("Title"),
    trailing: Icon(Icons.people),
    horizontalTitleGap: 0.0,
    minVerticalPadding: 0.0,
    minLeadingWidth: 40.0,
    onTap: (details){},
    onLongPress: (details){},
);
```

## Example 
[Example](https://pub.dev/packages/list_tile_more_customizable#-example-tab-)
