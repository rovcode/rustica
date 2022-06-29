import 'package:flutter/material.dart';
import 'package:rustica/Widgets/Resources/atomos/ColoresApp.dart';

class ProgressHUD extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;

  ProgressHUD({
    required this.child,
    required this.inAsyncCall,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.amber),
          ),
          new Center(
            child: new CircularProgressIndicator()
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}