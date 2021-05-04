import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ExampleWidget()));
}

class ExampleWidget extends StatefulWidget {
  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  bool leftEye = false;
  bool rightEye = false;

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 200.0,
      height: 200.0,
      decoration: new BoxDecoration(
        color: Colors.lime,
        shape: BoxShape.circle,
      ),
    );

    return new Material(
      color: Colors.black,
      child: new Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            Positioned(
              child: CircleButton(
                onTap: () {
                  setState(() {
                    leftEye = leftEye ? false : true;
                  });
                },
                iconData: leftEye ? Icons.favorite : Icons.favorite_border,
              ),
              top: 45,
              left: 35,
            ),
            Positioned(
              child: CircleButton(
                onTap: () {
                  setState(() {
                    rightEye = rightEye ? false : true;
                  });
                },
                iconData: rightEye ? Icons.favorite : Icons.favorite_border,
              ),
              top: 45,
              right: 35,
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          color: Colors.pink,
        ),
      ),
    );
  }
}
