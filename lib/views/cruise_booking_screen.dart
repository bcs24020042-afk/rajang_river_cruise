import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                TitleSectionWidget(
                  title: viewModel.destination.title,
                  location: viewModel.destination.location,
                  starCount: viewModel.starCount,
                  isStarred: viewModel.isStarred,
                  onStarTapped: viewModel.toggleStar,
                ),
                const ActionBarWidget(),
                DescriptionWidget(description: viewModel.destination.description),
                BookingControlsWidget(viewModel: viewModel),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                      DescriptionWidget(description: viewModel.destination.description),
                    ],
                  ),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  flex: 1,
                  child: ListView(
                    children: [
                      TitleSectionWidget(
                        title: viewModel.destination.title,
                        location: viewModel.destination.location,
                        starCount: viewModel.starCount,
                        isStarred: viewModel.isStarred,
                        onStarTapped: viewModel.toggleStar,
                      ),
                      const ActionBarWidget(),
                      BookingControlsWidget(viewModel: viewModel),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}