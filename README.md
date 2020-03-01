# list_tile_more_customizable

A ListTile with more customizable details.

## Introduction

This project is a modified version of Flutter ListTile, 
and provides more customizable functions, 
with these functions, 
you can set the horizontalTitleGap 
and get the TapDownDetails when onTap or onLongPress occurred.

## Usage

```dart
ListTileMoreCustomizable(
    title: Text("Title"),
    trailing: Icon(Icons.people),
    horizontalTitleGap: 0.0,
    onTap: (details){},
    onLongPress: (details){},
);
```
