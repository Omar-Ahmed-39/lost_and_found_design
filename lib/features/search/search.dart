import 'package:flutter/material.dart';
import 'package:lostandfound/core/constsnt/image_constant.dart';
import 'package:lostandfound/core/shared/appbar.dart';
import 'package:lostandfound/core/shared/dropdownlist.dart';
import 'package:lostandfound/core/shared/form.dart';
import 'package:lostandfound/core/shared/navigation_bottom_bar.dart';
import 'package:lostandfound/core/theme/app_theme.dart';
import 'package:lostandfound/features/search/widget/active_filter.dart';
import 'package:lostandfound/features/search/widget/filter_button.dart';
import 'package:lostandfound/features/search/widget/search_filde.dart';
import 'package:lostandfound/features/search/widget/type_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int currentIndex = 2;
  String? selectedCategory;
  List<String> activeFilters = [];

  bool isclickfilter = false;
  bool isclicklost = false;
  bool isclickfound = false;
  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(value: 'الكترونيات', child: Text('الكترونيات')),
    DropdownMenuItem(value: 'محفظة', child: Text('محفظة')),
    DropdownMenuItem(value: 'مفاتيح', child: Text('مفاتيح')),
    DropdownMenuItem(value: 'شنطة', child: Text('شنطة')),
    DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      bottomNavigationBar: MyNavigationBottomBar(currentIndex: currentIndex),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: FilterButton(
                    isClick: isclickfilter,
                    onTap: () {
                      myFilterBottemsheet(context);
                    },
                  ),
                ),

                Expanded(child: MySearchFilde()),
              ],
            ),
            const SizedBox(height: 15),

            SearchActiveFilters(
              filters: activeFilters,
              onRemove: (filter) {
                setState(() {
                  activeFilters.remove(filter);
                  if(activeFilters.isEmpty){
                    isclickfilter=false;
                  }
                });
              },
            ),
            Image.asset(MyAppImage.searchIcon,width: 250,height: 250,)
          ],
        ),
      ),
    );
  }

  Future<void> myFilterBottemsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: Text(
                      "فلترة البحث",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "اختر النوع",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 14),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTypeCard(
                        color: Colors.red,
                        text: "مفقود",
                        icon: Icons.search,
                        isselected: isclicklost,
                        ontap: () {
                          setModalState(() {
                            isclicklost = true;
                            isclickfound = false;
                          });
                        },
                      ),
                      MyTypeCard(
                        color: Colors.green,
                        text: "موجود",
                        icon: Icons.add_box_outlined,
                        isselected: isclickfound,
                        ontap: () {
                          setModalState(() {
                            isclicklost = false;
                            isclickfound = true;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),

                  MyDropdownList(
                    selectedCategory: selectedCategory,
                    text: "التصنيف",
                    hint: "اختر من القاءمة",
                    items: items,
                    onChanged: (value) {
                      selectedCategory = value!;
                    },
                  ),
                  const SizedBox(height: 22),
                  Mybutton(text: "تطبيق الفلتر", onTap: () {
                    if(isclickfound==true){
                      activeFilters.add("موجود");
                    }
                    if(isclicklost==true){
                      activeFilters.add("مفقود");
                    }
                    if(selectedCategory!=null){
                       activeFilters.add(selectedCategory!);

                    }
                    setState(() {
                        if(activeFilters.isNotEmpty){
                       isclickfilter=true;

                    }
                      Navigator.of(context).pop();
                    });
                  }),

                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
    );
  }
}



