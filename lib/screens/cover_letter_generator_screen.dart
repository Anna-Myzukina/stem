import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';

/// Cove letter generator widget
/// Takes from user Job Title & Company Name for prompt
/// Generate response using firebase_vertexai package
///
class CoverLetterGeneratorScreen extends StatefulWidget {
  const CoverLetterGeneratorScreen({super.key});

  @override
  State<CoverLetterGeneratorScreen> createState() =>
      _CoverLetterGeneratorScreenState();
}

class _CoverLetterGeneratorScreenState
    extends State<CoverLetterGeneratorScreen> {
  final _formKey = GlobalKey<FormState>();

  final _jobTitleController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _currentPositionController = TextEditingController();

  String? generatedText;
  late final GenerativeModel model;

  @override
  void initState() {
    super.initState();
    model =
        FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash');
  }

  Future<void> _generateCoverLetter() async {
    if (_formKey.currentState!.validate()) {
      final jobTitle = _jobTitleController.text;
      final companyName = _companyNameController.text;
      final currentPosition = _currentPositionController.text;

      final prompt = [
        Content.text(
          'I am a $currentPosition.'
          'Write a cover letter for me for the $jobTitle position at $companyName.',
        )
      ];

      try {
        final response = await model.generateContent(prompt);
        setState(() {
          generatedText = response.text;
        });
      } catch (e) {
        print('Error generating text: $e');
        // Handle the error, e.g., show an error message to the user
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cover Letter Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: generatedText == null
        ? Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller:
                    _currentPositionController, // Add this TextFormField
                decoration:
                    const InputDecoration(labelText: 'Current Position'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your current job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jobTitleController,
                decoration: const InputDecoration(labelText: 'Job Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the job title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _companyNameController,
                decoration: const InputDecoration(labelText: 'Company Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the company name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateCoverLetter,
                child: const Text('Generate Cover Letter'),
              ),
              const SizedBox(height: 20),
              
            ],
          ),
        )
        : Expanded(
                  child: SingleChildScrollView(
                    child: Text(generatedText!),
                  ),
                ),
      ),
    );
  }
}
