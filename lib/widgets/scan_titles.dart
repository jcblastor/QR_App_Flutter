import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';
import '../utils/utils.dart';

class ScanTitles extends StatelessWidget {
  final String tipo;

  const ScanTitles({
    Key? key,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .deleteById(scans[i].id);
        },
        child: ListTile(
          leading: Icon(
            tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[i].valor),
          subtitle: Text('${scans[i].id}'),
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
    );
  }
}
