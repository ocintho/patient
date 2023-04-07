import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:patient_connect/fonctions/patient/controller/patient_controller.dart';
import 'package:patient_connect/commun/navigation/router/routes.dart';
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;

import 'package:patient_connect/models/Patient.dart';
import 'package:patient_connect/fonctions/patient/ui/patient_page/delete_patient_dialog.dart';
import 'package:patient_connect/commun/ui/upload_progress_dialog.dart';

class SelectedPatientCard extends ConsumerWidget {
  const SelectedPatientCard({
    required this.patient,
    super.key,
  });

  final Patient patient;

  Future<void> uploadImage({
    required BuildContext context,
    required WidgetRef ref,
    required Patient patient,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) {
      return;
    }

    final file = File(pickedFile.path);
    showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const UploadProgressDialog();
        });
    await ref.read(patientControllerProvider).uploadFile(file, patient);
  }

  Future<bool> deletePatient(
      BuildContext context, WidgetRef ref, Patient patient) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return const DeletePatientDialog();
        });
    value ??= false;

    if (value) {
      await ref.read(patientControllerProvider).delete(patient);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            patient.nom,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(constants.primaryColorDark), //Color(0xffE1E5E4),
            height: 150,

            child: patient.patientImageUrl != null
                ? Stack(children: [
                    const Center(child: CircularProgressIndicator()),
                    CachedNetworkImage(
                      cacheKey: patient.patientImageKey,
                      imageUrl: patient.patientImageUrl!,
                      width: double.maxFinite,
                      height: 500,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                    ),
                  ])
                : Image.asset(
                    'images/amplify.png',
                    fit: BoxFit.contain,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.editpatient.name,
                    params: {'id': patient.id},
                    extra: patient,
                  );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  uploadImage(
                    context: context,
                    patient: patient,
                    ref: ref,
                  ).then((value) =>
                      Navigator.of(context, rootNavigator: true).pop());
                },
                icon: const Icon(Icons.camera_enhance_sharp),
              ),
              IconButton(
                onPressed: () {
                  deletePatient(context, ref, patient).then((value) {
                    if (value) {
                      context.goNamed(
                        AppRoute.home.name,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
