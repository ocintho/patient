import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:patient_connect/commun/navigation/router/routes.dart';
import 'package:patient_connect/fonctions/patient/controller/patient_controller.dart';
import 'package:patient_connect/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;

class EditPatientPage extends HookConsumerWidget {
  EditPatientPage({
    required this.patient,
    super.key,
  });
  final Patient patient;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nomController = useTextEditingController(text: patient.nom);
    final prenomController = useTextEditingController(text: patient.prenom);
    final dateNaissanceController = useTextEditingController(
        text: DateFormat('yyyy-MM-dd')
            .format(patient.dateNaissance.getDateTime()));
    final phoneNumberController =
        useTextEditingController(text: patient.phoneNumber);
    final quartierController = useTextEditingController(text: patient.quartier);
    final villeController = useTextEditingController(text: patient.ville);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ivoire Medconect',
        ),
        leading: IconButton(
          onPressed: () {
            context.goNamed(
              AppRoute.patient.name,
              params: {'id': patient.id},
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formGlobalKey,
          child: Container(
            padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 15),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  //initialValue: trip.nom,
                  controller: nomController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    const validationError = 'Entrer un nom valide';
                    if (value == null || value.isEmpty) {
                      return validationError;
                    }
                    return null;
                  },
                  autofocus: true,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: "Nom Patient"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: prenomController,
                  autofocus: true,
                  autocorrect: false,
                  decoration: const InputDecoration(hintText: "Prenom Patient"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Entrer a valid prenom';
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  controller: dateNaissanceController,
                  autofocus: true,
                  autocorrect: false,
                  decoration:
                      const InputDecoration(hintText: "Date de Naissance"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Entrer a valid date';
                    }
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1945),
                        lastDate: DateTime(2101));

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
                  decoration:
                      const InputDecoration(hintText: "Numero de Téléphone"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Entrer un Numero de Téléphone';
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: quartierController,
                  autofocus: true,
                  autocorrect: false,
                  decoration:
                      const InputDecoration(hintText: "Quartier Habité"),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      return null;
                    } else {
                      return 'Entrer un Mot Valid';
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
                      return 'Entrer une Ville Valide';
                    }
                  },
                ),
                TextButton(
                    child: const Text('Mettre à jour'),
                    onPressed: () async {
                      final currentState = formGlobalKey.currentState;
                      if (currentState == null) {
                        return;
                      }
                      if (currentState.validate()) {
                        final updatedPatient = patient.copyWith(
                          nom: nomController.text,
                          prenom: prenomController.text,
                          dateNaissance: TemporalDate(
                              DateTime.parse(dateNaissanceController.text)),
                          phoneNumber: phoneNumberController.text,
                          quartier: quartierController.text,
                          ville: villeController.text,
                        );
                        ref
                            .read(patientControllerProvider)
                            .edit(updatedPatient);
                        context.goNamed(
                          AppRoute.patient.name,
                          params: {'id': patient.id},
                        );
                      }
                    } //,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
