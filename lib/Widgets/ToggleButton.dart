import 'dart:math';

import 'package:animations_work/MyTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  bool enable;

  ToggleButton({
    this.enable = false,
    Key? key,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _toggleColorAnimation;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Alignment?> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _toggleColorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween:
              ColorTween(begin: MyTheme.backgroundHigher, end: MyTheme.colorB),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _backgroundColorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween: ColorTween(
              begin: MyTheme.backgroundHigher, end: MyTheme.colorB_Lower),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller);

    if (widget.enable) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      if (kDebugMode) {
        _playAnimation();
      }
    }, child: LayoutBuilder(
      builder: (context, constraints) {
        double parentWith = constraints.maxWidth;
        double parentHeight = constraints.maxHeight;
        return Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _toggleColorAnimation,
              builder: (context, child) {
                //background
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: _backgroundColorAnimation.value,
                      borderRadius: BorderRadius.circular(parentWith / 2),
                    ));
              },
            ),
            AnimatedBuilder(
              animation: _toggleColorAnimation,
              builder: (context, child) {
                //circle Button field
                return Container(
                  alignment: _alignmentAnimation.value,
                  child: Container(
                    width: parentHeight,
                    height: parentHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _toggleColorAnimation.value,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }
}
