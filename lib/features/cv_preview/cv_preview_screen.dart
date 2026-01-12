import 'package:flutter/material.dart';
import 'widgets/cv_document_widget.dart';
import 'widgets/bottom_action_panel.dart';

class CVPreviewScreen extends StatelessWidget {
  const CVPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        leading: const BackButton(color: Colors.blue),
        title: const Text('Preview', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: const CVDocumentWidget(),
            ),
          ),
          const BottomActionPanel(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.zoom_in, color: Colors.blue),
      ),
    );
  }
}
