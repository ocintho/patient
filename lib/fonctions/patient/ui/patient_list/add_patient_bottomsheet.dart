import 'package:patient_connect/fonctions/patient/controller/patients_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AddPatientBottomSheet extends HookConsumerWidget {
  AddPatientBottomSheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nomController = useTextEditingController();
    final prenomController = useTextEditingController();
    final dateNaissanceController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final quartierController = useTextEditingController();
    final villeController = useTextEditingController();
    return Form(
      key: formGlobalKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: 05,
            left: 05,
            right: 05,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nomController,
              keyboardType: TextInputType.name,
              validator: (value) {
                const validationError = 'Enter un Nom valid';
                if (value == null || value.isEmpty) {
                  return validationError;
                }
                return null;
              },
              autofocus: true,
              decoration: const InputDecoration(hintText: "Nom Patient"),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: prenomController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Prenom patient "),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid prenom';
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.datetime,
              controller: dateNaissanceController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Date de Naissance"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Entrer une date valide';
                }
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1945),
                    lastDate: DateTime(2030));
                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  dateNaissanceController.text = formattedDate;
                } else {}
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: phoneNumberController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(
                  hintText: "Numero de Téléphone type +2250101788255"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter un numero de telephone valide';
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: quartierController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Quartier Habité"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter nom du quartier';
                }
              },
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: villeController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Ville Habité"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter un nom de ville';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('Enregistrer'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    ref.read(patientsListControllerProvider).add(
                          nom: nomController.text,
                          prenom: prenomController.text,
                          dateNaissance: dateNaissanceController.text,
                          phoneNumber: phoneNumberController.text,
                          quartier: quartierController.text,
                          ville: villeController.text,
                        );
                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
