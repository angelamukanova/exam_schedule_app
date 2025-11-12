import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String _formatRemaining(Duration diff) {
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final remaining = exam.dateTime.difference(now);

    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subject
            Text(exam.subject, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),

            Row(children: [
              const Icon(Icons.calendar_month),
              const SizedBox(width: 8),
              Text(
                '${exam.dateTime.day.toString().padLeft(2,'0')}.${exam.dateTime.month.toString().padLeft(2,'0')}.${exam.dateTime.year}',
                style: const TextStyle(fontSize: 16),
              ),
            ]),
            const SizedBox(height: 12),

            Row(children: [
              const Icon(Icons.access_time),
              const SizedBox(width: 8),
              Text(
                '${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2,'0')}',
                style: const TextStyle(fontSize: 16),
              ),
            ]),
            const SizedBox(height: 12),

            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  exam.rooms.join(', '),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ]),
            const SizedBox(height: 20),

            const Divider(),

            const SizedBox(height: 8),
            const Text('Преостанато време:', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 8),
            remaining.isNegative
                ? const Text('Испитот е поминат', style: TextStyle(color: Colors.red))
                : Text(
              _formatRemaining(remaining),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
