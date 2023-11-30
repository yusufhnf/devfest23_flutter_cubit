import 'package:flutter/material.dart';

enum CustomEmptyType { empty, error }

class CustomEmpty extends StatelessWidget {
  const CustomEmpty({
    required this.title,
    required this.desc,
    this.padding,
    this.type = CustomEmptyType.empty,
    this.image,
    this.onRetry,
    super.key,
  });

  final String title;
  final String desc;
  final EdgeInsets? padding;
  final CustomEmptyType type;
  final Widget? image;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    late Widget iconImage;
    if (image == null) {
      switch (type) {
        case CustomEmptyType.empty:
          iconImage =
              const Icon(Icons.playlist_remove, color: Colors.grey, size: 48);
          break;
        default:
          iconImage = const Icon(Icons.error, color: Colors.red, size: 48);
      }
    } else {
      iconImage = image!;
    }
    return Container(
      padding: padding,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        iconImage,
        const SizedBox(height: 10, width: double.infinity),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(desc),
        const SizedBox(height: 20),
        if (type == CustomEmptyType.error)
          TextButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          )
      ]),
    );
  }
}
