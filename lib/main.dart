import 'package:flatlas/domain/repositories/world_repository.dart';
import 'package:flatlas/domain/viewmodel/world_view_model.dart';
import 'package:flatlas/presentation/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  final repository = WorldRepository();
  final viewModel = WorldViewModel(repository: repository);
  runApp(
    MyApp(
      viewModel: viewModel,
    ),
  );
}

class MyApp extends StatelessWidget {
  final WorldViewModel viewModel;
  const MyApp({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatlas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        viewModel: viewModel,
      ),
    );
  }
}
