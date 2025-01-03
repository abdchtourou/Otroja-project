import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../data/models/absence_model/get_groups.dart';
class DropDownGroup extends StatelessWidget {
  final List<getGroupsModel> list;
  final String? labelText;
  final String? hint;
  final ValueChanged<getGroupsModel?> onChanged;

  DropDownGroup({
    Key? key,
    required this.list,
    required this.labelText,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (labelText != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, right: 15),
              child: Text(
                labelText!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          Align(
            alignment: Alignment.center,
            child: DropdownButtonFormField<getGroupsModel>(

              isExpanded: true,
              isDense: true,
              hint: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  hint!,
                  style: const TextStyle(fontSize: 20,),
                  textAlign: TextAlign.center,
                ),
              ),
              dropdownColor: OtrojaColors.primary2Color,
              menuMaxHeight: 200,
              iconSize: 32,
              iconEnabledColor: const Color(0xFFE6E6E6),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6E6E6),
                    width: 2.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6E6E6),
                    width: 2.5,
                  ),
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              elevation: 0,
              style: const TextStyle(
                fontSize: 17.75,
                color: Colors.black,
              ),
              onChanged: onChanged,
               items: [

            ...list.map<DropdownMenuItem<getGroupsModel>>((getGroupsModel name) {

                  return DropdownMenuItem<getGroupsModel>(
                alignment: AlignmentDirectional.center,
                value: name,
                child: Text(name.name!,textAlign: TextAlign.left,),
              );
            }).toList(),
                    ],
            ),
          ),
        ],
      ),
    );
  }
}
