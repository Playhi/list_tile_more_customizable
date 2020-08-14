## [1.3.3] - 2020-08-14

* Try to solve [list_tile_more_customizable: 1.3.2 breaks the flutter (1.17.4) app](https://github.com/Playhi/list_tile_more_customizable/issues/1).

## [1.3.2] - 2020-08-14

* Some minor fix.

## [1.3.1] - 2020-08-14

* Sync Flutter change [#3176232](https://github.com/flutter/flutter/commit/3176232cb433d7f14969a568ec254e848542eb5b#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#edbd093](https://github.com/flutter/flutter/commit/edbd09379bc4e9b88f0c930757a9a1a3d532ed7c#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#42666df](https://github.com/flutter/flutter/commit/42666df9b708e93b87f1c32b36096c9f192d7dcc#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#e9a4759](https://github.com/flutter/flutter/commit/e9a4759947307e8208cfe8fda98b2f25ba4e8de1#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#60f1aa2](https://github.com/flutter/flutter/commit/60f1aa25d364dd87d641125b3eea786d1953a22e#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#8b63c65](https://github.com/flutter/flutter/commit/8b63c6543644ba0e5205f6f0c28cc20f48d92550#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#d64955a](https://github.com/flutter/flutter/commit/d64955ab49772836ccafb378f4c7b99934b72fbf#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#cccfe96](https://github.com/flutter/flutter/commit/cccfe96e721fcc2c7985fbd8a652d53f7c2f7682#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#34b7030](https://github.com/flutter/flutter/commit/34b7030c1e454730de6173272ce338c6a6eaa1d0#diff-53f33273ae4e7462729c5f4b7394428b).

## [1.3.0] - 2020-05-09

* As Flutter 1.17 stable has been released, 
we migrate the old textTheme term to the modern term. 
If you use an old version of flutter, 
we suggest you to upgrade your flutter. 
If you cannot use flutter which version is greater than `1.13.8` now, 
version `1.2.2` of `list_tile_more_customizable` 
can be used, and please don't upgrade the version 
of `list_tile_more_customizable` to `1.3.0` 
and newer.
* Sync Flutter change [#213027d](https://github.com/flutter/flutter/commit/213027dd8213898daed6a0c90635da1ec4562b70#diff-53f33273ae4e7462729c5f4b7394428b).
* Sync Flutter change [#2dc71a3](https://github.com/flutter/flutter/commit/2dc71a343f087da118356cabb23509e762166c23#diff-53f33273ae4e7462729c5f4b7394428b).

## [1.2.2] - 2020-03-22

* Fixed hot reload perform abnormally problem when change minVerticalPadding or minLeadingWidth.


## [1.2.1] - 2020-03-11

* Export default value of contentPadding.


## [1.2.0] - 2020-03-11

* Export default value of horizontalTitleGap, minVerticalPadding and minLeadingWidth.


## [1.1.0] - 2020-03-10

* MinVerticalPadding and MinLeadingWidth becomes customizable.


## [1.0.1] - 2020-03-02

* Fixed hot reload perform abnormally when change horizontalTitleGap problem.


## [1.0.0] - 2020-03-01

* Add TapDownDetails to onLongPress.
* Fixed null problem when onTap/onLongPress not used.


## [0.1.0] - 2020-03-01

* Support flutter 1.13.8-.


## [0.0.1] - 2020-03-01

* This project is a modified version of Flutter ListTile, 
which provides more customizable functions, 
with these functions, 
you can set the horizontalTitleGap 
and get the TapDownDetails when onTap occurred.
