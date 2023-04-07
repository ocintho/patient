import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patient_connect/commun/services/storage_service.dart';

import 'package:patient_connect/models/Patient.dart';
import 'package:patient_connect/fonctions/patient/données/patient_repository.dart';

final patientControllerProvider = Provider<PatientController>((ref) {
  return PatientController(ref);
});

class PatientController {
  PatientController(this.ref);
  final Ref ref;

  Future<void> uploadFile(File file, Patient patient) async {
    final fileKey = await ref.read(storageServiceProvider).uploadFile(file);
    if (fileKey != null) {
      final imageUrl =
          await ref.read(storageServiceProvider).getImageUrl(fileKey);
      final updatedPatient =
          patient.copyWith(patientImageKey: fileKey, patientImageUrl: imageUrl);
      await ref.read(patientsRepositoryProvider).update(updatedPatient);
      ref.read(storageServiceProvider).resetUploadProgress();
    }
  }

  ValueNotifier<double> uploadProgress() {
    return ref.read(storageServiceProvider).getUploadProgress();
  }

  Future<void> edit(Patient updatedPatient) async {
    final patientsRepository = ref.read(patientsRepositoryProvider);
    await patientsRepository.update(updatedPatient);
  }

  Future<void> delete(Patient deletedPatient) async {
    final patientsRepository = ref.read(patientsRepositoryProvider);
    await patientsRepository.delete(deletedPatient);
  }
}
