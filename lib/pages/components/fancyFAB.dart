import 'package:flutter/material.dart';
import 'package:vscode_app/screens/constants.dart';

class FancyFab extends StatefulWidget {
  final Function() pressCamera;
  final Function() pressGallery;

  FancyFab({@required this.pressCamera, @required this.pressGallery});

  @override
  _FancyFabState createState() => _FancyFabState(
        pressCamera: pressCamera,
        pressGallery: pressGallery,
      );
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  _FancyFabState({@required this.pressCamera, @required this.pressGallery});

  final Function() pressCamera;
  final Function() pressGallery;

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: kPrimaryColor,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add() {
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget imageGallery() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        heroTag: "imageGallery",
        onPressed: pressGallery,
        tooltip: 'Image from Gallery',
        child: Icon(Icons.photo_library_outlined),
      ),
    );
  }

  Widget imageCamera() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        heroTag: "imageCamera",
        onPressed: pressCamera,
        tooltip: 'Image from Camera',
        child: Icon(
          Icons.photo_camera_outlined,
        ),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        heroTag: "toggle",
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Transform(
        //   transform: Matrix4.translationValues(
        //     0.0,
        //     _translateButton.value * 3.0,
        //     0.0,
        //   ),
        //   child: add(),
        // ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: imageGallery(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: imageCamera(),
        ),
        toggle(),
      ],
    );
  }
}
