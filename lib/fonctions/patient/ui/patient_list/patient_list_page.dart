import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:patient_connect/fonctions/patient/données/patient_repository.dart';
import 'package:patient_connect/fonctions/patient/ui/patient_list/add_patient_bottomsheet.dart';
import 'package:patient_connect/fonctions/patient/ui/patient_list/patient_card.dart';
// ignore: unused_import
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;

import '../../../../commun/ui/navigation_drawer.dart';

class PatientsListPage extends HookConsumerWidget {
  const PatientsListPage({
    super.key,
  });

  void showAddPatientDialog(BuildContext context) async {
    await showModalBottomSheet<void>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return AddPatientBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final patientsListValue = ref.watch(patientsListStreamProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'IVOIRE MEDCONECT',
          ),
          backgroundColor: const Color.fromARGB(205, 44, 253, 37),
        ),
        drawer: const NavigationDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddPatientDialog(context);
          },
          backgroundColor: const Color.fromARGB(205, 62, 253, 37),
          child: const Icon(Icons.add),
        ),
        body: patientsListValue.when(
            data: (patients) => patients.isEmpty
                ? const Center(
                    child: Text('Aucun Patient Affiché'),
                  )
                : Column(
                    children: [
                      Flexible(
                        child: GridView.count(
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 2 : 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          padding: const EdgeInsets.all(4),
                          childAspectRatio:
                              (orientation == Orientation.portrait) ? 0.9 : 1.4,
                          children: patients.map((patientData) {
                            return PatientCard(patient: patientData!);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
                  child: Text('Error'),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
