import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;
  final List<String> filterOptions;
  final String selectedFilter;
  final Function(String?)? onFilterChange;

  const FilterBar({
    super.key,
    required this.searchController,
    required this.onSearch,
    required this.filterOptions,
    required this.selectedFilter,
    required this.onFilterChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton<String>(
          value: selectedFilter,
          items: filterOptions
              .map((option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: onFilterChange,
        ),
        SizedBox(
          width: 300,
          child: TextField(
            controller: searchController,
            onChanged: onSearch,
            decoration: InputDecoration(
              hintText: 'Rechercher ici...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ],
    );
  }
}
