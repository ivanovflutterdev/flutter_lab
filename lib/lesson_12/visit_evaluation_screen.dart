import 'package:flutter/material.dart';

class VisitEvaluationScreen extends StatelessWidget {
  const VisitEvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 237, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 253, 251, 255),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 254, 249, 249),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: const StarRating(rating: 4),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Яку оцінку поставите відділам?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                _departmentCard(
                  title: 'Випічка',
                  serviceState: 'dislike',
                  assortmentState: 'like',
                ),
                const SizedBox(height: 16),
                _departmentCard(
                  title: 'Лавка традицій',
                  serviceState: 'like',
                  assortmentState: 'none',
                ),
                const SizedBox(height: 28),
                _additionalComment(),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _submitButton(),
          ),
        ],
      ),
    );
  }
}

Widget _departmentCard({
  required String title,
  required String serviceState,
  required String assortmentState,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 254, 249, 249),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _ratingRow('Обслуговування', serviceState),
        const SizedBox(height: 8),
        _ratingRow('Асортимент', assortmentState),
        const SizedBox(height: 16),
        Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Розкажіть докладніше',
            style: TextStyle(color: Colors.black54),
          ),
        ),
        SizedBox(height: 10),
      ],
    ),
  );
}

Widget _ratingRow(String text, String state) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 16)),
        ),
        _circleIcon(Icons.thumb_down_alt_outlined, state == 'dislike'),
        const SizedBox(width: 8),
        _circleIcon(Icons.thumb_up_alt_outlined, state == 'like'),
      ],
    ),
  );
}

Widget _circleIcon(IconData icon, bool isActive) {
  return Container(
    width: 36,
    height: 36,
    decoration: BoxDecoration(
      color: isActive ? Colors.indigo : Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
    child: Icon(
      icon,
      size: 18,
      color: isActive ? Colors.white : Colors.black54,
    ),
  );
}

Widget _additionalComment() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Є що додати?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Поділіться загальним враженням',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ],
    ),
  );
}

Widget _submitButton() {
  return Container(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 21),
    color: const Color.fromARGB(255, 253, 251, 255),
    child: SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: const Text(
          'Надіслати',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

class StarRating extends StatelessWidget {
  const StarRating({required this.rating, super.key});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < rating) {
          return const Icon(
            Icons.star,
            size: 48,
            color: Colors.deepOrangeAccent,
          );
        } else {
          return Icon(
            Icons.star,
            size: 48,
            color: Colors.white,
            shadows: const [Shadow(color: Colors.black, blurRadius: 5)],
          );
        }
      }),
    );
  }
}
