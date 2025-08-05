import 'package:flutter/material.dart';

class VolunteerFormPage extends StatefulWidget {
  const VolunteerFormPage({super.key});

  @override
  State<VolunteerFormPage> createState() => _VolunteerFormPageState();
}

class _VolunteerFormPageState extends State<VolunteerFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _city = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _city.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final cs = Theme.of(context).colorScheme;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Thank You!'),
          content: Text('Hello ${_name.text}, we’ll get in touch soon.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
        // backgroundColor: cs.surface,
      );
      _name.clear();
      _phone.clear();
      _city.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Volunteer With Us')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (v) => (v == null || v.length < 10) ? 'Enter valid phone' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _city,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.send),
                label: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: cs.primary,
                  foregroundColor: cs.surface,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
