import 'package:patient_connect/fonctions/patient/ui/patient_list/patient_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:patient_connect/commun/navigation/router/routes.dart';
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;

import 'fonctions/patient/ui/edit_patient_page/edit_patient_page.dart';
import 'fonctions/patient/ui/patient_page/patient_page.dart';
import 'models/ModelProvider.dart';

class PatientsConnectApp extends StatelessWidget {
  const PatientsConnectApp({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => isAmplifySuccessfullyConfigured
              ? const PatientsListPage()
              : const Scaffold(
                  body: Center(
                    child: Text(
                      'Tried to reconfigure Amplify; '
                      'this can occur when your app restarts on Android.',
                    ),
                  ),
                ),
        ),
        GoRoute(
          path: '/patient/:id',
          name: AppRoute.patient.name,
          builder: (context, state) {
            final patientId = state.params['id']!;
            return PatientPage(patientId: patientId);
          },
        ),
        GoRoute(
          path: '/editpatient/:id',
          name: AppRoute.editpatient.name,
          builder: (context, state) {
            return EditPatientPage(
              patient: state.extra! as Patient,
            );
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    );

    return Authenticator(
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        builder: Authenticator.builder(),
        theme: ThemeData(
          primarySwatch: constants.primaryColor,
          backgroundColor: const Color(0xff82CFEA),
        ),
      ),
    );
  }
}
