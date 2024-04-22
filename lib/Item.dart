import 'package:animations_work/MyTheme.dart';
import 'package:flutter/material.dart';

class Item {
  late Widget customWidget;

  Item();
  Item.customWidget({required this.customWidget});

  ///create UI widget for this item
  ItemWidget createWidget({
    required int index,
  }) =>
      ItemWidget();
}

class ItemWidget extends StatefulWidget {
  String text = "example";
  Widget? widowWidget;
  ItemWidget({super.key});
  ItemWidget.custom({super.key, required this.text, required this.widowWidget});

  @override
  State<StatefulWidget> createState() => _ItmeWidget();
}

class _ItmeWidget extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return button();
    //theOutlinedButton();
  }

  Widget button() {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(
          color: MyTheme.colorB, // Border color
          width: 2, // Border width
        ),
        borderRadius: BorderRadius.circular(20), // Border radius
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (widget.widowWidget != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.widowWidget!,
                ));
          }
        },
        child: Center(
            child: Text(
          widget.text,
          style: TextStyle(color: MyTheme.text),
        )),
      ),
    );
  }
}
