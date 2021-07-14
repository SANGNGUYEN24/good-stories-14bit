import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget image_display(String imageURL/*TODO: add image file*/){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            _buildBackground(imageURL),
            _buildGradient(),
          ],
        ),
      ),
    ),
  );
}

Widget _buildBackground(String imageURL) {
  return Positioned.fill(
      child: Image.network( /*TODO:image file */
        imageURL,
        fit: BoxFit.cover,
      )
  );
}

Widget _buildGradient() {
  return Positioned.fill(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.6, 0.95],
        ),
      ),
    ),
  );
}