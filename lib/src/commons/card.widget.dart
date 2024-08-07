import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final double width, height;
  final String? image;
  final String title;
  final String? subtitle;
  final Color borderColor;
  final Color backgroundColor;

  const CardWidget({
    super.key,
    required this.width,
    required this.height,
    this.image,
    required this.title,
    this.subtitle,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.65, // Adjust the height of the image container
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              image: DecorationImage(
                image: NetworkImage(image!),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  // Handling image loading error
                },
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/img.png', // Path to placeholder image
                image: image!,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/img.png', // Path to default image if image fails to load
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
