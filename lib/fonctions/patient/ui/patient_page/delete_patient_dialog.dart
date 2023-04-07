import 'package:flutter/material.dart';

class DeletePatientDialog extends StatelessWidget {
  const DeletePatientDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmer S\'il vous plait'),
      content: const Text('Voulez vous Suprimer ce patient?'),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
            },
            child: const Text('Oui')),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('Non'),
        )
      ],
    );
  }
}
