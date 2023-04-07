import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:patient_connect/fonctions/patient/données/patient_repository.dart';
import 'package:patient_connect/models/ModelProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final patientsListControllerProvider = Provider<PatientsListController>((ref) {
  return PatientsListController(ref);
});

class PatientsListController {
  PatientsListController(this.ref);
  final Ref ref;

  Future<void> add({
    required String nom,
    required String prenom,
    required String dateNaissance,
    required String phoneNumber,
    required String quartier,
    required String ville,
  }) async {
    Patient patient = Patient(
      nom: nom,
      prenom: prenom,
      dateNaissance: TemporalDate(DateTime.parse(dateNaissance)),
      phoneNumber: phoneNumber,
      quartier: quartier,
      ville: ville,
    );

    final patientsRepository = ref.read(patientsRepositoryProvider);
    await patientsRepository.add(patient);
  }
}
