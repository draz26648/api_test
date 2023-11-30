import 'package:api_test/model/api_service/end_points.dart';
import 'package:api_test/model/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: '$apiBaseUrl$apiVersion',
      queryParameters: {
        'apiKey': apiKey,
      },
    ),
  );

  static Future<NewsModel?> getHeadLines() async {
    try {
      final Response response =
          await dio.get(topHeadlinesEndpoint, queryParameters: {
        'country': country,
        if (category != null) 'category': category,
      });
      return NewsModel.fromJson(response.data);
    } catch (error) {
      debugPrint('error when get headlines ${error.toString()}');
      return null;
    }
  }
}
