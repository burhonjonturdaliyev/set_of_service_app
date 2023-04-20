import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

class DeviceId extends StatefulWidget {
  const DeviceId({super.key});

  @override
  State<DeviceId> createState() => _DeviceIdState();
}

class _DeviceIdState extends State<DeviceId> {
  String deviceName = "", deviceVersion = "", deviceId = "";

  Future<void> getId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          deviceId = build.androidId;
        });
      } else if (Platform.isIOS) {
        var build = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = build.name;
          deviceVersion = build.systemVersion;
          deviceId = build.identifierForVendor;
        });
      }
    } catch (e) {
      print("Error getting device information => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: getId),
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Device Information:"),
            Text("Device Name: ${deviceName}"),
            Text("Device Version: ${deviceVersion}"),
            Text("Device ID: ${deviceId}"),
          ],
        ),
      ),
    );
  }
}
