import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apex_api/core/auth/AppKeys.dart';
import 'package:apex_api/model/apex_map_rotation_model.dart';
import 'package:apex_api/model/replicator_model.dart';
import 'package:dio/dio.dart';

abstract class IApexService {
  Future<MapRotation?> fetchMapRotation();
  Future<List<ReplicatorModel>?> fetchReplicator();
}

class ApexService implements IApexService {
  late final Dio _dio;
  ApexService() : _dio = Dio(BaseOptions(baseUrl: 'https://api.mozambiquehe.re/')) {}

  @override
  Future<MapRotation?> fetchMapRotation() async {
    final completer = Completer<MapRotation?>();
    try {
      final response = await _dio.get(_ApexServicePath.maprotation.name, queryParameters: {
        _ApexQueryPath.auth.name: AppKeys.apexApiAuthKey,
        // _ApexQueryPath.version.name: '1',
      });

      if (response.statusCode == HttpStatus.ok) {
        final dynamic datas = response.data;

        if (datas is Map<String, dynamic> && datas.isNotEmpty) {
          completer.complete(MapRotation.fromJson(datas));
        } else if (datas is String) {
          try {
            final Map<String, dynamic> parsedData = json.decode(datas);
            completer.complete(MapRotation.fromJson(parsedData));
          } catch (e) {
            completer.completeError("Error parsing JSON string: $e");
          }
        } else {
          completer.completeError("Invalid response format: $datas");
        }
      }
    } catch (e) {
      completer.completeError("fetchMapRotation: $e");
      print(e);
    }

    return completer.future;
  }

  @override
  Future<List<ReplicatorModel>?> fetchReplicator() async {
    try {
      final response = await _dio
          .get(_ApexServicePath.crafting.name, queryParameters: {_ApexQueryPath.auth.name: AppKeys.apexApiAuthKey});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => ReplicatorModel.fromJson(e)).toList();
        } else {
          return null;
        }
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

enum _ApexServicePath { maprotation, crafting }

enum _ApexQueryPath { auth, version }
