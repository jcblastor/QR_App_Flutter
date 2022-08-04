import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3d8bef',
          'Cancelar',
          false,
          ScanMode.QR,
        );
        // const String barcodeScanRes = 'geo:45.280089,-75.922405';

        if (barcodeScanRes == '-1') return;

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

        // ignore: use_build_context_synchronously
        launchURL(context, nuevoScan);
      },
    );
  }
}
