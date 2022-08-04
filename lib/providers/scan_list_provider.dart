import 'package:flutter/material.dart';

import 'package:qr_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSelecionado = 'http';

  Future<ScanModel> nuevoScan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // agregar el id generado al insertar en la db
    nuevoScan.id = id;

    // verificamos si es tipo http
    if (tipoSelecionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      // notificamos a cualquier widget que use esta info a que hay cambios
      notifyListeners();
    }
    return nuevoScan;
  }

  cargarScans() async {
    final allscans = await DBProvider.db.getAllScans();
    scans = [...allscans];
    notifyListeners();
  }

  cargarScansByType(String tipo) async {
    final allscans = await DBProvider.db.getScansByType(tipo);
    scans = [...allscans];
    tipoSelecionado = tipo;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    scans = [];

    notifyListeners();
  }

  deleteById(int id) async {
    await DBProvider.db.deleteScanById(id);
  }
}
