import 'package:flutter/material.dart';

class InkWellWithoutFeedback extends InkWell {
  const InkWellWithoutFeedback({
    super.key,
    super.child,
    super.onTap,
    super.onDoubleTap,
    super.onLongPress,
    super.onTapDown,
    super.onTapUp,
    super.onTapCancel,
    super.onSecondaryTap,
    super.onSecondaryTapUp,
    super.onSecondaryTapDown,
    super.onSecondaryTapCancel,
    super.onHighlightChanged,
    super.onHover,
    super.mouseCursor,
    super.focusColor,
    super.hoverColor,
    super.overlayColor,
    super.splashFactory,
    super.radius,
    super.borderRadius,
    super.customBorder,
    bool? enableFeedback = true,
    super.excludeFromSemantics,
    super.focusNode,
    super.canRequestFocus,
    super.onFocusChange,
    super.autofocus,
    super.statesController,
  }) : super(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        );
}
