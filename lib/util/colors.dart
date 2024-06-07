import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColor(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  if (response.statusCode == 200) {
    final imageBytes = response.bodyBytes;
    final ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
    final frameInfo = await codec.getNextFrame();
    final image = frameInfo.image;
    final byteData =
        await image.toByteData(); // Await the Future<ByteData?> here
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      MemoryImage(
          byteData!.buffer.asUint8List()), // Pass the Uint8List to MemoryImage
    );
    final dominantColor = paletteGenerator.dominantColor;
    if (dominantColor != null) {
      return dominantColor.color;
    } else {
      throw Exception('Failed to generate dominant color');
    }
  } else {
    throw Exception('Failed to fetch image: ${response.statusCode}');
  }
}
