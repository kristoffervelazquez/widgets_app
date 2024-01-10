import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            },
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.read(colorListProvider);
    // final int selectedColor = ref.watch(colorProvider);

    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text(color.value.toString()),
          activeColor: color,
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            // todo: notificar el cambio
            // ref.read(colorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);
          },
        );
      },
    );
  }
}
