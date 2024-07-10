import 'package:cargo/views/variables/colors.dart';
import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final bool imageColor;

  const ImageLoader(
      {Key? key, required this.imageUrl, required this.imageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getImageUrl(imageUrl),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: blackColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Image.network(
            snapshot.data!,
            color: imageColor ? null : blackColor,
            loadingBuilder: (context, child, progress) {
              if (progress != null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: blackColor,
                  ),
                );
              } else {
                return child;
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Text('Error loading image: $error');
            },
          );
        }
      },
    );
  }

  Future<String> getImageUrl(String imageUrl) async {
    return imageUrl;
  }
}
