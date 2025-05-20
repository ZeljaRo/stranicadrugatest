import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'folder_picker.dart';

class Page2Grid extends StatefulWidget {
  const Page2Grid({super.key});

  @override
  State<Page2Grid> createState() => _Page2GridState();
}

class _Page2GridState extends State<Page2Grid> {
  String? _odabranaMapa;
  String? _odabranaMediaMapa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80.h, left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Unesi ime',
              labelText: 'Ime profila (max 7 znakova):',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
          ),
          SizedBox(height: 16.h),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Odaberi vezu:',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
            items: ['Veza 1', 'Veza 2']
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (value) {},
          ),
          SizedBox(height: 30.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              _buildButton(_odabranaMapa ?? 'Odaberi mapu s tekstovima', onPressed: () async {
                final folder = await odaberiTekstMapu();
                if (folder != null) {
                  setState(() {
                    _odabranaMapa = folder;
                  });
                  print("TXT mapa: ");
                }
              }),
              _buildButton(_odabranaMediaMapa ?? 'Odaberi prateæu mapu', onPressed: () async {
                final mediaFolder = await odaberiMediaMapu();
                if (mediaFolder != null) {
                  setState(() {
                    _odabranaMediaMapa = mediaFolder;
                  });
                  print("MEDIA mapa: ");
                }
              }),
              _buildButton('Veza'),
              _buildButton('SPREMI PROFIL'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return SizedBox(
      width: 160.w,
      height: 36.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF3EDF7),
          foregroundColor: Colors.black87,
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onPressed,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
