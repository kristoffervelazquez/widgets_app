import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transport {
  car,
  plane,
  boat,
  submarine,
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transport selectedTransport = Transport.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
          onChanged: (value) {
            isDeveloper = !isDeveloper;
            setState(() {});
          },
        ),
        ExpansionTile(
          title: const Text("Vehículo de transport"),
          subtitle: Text("$selectedTransport"),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viaja por auto!'),
              value: Transport.car,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = Transport.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viaja por barco!'),
              value: Transport.boat,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = Transport.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viaja por avión!'),
              value: Transport.plane,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = Transport.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viaja por submarino!'),
              value: Transport.submarine,
              groupValue: selectedTransport,
              onChanged: (value) => setState(() {
                selectedTransport = Transport.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text("Desayuno?"),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text("Almuerzo?"),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text("Cena?"),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
