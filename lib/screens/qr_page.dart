import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gem/screens/info.dart';
import 'package:gem/screens/map.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  Map<String, dynamic>? dataMap;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BottomBar(
          barColor: Colors.transparent,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF2B2B28),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF2B2B28)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {
                          Get.to(const MapPage());
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/map.svg',
                              width: 20,
                            ),
                            const Text('Map',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFFE3B04B)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () async {
                          if (result != null) {
                            Get.to(() => InfoPage(
                                  data: dataMap!,
                                ));
                            Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              setState(() {
                                result = null;
                              });
                            });
                          } else {
                            setState(() {
                              result = null;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              result == null
                                  ? SvgPicture.asset(
                                      'assets/images/qrCodeHome.svg',
                                      width: 30,
                                    )
                                  : const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Color(0xFF2B2B28),
                                      size: 20,
                                    ),
                              Text(result == null ? 'Scan' : "Explore",
                                  style: const TextStyle(
                                      fontSize: 8,
                                      color: Color(0xFF2B2B28),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF2B2B28)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () async {},
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/history.svg',
                              width: 20,
                            ),
                            const Text('History',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: (context, controller) => Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: <Widget>[
                  Expanded(flex: 4, child: _buildQrView(context)),
                ],
              ),
              if (result != null) ...{
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        dataMap!["name"],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      Text(
                        dataMap!["details"],
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              }
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 75.0, horizontal: 45),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF2B2B28),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF2B2B28)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF2B2B28)),
                          shadowColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          overlayColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          surfaceTintColor:
                              MaterialStatePropertyAll(Colors.transparent),
                        ),
                        onPressed: () async {},
                        child: Column(
                          children: [
                            SizedBox(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  "assets/images/Ticket.png",
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 275.0
        : 350.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: const Color(0xFFE3B04B),
        borderRadius: result == null ? 20 : 0,
        borderLength: result == null ? 30 : 0,
        borderWidth: result == null ? 30 : 0,
        cutOutSize: result == null ? scanArea : 0,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        dataMap = json.decode(result!.code!);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
