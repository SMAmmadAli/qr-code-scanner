import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultView extends StatelessWidget {
  final String code;
  final Function() closedScreen;
  const ResultView({super.key, required this.code, required this.closedScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafafa),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              closedScreen();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            )),
        centerTitle: true,
        title: const Text(
          "QR Code",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QrImage(
              data: code,
              size: 150,
              version: QrVersions.auto,
            ),
            const Text(
              "Scanned result",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              code,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
