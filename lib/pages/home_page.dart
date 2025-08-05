import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            const SizedBox(height: 24),
            Text(
              'Basti Ki Pathshala Foundation',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: cs.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to Basti Ki Pathshala Foundation!',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'We are a registered NGO committed to empowering children in underserved slum areas through education, nutrition, and play-based learning.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _infoSection(title: 'Mission', text: 'Provide quality education & inclusive learning in slum communities.'),
            const SizedBox(height: 24),
            _infoSection(title: 'Activities', text: 'Offering food, engaging classes, animal-based play therapy, and essential support.'),
          ],
        ),
      ),
    );
  }

  Widget _infoSection({required String title, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
