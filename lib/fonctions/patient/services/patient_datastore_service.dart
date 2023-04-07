import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:patient_connect/models/Patient.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final patientsDataStoreServiceProvider =
    Provider<PatientsDataStoreService>((ref) {
  final service = PatientsDataStoreService();
  return service;
});

class PatientsDataStoreService {
  PatientsDataStoreService();

  Stream<List<Patient>> listenToPatients() {
    return Amplify.DataStore.observeQuery(
      Patient.classType,
      sortBy: [Patient.DATENAISSANCE.ascending()],
    )
        .map((event) => event.items
            .where((element) =>
                element.dateNaissance.getDateTime().isBefore(DateTime.now()))
            .toList())
        .handleError(
      (error) {
        debugPrint('listenToPatients: A Stream error happened');
      },
    );
  }

  Stream<Patient> getPatientStream(String id) {
    final patientStream = Amplify.DataStore.observeQuery(Patient.classType,
            where: Patient.ID.eq(id))
        .map((event) => event.items.toList().single);

    return patientStream;
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await Amplify.DataStore.save(patient);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deletePatient(Patient patient) async {
    try {
      await Amplify.DataStore.delete(patient);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updatePatient(Patient updatedPatient) async {
    try {
      final patientsWithId = await Amplify.DataStore.query(
        Patient.classType,
        where: Patient.ID.eq(updatedPatient.id),
      );

      final oldPatient = patientsWithId.first;
      final newPatient = oldPatient.copyWith(
        nom: updatedPatient.nom,
        prenom: updatedPatient.prenom,
        dateNaissance: updatedPatient.dateNaissance,
        phoneNumber: updatedPatient.phoneNumber,
        quartier: updatedPatient.quartier,
        ville: updatedPatient.ville,
        patientImageUrl: updatedPatient.patientImageUrl,
        patientImageKey: updatedPatient.patientImageKey,
      );

      await Amplify.DataStore.save(newPatient);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
