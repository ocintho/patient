import 'package:patient_connect/commun/navigation/router/routes.dart';
import 'package:patient_connect/commun/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_connect/commun/outils/couleurs.dart' as constants;

import '../../fonctions/patient/ui/patient_list/add_patient_bottomsheet.dart';
import '../../fonctions/patient/ui/patient_list/patient_list_page.dart';

class NavigationDrawer extends ConsumerWidget {
  const NavigationDrawer({
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(constants.primaryColorDark),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                SizedBox(height: 10),
                Text('Ivoire Medconnect',
                    style: TextStyle(fontSize: 22, color: Colors.white)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Patient'),
            onTap: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.new_label),
            title: const Text('Enregistrer Patient'),
            onTap: () {
              showAddPatientDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => ref.read(authServiceProvider).signOut(),
          ),
        ],
      ),
    );
  }
}
