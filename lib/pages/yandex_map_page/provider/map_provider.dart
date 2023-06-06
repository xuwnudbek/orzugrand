import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapProvider extends ChangeNotifier {
  Completer<YandexMapController> completer = Completer();
  late YandexMapController controller;

  Point? _currentPosition;
  Point? get currentPosition => _currentPosition;
  bool isLoading = false;
  late Point initialPoint;

  MapProvider() {
    initCurrentLocation();
  }

  onMapCreated(YandexMapController ctrl) async {
    completer.complete(ctrl);
    controller = await completer.future;
    await controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: initialPoint),
      ),
    );
  }

  zoomIn() async {
    controller = await completer.future;
    await controller.getMaxZoom();
  }

  zoomOut() async {
    controller = await completer.future;
    controller.getMinZoom();
  }

  currentLoc() async {
    isLoading = true;
    notifyListeners();

    await Geolocator.getCurrentPosition().then((value) {
      initialPoint = Point(
        latitude: value.latitude,
        longitude: value.longitude,
      );
    });

    isLoading = false;
    notifyListeners();
  }

  initCurrentLocation() async {
    PermissionStatus status = await Permission.location.status;
    while (status.isDenied) {
      status = await Permission.location.request();
    }
    await currentLoc();
    Geolocator.getPositionStream().listen((event) {
      _currentPosition = Point(
        longitude: event.longitude,
        latitude: event.latitude,
      );
      notifyListeners();
      print(currentPosition);
    });
  }
}
