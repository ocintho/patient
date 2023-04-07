import 'package:patient_connect/fonctions/patient/services/patient_datastore_service.dart';
import 'package:patient_connect/models/Patient.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final patientsRepositoryProvider = Provider<PatientsRepository>((ref) {
  PatientsDataStoreService patientsDataStoreService =
      ref.read(patientsDataStoreServiceProvider);
  return PatientsRepository(patientsDataStoreService);
});

final patientsListStreamProvider =
    StreamProvider.autoDispose<List<Patient?>>((ref) {
  final patientsRepository = ref.watch(patientsRepositoryProvider);
  return patientsRepository.getPatients();
});

final patientProvider =
    StreamProvider.autoDispose.family<Patient?, String>((ref, id) {
  final patientsRepository = ref.watch(patientsRepositoryProvider);
  return patientsRepository.get(id);
});

class PatientsRepository {
  PatientsRepository(this.patientsDataStoreService);

  final PatientsDataStoreService patientsDataStoreService;

  Stream<List<Patient>> getPatients() {
    return patientsDataStoreService.listenToPatients();
  }

  Future<void> add(Patient patient) async {
    await patientsDataStoreService.addPatient(patient);
  }

  Future<void> update(Patient updatedPatient) async {
    await patientsDataStoreService.updatePatient(updatedPatient);
  }

  Future<void> delete(Patient deletedPatient) async {
    await patientsDataStoreService.deletePatient(deletedPatient);
  }

  Stream<Patient> get(String id) {
    return patientsDataStoreService.getPatientStream(id);
  }
}
