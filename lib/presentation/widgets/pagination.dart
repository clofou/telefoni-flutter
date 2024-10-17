import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChange;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:
              currentPage > 1 ? () => onPageChange(currentPage - 1) : null,
          icon: const Icon(Icons.arrow_back),
        ),
        ...List.generate(totalPages, (index) {
          final pageIndex = index + 1;
          return GestureDetector(
            onTap: () => onPageChange(pageIndex),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: currentPage == pageIndex ? Colors.black : Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$pageIndex',
                style: TextStyle(
                  color: currentPage == pageIndex ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }),
        IconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChange(currentPage + 1)
              : null,
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
