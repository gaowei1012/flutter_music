import 'package:dio/dio.dart';
import 'dart:io';
import 'package:flutter_music/config/config.dart';

/**
 * 请求方法
 * url: *必选 请求路径
 * formData: -可选参数 请求参数
 */
Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('');
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
      // queryParmas参数
      response = await dio.get(servicePath[url], queryParameters: formData);
    }

    if(response.statusCode == 200) {
      return response.data;
    } else {
      Exception('数据请求失败,请检查接口是否有误====>ERROR');
    }
  } catch(e) {
    return print('ERROR: ============>${e}');
  }
}