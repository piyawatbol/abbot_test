import '../../../config/app_import.dart';
import '../../../controllers/contact_controller.dart';

class SearchContractBar extends StatelessWidget {
  const SearchContractBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContractController>(
        init: ContractController(),
        builder: (controller) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextField(
              onChanged: (v) {
                controller.update();
                if (v.length >= 3) {
                  controller.onSearch();
                }
              },
              controller: controller.search,
              style: GoogleFonts.kanit(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                suffixIcon: controller.search.text.length >= 3
                    ? GestureDetector(
                        onTap: () {
                          controller.search.clear();
                          controller.update();
                        },
                        child: const Icon(Icons.close))
                    : const Icon(Icons.search),
                hintText: "Search",
                hintStyle: GoogleFonts.kanit(),
                contentPadding: const EdgeInsets.only(left: 24),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
