import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/scan_titles.dart';

class MapasPage extends StatelessWidget {
  const MapasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTitles(tipo: 'geo');
  }
}
