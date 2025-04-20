import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newwhhrrr/app/dashboard/add_form/ImagePreviewScreen.dart';
import 'package:newwhhrrr/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:newwhhrrr/common/networking/api_url.dart';

import '../add_form/view_form.dart';
import '../models/get_all_app_model.dart';

class AppListTile extends StatefulWidget {
  final GetForm app;
  const AppListTile({super.key, required this.app});

  @override
  State<AppListTile> createState() => _AppListTileState();
}

class _AppListTileState extends State<AppListTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final app = widget.app;

    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            // Navigate to preview screen
            context.go('/app_list/view_form',
                extra: app);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => ViewForm()
            //   ),
            // );
          },
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFF5F5F5),
                        Color(0xFFE0E0E0),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(3, 3),
                        blurRadius: 5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-2, -2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "${ApiUrl.download}${app.appIcon}",
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                    ),
                  ),
                ),


                title: Text(app.appName ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${app.category ?? 'Unknown'} • ${app.developerName ?? 'Dev'}',
                        style: const TextStyle(fontSize: 12)),
                    Text('${app.ratings ?? '0.0'} ★ • ${app.sizeMb ?? 0} MB',
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ),
              if (isExpanded) _buildExpandedView(app),
              // const Divider(height: 1),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExpandedView(GetForm app) {
    return SizedBox(
      height: 180, // ensures space for horizontal scroll
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _infoCard(title: 'About', content: app.appDescription ?? 'No description'),
          _imageCard('${ApiUrl.download}${app.screenshot1}'),
          _imageCard('${ApiUrl.download}${app.screenshot2}'),
          _imageCard('${ApiUrl.download}${app.screenshot3}'),
          _imageCard('${ApiUrl.download}${app.screenshot4}'),
        ],
      ),
    );
  }

  Widget _infoCard({required String title, required String content}) {
    return Container(
      width: 240, // landscape layout
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)), // heading unchanged
              const SizedBox(height: 6),
              Text(
                content,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12), // 2 units up from default 10
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageCard(String? url) {
    return Container(
      width: 120 * 1.2, // increased by 20%
      height: 100 * 1.2,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: url != null
            ? Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
        )
            : const Icon(Icons.image),
      ),
    );
  }

}



