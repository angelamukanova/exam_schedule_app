import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  ExamListScreen({super.key});

  final List<Exam> exams = [
    // 15 hardcoded exams (sorted below)
    Exam(subject: 'Exam 1', dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ['Room 101']),
    Exam(subject: 'Exam 2', dateTime: DateTime(2025, 11, 21, 10, 0), rooms: ['Room 102']),
    Exam(subject: 'Exam 3', dateTime: DateTime(2025, 11, 22, 11, 0), rooms: ['Room 103']),
    Exam(subject: 'Exam 4', dateTime: DateTime(2025, 11, 23, 9, 30), rooms: ['Room 104']),
    Exam(subject: 'Exam 5', dateTime: DateTime(2025, 11, 24, 13, 0), rooms: ['Room 105']),
    Exam(subject: 'Exam 6', dateTime: DateTime(2025, 11, 25, 8, 30), rooms: ['Room 106']),
    Exam(subject: 'Exam 7', dateTime: DateTime(2025, 11, 26, 14, 0), rooms: ['Room 107']),
    Exam(subject: 'Exam 8', dateTime: DateTime(2025, 11, 27, 9, 0), rooms: ['Room 108']),
    Exam(subject: 'Exam 9', dateTime: DateTime(2025, 11, 28, 10, 30), rooms: ['Room 109']),
    Exam(subject: 'Exam 10', dateTime: DateTime(2025, 11, 29, 11, 0), rooms: ['Room 110']),
    Exam(subject: 'Exam 11', dateTime: DateTime(2025, 11, 30, 13, 30), rooms: ['Room 201']),
    Exam(subject: 'Exam 12', dateTime: DateTime(2025, 12, 1, 9, 0), rooms: ['Room 202']),
    Exam(subject: 'Exam 13', dateTime: DateTime(2025, 12, 2, 10, 0), rooms: ['Room 203']),
    Exam(subject: 'Exam 14', dateTime: DateTime(2025, 12, 3, 11, 30), rooms: ['Room 204']),
    Exam(subject: 'Exam 15', dateTime: DateTime(2025, 12, 4, 13, 0), rooms: ['Room 205']),
  ];

  @override
  Widget build(BuildContext context) {
    // Sort chronologically by dateTime
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    final total = exams.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 191099'), // замени со број на индекс
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 80),
            itemCount: exams.length,
            itemBuilder: (context, index) {
              return ExamCard(exam: exams[index]);
            },
          ),

          // Badge at bottom center showing total exams
          Positioned(
            left: 0,
            right: 0,
            bottom: 16,
            child: Center(
              child: Chip(
                elevation: 3,
                backgroundColor: Colors.blue.shade700,
                label: Text(
                  'Вкупно испити: $total',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
