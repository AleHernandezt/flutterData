import 'package:flutter/material.dart';
// Asegúrate de importar esto

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Formulario de Captura de Datos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  bool _works = false;
  bool _studies = false;
  String? _gender;
  bool _notificationsEnabled = false;
  double _estimatedPrice = 0.0;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://example.com/logo.png', // Reemplaza con la URL de tu imagen
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error);
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Formulario de captura de datos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _works,
                    onChanged: (bool? value) {
                      setState(() {
                        _works = value ?? false;
                      });
                    },
                  ),
                  const Text('Trabaja'),
                  const SizedBox(width: 20),
                  Checkbox(
                    value: _studies,
                    onChanged: (bool? value) {
                      setState(() {
                        _studies = value ?? false;
                      });
                    },
                  ),
                  const Text('Estudia'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Masculino',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text('Masculino'),
                  Radio<String>(
                    value: 'Femenino',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  const Text('Femenino'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Notificaciones:'),
                  Switch(
                    value: _notificationsEnabled,
                    onChanged: (bool value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Seleccione precio estimado:'),
                  Expanded(
                    child: Slider(
                      value: _estimatedPrice,
                      min: 0,
                      max: 1000,
                      divisions: 100,
                      label: _estimatedPrice.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _estimatedPrice = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      _selectedDate == null
                          ? 'Seleccionar fecha'
                          : 'Fecha: ${_selectedDate!.toLocal()}'.split(' ')[0],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      _selectedTime == null
                          ? 'Seleccionar hora'
                          : 'Hora: ${_selectedTime!.format(context)}',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aquí puedes manejar la lógica de envío del formulario
                  String name = _nameController.text;
                  debugPrint('Nombre: $name');
                  debugPrint('Trabaja: $_works');
                  debugPrint('Estudia: $_studies');
                  debugPrint('Género: $_gender');
                  debugPrint('Notificaciones: $_notificationsEnabled');
                  debugPrint('Precio estimado: $_estimatedPrice');
                  debugPrint('Fecha seleccionada: $_selectedDate');
                  debugPrint('Hora seleccionada: $_selectedTime');
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
