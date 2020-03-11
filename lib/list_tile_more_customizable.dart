library list_tile_more_customizable;

// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE_RAW_FLUTTER file.

// This file has been modified based on The Flutter Authors' version,
// which can be found in https://github.com/Playhi/list_tile_more_customizable/raw/8b76fdd7d0fc55c211a572b5177858c9d6ef07a1/lib/list_tile_more_customizable.dart,
// which has been used as the initial version of this file.

// Copyright 2020 The List Tile More Customizable Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class ListTileMoreCustomizableDefaultValue {
  // The default horizontal gap between the titles and the leading/trailing widgets.
  static const double horizontalTitleGap = 16.0;

  // The default minimum padding on the top and bottom of the title and subtitle widgets.
  static const double minVerticalPadding = 4.0;

  // The default minimum leading width.
  static const double minLeadingWidth = 40.0;

  // The default content padding.
  static const EdgeInsets contentPadding =
      EdgeInsets.symmetric(horizontal: 16.0);
}

/// Defines the title font used for [ListTileMoreCustomizable] descendants of a [ListTileMoreCustomizableTheme].
///
/// List tiles that appear in a [Drawer] use the theme's [TextTheme.bodyText1]
/// text style, which is a little smaller than the theme's [TextTheme.subtitle1]
/// text style, which is used by default.
enum ListTileMoreCustomizableStyle {
  /// Use a title font that's appropriate for a [ListTileMoreCustomizable] in a list.
  list,

  /// Use a title font that's appropriate for a [ListTileMoreCustomizable] that appears in a [Drawer].
  drawer,
}

/// An inherited widget that defines color and style parameters for [ListTileMoreCustomizable]s
/// in this widget's subtree.
///
/// Values specified here are used for [ListTileMoreCustomizable] properties that are not given
/// an explicit non-null value.
///
/// The [Drawer] widget specifies a tile theme for its children which sets
/// [style] to [ListTileMoreCustomizableStyle.drawer].
class ListTileMoreCustomizableTheme extends InheritedTheme {
  /// Creates a list tile theme that controls the color and style parameters for
  /// [ListTileMoreCustomizable]s.
  const ListTileMoreCustomizableTheme({
    Key key,
    this.dense = false,
    this.style = ListTileMoreCustomizableStyle.list,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    Widget child,
  }) : super(key: key, child: child);

  /// Creates a list tile theme that controls the color and style parameters for
  /// [ListTileMoreCustomizable]s, and merges in the current list tile theme, if any.
  ///
  /// The [child] argument must not be null.
  static Widget merge({
    Key key,
    bool dense,
    ListTileMoreCustomizableStyle style,
    Color selectedColor,
    Color iconColor,
    Color textColor,
    EdgeInsetsGeometry contentPadding,
    @required Widget child,
  }) {
    assert(child != null);
    return Builder(
      builder: (BuildContext context) {
        final ListTileMoreCustomizableTheme parent =
            ListTileMoreCustomizableTheme.of(context);
        return ListTileMoreCustomizableTheme(
          key: key,
          dense: dense ?? parent.dense,
          style: style ?? parent.style,
          selectedColor: selectedColor ?? parent.selectedColor,
          iconColor: iconColor ?? parent.iconColor,
          textColor: textColor ?? parent.textColor,
          contentPadding: contentPadding ?? parent.contentPadding,
          child: child,
        );
      },
    );
  }

  /// If true then [ListTileMoreCustomizable]s will have the vertically dense layout.
  final bool dense;

  /// If specified, [style] defines the font used for [ListTileMoreCustomizable] titles.
  final ListTileMoreCustomizableStyle style;

  /// If specified, the color used for icons and text when a [ListTileMoreCustomizable] is selected.
  final Color selectedColor;

  /// If specified, the icon color used for enabled [ListTileMoreCustomizable]s that are not selected.
  final Color iconColor;

  /// If specified, the text color used for enabled [ListTileMoreCustomizable]s that are not selected.
  final Color textColor;

  /// The tile's internal padding.
  ///
  /// Insets a [ListTileMoreCustomizable]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  final EdgeInsetsGeometry contentPadding;

  /// The closest instance of this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ListTileTheme theme = ListTileTheme.of(context);
  /// ```
  static ListTileMoreCustomizableTheme of(BuildContext context) {
    final ListTileMoreCustomizableTheme result = context
        .dependOnInheritedWidgetOfExactType<ListTileMoreCustomizableTheme>();
    return result ?? const ListTileMoreCustomizableTheme();
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final ListTileMoreCustomizableTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<ListTileMoreCustomizableTheme>();
    return identical(this, ancestorTheme)
        ? child
        : ListTileMoreCustomizableTheme(
            dense: dense,
            style: style,
            selectedColor: selectedColor,
            iconColor: iconColor,
            textColor: textColor,
            contentPadding: contentPadding,
            child: child,
          );
  }

  @override
  bool updateShouldNotify(ListTileMoreCustomizableTheme oldWidget) {
    return dense != oldWidget.dense ||
        style != oldWidget.style ||
        selectedColor != oldWidget.selectedColor ||
        iconColor != oldWidget.iconColor ||
        textColor != oldWidget.textColor ||
        contentPadding != oldWidget.contentPadding;
  }
}

/// Where to place the control in widgets that use [ListTileMoreCustomizable] to position a
/// control next to a label.
///
/// See also:
///
///  * [CheckboxListTile], which combines a [ListTileMoreCustomizable] with a [Checkbox].
///  * [RadioListTile], which combines a [ListTileMoreCustomizable] with a [Radio] button.
enum ListTileMoreCustomizableControlAffinity {
  /// Position the control on the leading edge, and the secondary widget, if
  /// any, on the trailing edge.
  leading,

  /// Position the control on the trailing edge, and the secondary widget, if
  /// any, on the leading edge.
  trailing,

  /// Position the control relative to the text in the fashion that is typical
  /// for the current platform, and place the secondary widget on the opposite
  /// side.
  platform,
}

/// See also:
///
///  * [ListTileMoreCustomizableTheme], which defines visual properties for [ListTileMoreCustomizable]s.
///  * [ListView], which can display an arbitrary number of [ListTileMoreCustomizable]s
///    in a scrolling list.
///  * [CircleAvatar], which shows an icon representing a person and is often
///    used as the [leading] element of a ListTile.
///  * [Card], which can be used with [Column] to show a few [ListTileMoreCustomizable]s.
///  * [Divider], which can be used to separate [ListTileMoreCustomizable]s.
///  * [ListTileMoreCustomizable.divideTiles], a utility for inserting [Divider]s in between [ListTileMoreCustomizable]s.
///  * [CheckboxListTile], [RadioListTile], and [SwitchListTile], widgets
///    that combine [ListTile] with other controls.
///  * <https://material.io/design/components/lists.html>
class ListTileMoreCustomizable extends StatefulWidget {
  /// Creates a list tile.
  ///
  /// If [isThreeLine] is true, then [subtitle] must not be null.
  ///
  /// Requires one of its ancestors to be a [Material] widget.
  const ListTileMoreCustomizable({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.isThreeLine = false,
    this.dense,
    this.contentPadding,
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.selected = false,
    this.horizontalTitleGap =
        ListTileMoreCustomizableDefaultValue.horizontalTitleGap,
    this.minVerticalPadding =
        ListTileMoreCustomizableDefaultValue.minVerticalPadding,
    this.minLeadingWidth = ListTileMoreCustomizableDefaultValue.minLeadingWidth,
  })  : assert(isThreeLine != null),
        assert(enabled != null),
        assert(selected != null),
        assert(!isThreeLine || subtitle != null),
        assert(horizontalTitleGap != null),
        assert(minVerticalPadding != null),
        assert(minLeadingWidth != null),
        super(key: key);

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget leading;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  ///
  /// If [isThreeLine] is false, this should not wrap.
  ///
  /// If [isThreeLine] is true, this should be configured to take a maximum of
  /// two lines.
  final Widget subtitle;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  ///
  /// To show right-aligned metadata (assuming left-to-right reading order;
  /// left-aligned for right-to-left reading order), consider using a [Row] with
  /// [MainAxisAlign.baseline] alignment whose first item is [Expanded] and
  /// whose second child is the metadata text, instead of using the [trailing]
  /// property.
  final Widget trailing;

  /// Whether this list tile is intended to display three lines of text.
  ///
  /// If true, then [subtitle] must be non-null (since it is expected to give
  /// the second and third lines of text).
  ///
  /// If false, the list tile is treated as having one line if the subtitle is
  /// null and treated as having two lines if the subtitle is non-null.
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileMoreCustomizableTheme.dense].
  ///
  /// Dense list tiles default to a smaller height.
  final bool dense;

  /// The tile's internal padding.
  ///
  /// Insets a [ListTileMoreCustomizable]'s contents: its [leading], [title], [subtitle],
  /// and [trailing] widgets.
  ///
  /// If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry contentPadding;

  /// Whether this list tile is interactive.
  ///
  /// If false, this list tile is styled with the disabled color from the
  /// current [Theme] and the [onTap] and [onLongPress] callbacks are
  /// inoperative.
  final bool enabled;

  /// Called when the user taps this list tile.
  /// The details information is recorded when InkWell's onTapDown occurred.
  /// Inoperative if [enabled] is false.
  final GestureTapDownCallback onTap;

  /// Called when the user long-presses on this list tile.
  /// The details information is recorded when InkWell's onTapDown occurred.
  /// Inoperative if [enabled] is false.
  final GestureTapDownCallback onLongPress;

  /// If this tile is also [enabled] then icons and text are rendered with the same color.
  ///
  /// By default the selected color is the theme's primary color. The selected color
  /// can be overridden with a [ListTileMoreCustomizableTheme].
  final bool selected;

  /// The horizontal gap between the titles and the leading/trailing widgets.
  final double horizontalTitleGap;

  /// The minimum padding on the top and bottom of the title and subtitle widgets.
  final double minVerticalPadding;

  /// The minimum leading width.
  final double minLeadingWidth;

  /// Add a one pixel border in between each tile. If color isn't specified the
  /// [ThemeData.dividerColor] of the context's [Theme] is used.
  ///
  /// See also:
  ///
  ///  * [Divider], which you can use to obtain this effect manually.
  static Iterable<Widget> divideTiles(
      {BuildContext context,
      @required Iterable<Widget> tiles,
      Color color}) sync* {
    assert(tiles != null);
    assert(color != null || context != null);

    final Iterator<Widget> iterator = tiles.iterator;
    final bool isNotEmpty = iterator.moveNext();

    final Decoration decoration = BoxDecoration(
      border: Border(
        bottom: Divider.createBorderSide(context, color: color),
      ),
    );

    Widget tile = iterator.current;
    while (iterator.moveNext()) {
      yield DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: decoration,
        child: tile,
      );
      tile = iterator.current;
    }
    if (isNotEmpty) yield tile;
  }

  @override
  _ListTileMoreCustomizableState createState() =>
      _ListTileMoreCustomizableState();
}

class _ListTileMoreCustomizableState extends State<ListTileMoreCustomizable> {
  TapDownDetails tapDownDetails;

  Color _iconColor(ThemeData theme, ListTileMoreCustomizableTheme tileTheme) {
    if (!widget.enabled) return theme.disabledColor;

    if (widget.selected && tileTheme?.selectedColor != null)
      return tileTheme.selectedColor;

    if (!widget.selected && tileTheme?.iconColor != null)
      return tileTheme.iconColor;

    switch (theme.brightness) {
      case Brightness.light:
        return widget.selected ? theme.primaryColor : Colors.black45;
      case Brightness.dark:
        return widget.selected
            ? theme.accentColor
            : null; // null - use current icon theme color
    }
    assert(theme.brightness != null);
    return null;
  }

  Color _textColor(ThemeData theme, ListTileMoreCustomizableTheme tileTheme,
      Color defaultColor) {
    if (!widget.enabled) return theme.disabledColor;

    if (widget.selected && tileTheme?.selectedColor != null)
      return tileTheme.selectedColor;

    if (!widget.selected && tileTheme?.textColor != null)
      return tileTheme.textColor;

    if (widget.selected) {
      switch (theme.brightness) {
        case Brightness.light:
          return theme.primaryColor;
        case Brightness.dark:
          return theme.accentColor;
      }
    }
    return defaultColor;
  }

  bool _isDenseLayout(ListTileMoreCustomizableTheme tileTheme) {
    return widget.dense ?? tileTheme?.dense ?? false;
  }

  TextStyle _titleTextStyle(
      ThemeData theme, ListTileMoreCustomizableTheme tileTheme) {
    TextStyle style;
    if (tileTheme != null) {
      switch (tileTheme.style) {
        case ListTileMoreCustomizableStyle.drawer:
          // [body2] need be change to [bodyText1] when flutter 1.13.8+ becomes stable.
          style = theme.textTheme.body2;
          break;
        case ListTileMoreCustomizableStyle.list:
          // [subhead] need be change to [subtitle1] when flutter 1.13.8+ becomes stable.
          style = theme.textTheme.subhead;
          break;
      }
    } else {
      // [subhead] need be change to [subtitle1] when flutter 1.13.8+ becomes stable.
      style = theme.textTheme.subhead;
    }
    final Color color = _textColor(theme, tileTheme, style.color);
    return _isDenseLayout(tileTheme)
        ? style.copyWith(fontSize: 13.0, color: color)
        : style.copyWith(color: color);
  }

  TextStyle _subtitleTextStyle(
      ThemeData theme, ListTileMoreCustomizableTheme tileTheme) {
    // [body1] need be change to [bodyText2] when flutter 1.13.8+ becomes stable.
    final TextStyle style = theme.textTheme.body1;
    final Color color =
        _textColor(theme, tileTheme, theme.textTheme.caption.color);
    return _isDenseLayout(tileTheme)
        ? style.copyWith(color: color, fontSize: 12.0)
        : style.copyWith(color: color);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final ThemeData theme = Theme.of(context);
    final ListTileMoreCustomizableTheme tileTheme =
        ListTileMoreCustomizableTheme.of(context);

    IconThemeData iconThemeData;
    if (widget.leading != null || widget.trailing != null)
      iconThemeData = IconThemeData(color: _iconColor(theme, tileTheme));

    Widget leadingIcon;
    if (widget.leading != null) {
      leadingIcon = IconTheme.merge(
        data: iconThemeData,
        child: widget.leading,
      );
    }

    final TextStyle titleStyle = _titleTextStyle(theme, tileTheme);
    final Widget titleText = AnimatedDefaultTextStyle(
      style: titleStyle,
      duration: kThemeChangeDuration,
      child: widget.title ?? const SizedBox(),
    );

    Widget subtitleText;
    TextStyle subtitleStyle;
    if (widget.subtitle != null) {
      subtitleStyle = _subtitleTextStyle(theme, tileTheme);
      subtitleText = AnimatedDefaultTextStyle(
        style: subtitleStyle,
        duration: kThemeChangeDuration,
        child: widget.subtitle,
      );
    }

    Widget trailingIcon;
    if (widget.trailing != null) {
      trailingIcon = IconTheme.merge(
        data: iconThemeData,
        child: widget.trailing,
      );
    }

    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsets resolvedContentPadding =
        widget.contentPadding?.resolve(textDirection) ??
            tileTheme?.contentPadding?.resolve(textDirection) ??
            ListTileMoreCustomizableDefaultValue.contentPadding;

    return InkWell(
      onTap: widget.enabled && widget.onTap != null ? toOnTap : null,
      onLongPress:
          widget.enabled && widget.onLongPress != null ? toOnLongPress : null,
      onTapDown: widget.enabled ? recordTapDownDetails : null,
      canRequestFocus: widget.enabled,
      child: Semantics(
        selected: widget.selected,
        enabled: widget.enabled,
        child: SafeArea(
          top: false,
          bottom: false,
          minimum: resolvedContentPadding,
          child: _ListTileMoreCustomizable(
            leading: leadingIcon,
            title: titleText,
            subtitle: subtitleText,
            trailing: trailingIcon,
            isDense: _isDenseLayout(tileTheme),
            isThreeLine: widget.isThreeLine,
            textDirection: textDirection,
            titleBaselineType: titleStyle.textBaseline,
            subtitleBaselineType: subtitleStyle?.textBaseline,
            horizontalTitleGap: widget.horizontalTitleGap,
            minVerticalPadding: widget.minVerticalPadding,
            minLeadingWidth: widget.minLeadingWidth,
          ),
        ),
      ),
    );
  }

  toOnTap() {
    widget.onTap(tapDownDetails);
  }

  toOnLongPress() {
    widget.onLongPress(tapDownDetails);
  }

  recordTapDownDetails(TapDownDetails d) {
    tapDownDetails = d;
  }
}

// Identifies the children of a _ListTileElement.
enum _ListTileMoreCustomizableSlot {
  leading,
  title,
  subtitle,
  trailing,
}

class _ListTileMoreCustomizable extends RenderObjectWidget {
  const _ListTileMoreCustomizable({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    @required this.isThreeLine,
    @required this.isDense,
    @required this.textDirection,
    @required this.titleBaselineType,
    @required this.horizontalTitleGap,
    @required this.minVerticalPadding,
    @required this.minLeadingWidth,
    this.subtitleBaselineType,
  })  : assert(isThreeLine != null),
        assert(isDense != null),
        assert(textDirection != null),
        assert(titleBaselineType != null),
        assert(horizontalTitleGap != null),
        assert(minVerticalPadding != null),
        assert(minLeadingWidth != null),
        super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final bool isThreeLine;
  final bool isDense;
  final TextDirection textDirection;
  final TextBaseline titleBaselineType;
  final TextBaseline subtitleBaselineType;
  final double horizontalTitleGap;
  final double minVerticalPadding;
  final double minLeadingWidth;

  @override
  _ListTileMoreCustomizableElement createElement() =>
      _ListTileMoreCustomizableElement(this);

  @override
  _RenderListTileMoreCustomizable createRenderObject(BuildContext context) {
    return _RenderListTileMoreCustomizable(
      isThreeLine: isThreeLine,
      isDense: isDense,
      textDirection: textDirection,
      titleBaselineType: titleBaselineType,
      subtitleBaselineType: subtitleBaselineType,
      horizontalTitleGap: horizontalTitleGap,
      minVerticalPadding: minVerticalPadding,
      minLeadingWidth: minLeadingWidth,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderListTileMoreCustomizable renderObject) {
    renderObject
      ..isThreeLine = isThreeLine
      ..isDense = isDense
      ..textDirection = textDirection
      ..titleBaselineType = titleBaselineType
      ..subtitleBaselineType = subtitleBaselineType
      ..horizontalTitleGap = horizontalTitleGap;
  }
}

class _ListTileMoreCustomizableElement extends RenderObjectElement {
  _ListTileMoreCustomizableElement(_ListTileMoreCustomizable widget)
      : super(widget);

  final Map<_ListTileMoreCustomizableSlot, Element> slotToChild =
      <_ListTileMoreCustomizableSlot, Element>{};
  final Map<Element, _ListTileMoreCustomizableSlot> childToSlot =
      <Element, _ListTileMoreCustomizableSlot>{};

  @override
  _ListTileMoreCustomizable get widget =>
      super.widget as _ListTileMoreCustomizable;

  @override
  _RenderListTileMoreCustomizable get renderObject =>
      super.renderObject as _RenderListTileMoreCustomizable;

  @override
  void visitChildren(ElementVisitor visitor) {
    slotToChild.values.forEach(visitor);
  }

  @override
  void forgetChild(Element child) {
    assert(slotToChild.values.contains(child));
    assert(childToSlot.keys.contains(child));
    final _ListTileMoreCustomizableSlot slot = childToSlot[child];
    childToSlot.remove(child);
    slotToChild.remove(slot);
  }

  void _mountChild(Widget widget, _ListTileMoreCustomizableSlot slot) {
    final Element oldChild = slotToChild[slot];
    final Element newChild = updateChild(oldChild, widget, slot);
    if (oldChild != null) {
      slotToChild.remove(slot);
      childToSlot.remove(oldChild);
    }
    if (newChild != null) {
      slotToChild[slot] = newChild;
      childToSlot[newChild] = slot;
    }
  }

  @override
  void mount(Element parent, dynamic newSlot) {
    super.mount(parent, newSlot);
    _mountChild(widget.leading, _ListTileMoreCustomizableSlot.leading);
    _mountChild(widget.title, _ListTileMoreCustomizableSlot.title);
    _mountChild(widget.subtitle, _ListTileMoreCustomizableSlot.subtitle);
    _mountChild(widget.trailing, _ListTileMoreCustomizableSlot.trailing);
  }

  void _updateChild(Widget widget, _ListTileMoreCustomizableSlot slot) {
    final Element oldChild = slotToChild[slot];
    final Element newChild = updateChild(oldChild, widget, slot);
    if (oldChild != null) {
      childToSlot.remove(oldChild);
      slotToChild.remove(slot);
    }
    if (newChild != null) {
      slotToChild[slot] = newChild;
      childToSlot[newChild] = slot;
    }
  }

  @override
  void update(_ListTileMoreCustomizable newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _updateChild(widget.leading, _ListTileMoreCustomizableSlot.leading);
    _updateChild(widget.title, _ListTileMoreCustomizableSlot.title);
    _updateChild(widget.subtitle, _ListTileMoreCustomizableSlot.subtitle);
    _updateChild(widget.trailing, _ListTileMoreCustomizableSlot.trailing);
  }

  void _updateRenderObject(
      RenderBox child, _ListTileMoreCustomizableSlot slot) {
    switch (slot) {
      case _ListTileMoreCustomizableSlot.leading:
        renderObject.leading = child;
        break;
      case _ListTileMoreCustomizableSlot.title:
        renderObject.title = child;
        break;
      case _ListTileMoreCustomizableSlot.subtitle:
        renderObject.subtitle = child;
        break;
      case _ListTileMoreCustomizableSlot.trailing:
        renderObject.trailing = child;
        break;
    }
  }

  @override
  void insertChildRenderObject(RenderObject child, dynamic slotValue) {
    assert(child is RenderBox);
    assert(slotValue is _ListTileMoreCustomizableSlot);
    final _ListTileMoreCustomizableSlot slot =
        slotValue as _ListTileMoreCustomizableSlot;
    _updateRenderObject(child as RenderBox, slot);
    assert(renderObject.childToSlot.keys.contains(child));
    assert(renderObject.slotToChild.keys.contains(slot));
  }

  @override
  void removeChildRenderObject(RenderObject child) {
    assert(child is RenderBox);
    assert(renderObject.childToSlot.keys.contains(child));
    _updateRenderObject(null, renderObject.childToSlot[child]);
    assert(!renderObject.childToSlot.keys.contains(child));
    assert(!renderObject.slotToChild.keys.contains(slot));
  }

  @override
  void moveChildRenderObject(RenderObject child, dynamic slotValue) {
    assert(false, 'not reachable');
  }
}

class _RenderListTileMoreCustomizable extends RenderBox {
  _RenderListTileMoreCustomizable({
    @required bool isDense,
    @required bool isThreeLine,
    @required TextDirection textDirection,
    @required TextBaseline titleBaselineType,
    @required double horizontalTitleGap,
    @required double minVerticalPadding,
    @required double minLeadingWidth,
    TextBaseline subtitleBaselineType,
  })  : assert(isDense != null),
        assert(isThreeLine != null),
        assert(textDirection != null),
        assert(titleBaselineType != null),
        assert(horizontalTitleGap != null),
        assert(minVerticalPadding != null),
        assert(minLeadingWidth != null),
        _isDense = isDense,
        _isThreeLine = isThreeLine,
        _textDirection = textDirection,
        _titleBaselineType = titleBaselineType,
        _horizontalTitleGap = horizontalTitleGap,
        _minVerticalPadding = minVerticalPadding,
        _minLeadingWidth = minLeadingWidth,
        _subtitleBaselineType = subtitleBaselineType;

  final Map<_ListTileMoreCustomizableSlot, RenderBox> slotToChild =
      <_ListTileMoreCustomizableSlot, RenderBox>{};
  final Map<RenderBox, _ListTileMoreCustomizableSlot> childToSlot =
      <RenderBox, _ListTileMoreCustomizableSlot>{};

  RenderBox _updateChild(RenderBox oldChild, RenderBox newChild,
      _ListTileMoreCustomizableSlot slot) {
    if (oldChild != null) {
      dropChild(oldChild);
      childToSlot.remove(oldChild);
      slotToChild.remove(slot);
    }
    if (newChild != null) {
      childToSlot[newChild] = slot;
      slotToChild[slot] = newChild;
      adoptChild(newChild);
    }
    return newChild;
  }

  RenderBox _leading;

  RenderBox get leading => _leading;

  set leading(RenderBox value) {
    _leading =
        _updateChild(_leading, value, _ListTileMoreCustomizableSlot.leading);
  }

  RenderBox _title;

  RenderBox get title => _title;

  set title(RenderBox value) {
    _title = _updateChild(_title, value, _ListTileMoreCustomizableSlot.title);
  }

  RenderBox _subtitle;

  RenderBox get subtitle => _subtitle;

  set subtitle(RenderBox value) {
    _subtitle =
        _updateChild(_subtitle, value, _ListTileMoreCustomizableSlot.subtitle);
  }

  RenderBox _trailing;

  RenderBox get trailing => _trailing;

  set trailing(RenderBox value) {
    _trailing =
        _updateChild(_trailing, value, _ListTileMoreCustomizableSlot.trailing);
  }

  // The returned list is ordered for hit testing.
  Iterable<RenderBox> get _children sync* {
    if (leading != null) yield leading;
    if (title != null) yield title;
    if (subtitle != null) yield subtitle;
    if (trailing != null) yield trailing;
  }

  bool get isDense => _isDense;
  bool _isDense;

  set isDense(bool value) {
    assert(value != null);
    if (_isDense == value) return;
    _isDense = value;
    markNeedsLayout();
  }

  bool get isThreeLine => _isThreeLine;
  bool _isThreeLine;

  set isThreeLine(bool value) {
    assert(value != null);
    if (_isThreeLine == value) return;
    _isThreeLine = value;
    markNeedsLayout();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;

  set textDirection(TextDirection value) {
    assert(value != null);
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  TextBaseline get titleBaselineType => _titleBaselineType;
  TextBaseline _titleBaselineType;

  set titleBaselineType(TextBaseline value) {
    assert(value != null);
    if (_titleBaselineType == value) return;
    _titleBaselineType = value;
    markNeedsLayout();
  }

  TextBaseline get subtitleBaselineType => _subtitleBaselineType;
  TextBaseline _subtitleBaselineType;

  set subtitleBaselineType(TextBaseline value) {
    if (_subtitleBaselineType == value) return;
    _subtitleBaselineType = value;
    markNeedsLayout();
  }

  double get horizontalTitleGap => _horizontalTitleGap;
  double _horizontalTitleGap;

  set horizontalTitleGap(double value) {
    assert(value != null);
    if (_horizontalTitleGap == value) return;
    _horizontalTitleGap = value;
    markNeedsLayout();
  }

  double get minVerticalPadding => _minVerticalPadding;
  double _minVerticalPadding;

  set minVerticalPadding(double value) {
    assert(value != null);
    if (_minVerticalPadding == value) return;
    _minVerticalPadding = value;
    markNeedsLayout();
  }

  double get minLeadingWidth => _minLeadingWidth;
  double _minLeadingWidth;

  set minLeadingWidth(double value) {
    assert(value != null);
    if (_minLeadingWidth == value) return;
    _minLeadingWidth = value;
    markNeedsLayout();
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);
    for (final RenderBox child in _children) child.attach(owner);
  }

  @override
  void detach() {
    super.detach();
    for (final RenderBox child in _children) child.detach();
  }

  @override
  void redepthChildren() {
    _children.forEach(redepthChild);
  }

  @override
  void visitChildren(RenderObjectVisitor visitor) {
    _children.forEach(visitor);
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    final List<DiagnosticsNode> value = <DiagnosticsNode>[];
    void add(RenderBox child, String name) {
      if (child != null) value.add(child.toDiagnosticsNode(name: name));
    }

    add(leading, 'leading');
    add(title, 'title');
    add(subtitle, 'subtitle');
    add(trailing, 'trailing');
    return value;
  }

  @override
  bool get sizedByParent => false;

  static double _minWidth(RenderBox box, double height) {
    return box == null ? 0.0 : box.getMinIntrinsicWidth(height);
  }

  static double _maxWidth(RenderBox box, double height) {
    return box == null ? 0.0 : box.getMaxIntrinsicWidth(height);
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    final double leadingWidth = leading != null
        ? math.max(leading.getMinIntrinsicWidth(height), _minLeadingWidth) +
            _horizontalTitleGap
        : 0.0;
    return leadingWidth +
        math.max(_minWidth(title, height), _minWidth(subtitle, height)) +
        _maxWidth(trailing, height);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    final double leadingWidth = leading != null
        ? math.max(leading.getMaxIntrinsicWidth(height), _minLeadingWidth) +
            _horizontalTitleGap
        : 0.0;
    return leadingWidth +
        math.max(_maxWidth(title, height), _maxWidth(subtitle, height)) +
        _maxWidth(trailing, height);
  }

  double get _defaultTileHeight {
    final bool hasSubtitle = subtitle != null;
    final bool isTwoLine = !isThreeLine && hasSubtitle;
    final bool isOneLine = !isThreeLine && !hasSubtitle;

    if (isOneLine) return isDense ? 48.0 : 56.0;
    if (isTwoLine) return isDense ? 64.0 : 72.0;
    return isDense ? 76.0 : 88.0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return math.max(
      _defaultTileHeight,
      title.getMinIntrinsicHeight(width) +
          (subtitle?.getMinIntrinsicHeight(width) ?? 0.0),
    );
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return computeMinIntrinsicHeight(width);
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    assert(title != null);
    final BoxParentData parentData = title.parentData as BoxParentData;
    return parentData.offset.dy + title.getDistanceToActualBaseline(baseline);
  }

  static double _boxBaseline(RenderBox box, TextBaseline baseline) {
    return box.getDistanceToBaseline(baseline);
  }

  static Size _layoutBox(RenderBox box, BoxConstraints constraints) {
    if (box == null) return Size.zero;
    box.layout(constraints, parentUsesSize: true);
    return box.size;
  }

  static void _positionBox(RenderBox box, Offset offset) {
    final BoxParentData parentData = box.parentData as BoxParentData;
    parentData.offset = offset;
  }

  // All of the dimensions below were taken from the Material Design spec:
  // https://material.io/design/components/lists.html#specs
  @override
  void performLayout() {
    final bool hasLeading = leading != null;
    final bool hasSubtitle = subtitle != null;
    final bool hasTrailing = trailing != null;
    final bool isTwoLine = !isThreeLine && hasSubtitle;
    final bool isOneLine = !isThreeLine && !hasSubtitle;

    final BoxConstraints maxIconHeightConstraint = BoxConstraints(
      // One-line trailing and leading widget heights do not follow
      // Material specifications, but this sizing is required to adhere
      // to accessibility requirements for smallest tappable widget.
      // Two- and three-line trailing widget heights are constrained
      // properly according to the Material spec.
      maxHeight: isDense ? 48.0 : 56.0,
    );
    final BoxConstraints looseConstraints = constraints.loosen();
    final BoxConstraints iconConstraints =
        looseConstraints.enforce(maxIconHeightConstraint);

    final double tileWidth = looseConstraints.maxWidth;
    final Size leadingSize = _layoutBox(leading, iconConstraints);
    final Size trailingSize = _layoutBox(trailing, iconConstraints);
    assert(tileWidth != leadingSize.width,
        'Leading widget consumes entire tile width. Please use a sized widget.');
    assert(tileWidth != trailingSize.width,
        'Trailing widget consumes entire tile width. Please use a sized widget.');

    final double titleStart = hasLeading
        ? math.max(_minLeadingWidth, leadingSize.width) + _horizontalTitleGap
        : 0.0;
    final BoxConstraints textConstraints = looseConstraints.tighten(
      width: tileWidth -
          titleStart -
          (hasTrailing ? trailingSize.width + _horizontalTitleGap : 0.0),
    );
    final Size titleSize = _layoutBox(title, textConstraints);
    final Size subtitleSize = _layoutBox(subtitle, textConstraints);

    double titleBaseline;
    double subtitleBaseline;
    if (isTwoLine) {
      titleBaseline = isDense ? 28.0 : 32.0;
      subtitleBaseline = isDense ? 48.0 : 52.0;
    } else if (isThreeLine) {
      titleBaseline = isDense ? 22.0 : 28.0;
      subtitleBaseline = isDense ? 42.0 : 48.0;
    } else {
      assert(isOneLine);
    }

    final double defaultTileHeight = _defaultTileHeight;

    double tileHeight;
    double titleY;
    double subtitleY;
    if (!hasSubtitle) {
      tileHeight = math.max(
          defaultTileHeight, titleSize.height + 2.0 * _minVerticalPadding);
      titleY = (tileHeight - titleSize.height) / 2.0;
    } else {
      assert(subtitleBaselineType != null);
      titleY = titleBaseline - _boxBaseline(title, titleBaselineType);
      subtitleY =
          subtitleBaseline - _boxBaseline(subtitle, subtitleBaselineType);
      tileHeight = defaultTileHeight;

      // If the title and subtitle overlap, move the title upwards by half
      // the overlap and the subtitle down by the same amount, and adjust
      // tileHeight so that both titles fit.
      final double titleOverlap = titleY + titleSize.height - subtitleY;
      if (titleOverlap > 0.0) {
        titleY -= titleOverlap / 2.0;
        subtitleY += titleOverlap / 2.0;
      }

      // If the title or subtitle overflow tileHeight then punt: title
      // and subtitle are arranged in a column, tileHeight = column height plus
      // _minVerticalPadding on top and bottom.
      if (titleY < _minVerticalPadding ||
          (subtitleY + subtitleSize.height + _minVerticalPadding) >
              tileHeight) {
        tileHeight =
            titleSize.height + subtitleSize.height + 2.0 * _minVerticalPadding;
        titleY = _minVerticalPadding;
        subtitleY = titleSize.height + _minVerticalPadding;
      }
    }

    // This attempts to implement the redlines for the vertical position of the
    // leading and trailing icons on the spec page:
    //   https://material.io/design/components/lists.html#specs
    // The interpretation for these red lines is as follows:
    //  - For large tiles (> 72dp), both leading and trailing controls should be
    //    a fixed distance from top. As per guidelines this is set to 16dp.
    //  - For smaller tiles, trailing should always be centered. Leading can be
    //    centered or closer to the top. It should never be further than 16dp
    //    to the top.
    double leadingY;
    double trailingY;
    if (tileHeight > 72.0) {
      leadingY = 16.0;
      trailingY = 16.0;
    } else {
      leadingY = math.min((tileHeight - leadingSize.height) / 2.0, 16.0);
      trailingY = (tileHeight - trailingSize.height) / 2.0;
    }

    switch (textDirection) {
      case TextDirection.rtl:
        {
          if (hasLeading)
            _positionBox(
                leading, Offset(tileWidth - leadingSize.width, leadingY));
          final double titleX =
              hasTrailing ? trailingSize.width + _horizontalTitleGap : 0.0;
          _positionBox(title, Offset(titleX, titleY));
          if (hasSubtitle) _positionBox(subtitle, Offset(titleX, subtitleY));
          if (hasTrailing) _positionBox(trailing, Offset(0.0, trailingY));
          break;
        }
      case TextDirection.ltr:
        {
          if (hasLeading) _positionBox(leading, Offset(0.0, leadingY));
          _positionBox(title, Offset(titleStart, titleY));
          if (hasSubtitle)
            _positionBox(subtitle, Offset(titleStart, subtitleY));
          if (hasTrailing)
            _positionBox(
                trailing, Offset(tileWidth - trailingSize.width, trailingY));
          break;
        }
    }

    size = constraints.constrain(Size(tileWidth, tileHeight));
    assert(size.width == constraints.constrainWidth(tileWidth));
    assert(size.height == constraints.constrainHeight(tileHeight));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    void doPaint(RenderBox child) {
      if (child != null) {
        final BoxParentData parentData = child.parentData as BoxParentData;
        context.paintChild(child, parentData.offset + offset);
      }
    }

    doPaint(leading);
    doPaint(title);
    doPaint(subtitle);
    doPaint(trailing);
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  bool hitTestChildren(BoxHitTestResult result, {@required Offset position}) {
    assert(position != null);
    for (final RenderBox child in _children) {
      final BoxParentData parentData = child.parentData as BoxParentData;
      final bool isHit = result.addWithPaintOffset(
        offset: parentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          assert(transformed == position - parentData.offset);
          return child.hitTest(result, position: transformed);
        },
      );
      if (isHit) return true;
    }
    return false;
  }
}
