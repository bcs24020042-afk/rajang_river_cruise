import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        "${viewModel.selectedDate.day}/${viewModel.selectedDate.month}/${viewModel.selectedDate.year}";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const Text(
            'Trip Preferences',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: const Text('Cruise Date'),
            trailing: Text(
              formattedDate,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => _selectDate(context),
          ),
          ListTile(
            title: const Text('Cruise Package'),
            trailing: DropdownButton<String>(
              value: viewModel.selectedPackage,
              onChanged: viewModel.updatePackage,
              items: viewModel.packages
                  .map((pkg) => DropdownMenuItem(value: pkg, child: Text(pkg)))
                  .toList(),
            ),
          ),
          SwitchListTile(
            title: const Text('Dark Mode Theme'),
            value: viewModel.isDarkMode,
            onChanged: viewModel.toggleTheme,
          ),
        ],
      ),
    );
  }
}