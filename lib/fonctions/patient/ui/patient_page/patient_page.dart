import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:patient_connect/commun/navigation/router/routes.dart';
import 'package:patient_connect/fonctions/patient/données/patient_repository.dart';
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;
import 'package:patient_connect/fonctions/patient/ui/patient_page/selected_patient_card.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({
    required this.patientId,
    super.key,
  });
  final String patientId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ivoire Medconect',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
        backgroundColor: const Color(constants.primaryColorDark),
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final patientValue = ref.watch(patientProvider(patientId));
          return patientValue.when(
            data: (patient) => patient == null
                ? const Center(
                    child: Text('Aucun Patient Trouvé'),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SelectedPatientCard(patient: patient),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
            error: (e, st) => const Center(
              child: Text('Erreur'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
