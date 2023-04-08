import 'package:flutter/material.dart';

import '../../../utils/styles/container_decoration.dart';
import '../../../utils/styles/text_styles.dart';

class SearchBoxWidget extends StatelessWidget {
  final void Function(String value) onPressed;
  final TextEditingController searchController;
  const SearchBoxWidget({
    super.key,
    required this.searchController,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kSearchContainerDecoration.copyWith(
        color: Colors.grey.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(Icons.search),
            ),
            SizedBox(
              width: 240,
              height: 40,
              child: TextField(
                onSubmitted: onPressed,
                controller: searchController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for a user",
                  hintStyle: kDeepColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
