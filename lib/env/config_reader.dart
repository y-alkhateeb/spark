import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize(String fileName) async {
    final configString = await rootBundle.loadString('config/$fileName.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  /// BASE URL
  static String getBaseUrl() => _config['BASE_URL'] as String;
}