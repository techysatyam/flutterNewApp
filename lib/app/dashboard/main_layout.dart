import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/utils/constants/colors.dart';
import '../../common/utils/constants/image_strings.dart';

class MainLayout extends StatefulWidget {
  final String parentUrl;
  final String childUrl;
  final Widget child;
  static const route = '/main_layout';

  const MainLayout({
    super.key,
    required this.parentUrl,
    required this.childUrl,
    required this.child,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        Widget scaffoldContent = Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          drawer: isMobile
              ? SafeArea(
                  child: Drawer(
                    child: Sidebar(
                      parentUrl: widget.parentUrl,
                      currentChildUrl: widget.childUrl,
                      modules: staticModules,
                    ),
                  ),
                )
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Sidebar(
                  parentUrl: widget.parentUrl,
                  currentChildUrl: widget.childUrl,
                  modules: staticModules,
                ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        children: [
                          if (isMobile)
                            IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                          Expanded(child: searchBar(context, constraints)),
                        ],
                      ),
                    ),
                    Divider(color: Colors.grey.shade400, thickness: 0.3),
                    Expanded(child: widget.child),
                    Divider(color: Colors.grey.shade400, thickness: 0.3),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Powered by ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ),
                          children: [
                            TextSpan(
                              text: "Getepay",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
        // Apply SafeArea only on mobile
        return isMobile ? SafeArea(child: scaffoldContent) : scaffoldContent;
      },
    );
  }

  // Search bar
  Widget searchBar(BuildContext context, BoxConstraints constraints) {
    bool isMobile = constraints.maxWidth < 600;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                fillColor: AppColors.lightPrimaryColor.withOpacity(0.10),
                filled: true,
                prefixIcon: SizedBox(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(
                    AppImages.searchIcon,
                    fit: BoxFit.scaleDown,
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
                hintText: 'Search',
                hintStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.lightPrimaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Module {
  final int id;
  final String name;
  final String url;
  final List<PartOfModule> partOfModule;
  final String iconPath;

  Module({
    required this.id,
    required this.name,
    required this.url,
    required this.partOfModule,
    required this.iconPath,
  });
}

class PartOfModule {
  final String partOfModuleId;
  final String partofmodulename;
  final String url;
  final String partofmoduleIcon;

  PartOfModule({
    required this.partOfModuleId,
    required this.partofmodulename,
    required this.url,
    required this.partofmoduleIcon,
  });
}

final List<Module> staticModules = [
  Module(
    id: 1,
    name: "Dashboard",
    url: "/dashboard",
    iconPath: AppImages.dashBoardIcon,
    partOfModule: [
      PartOfModule(
        partOfModuleId: "1",
        partofmodulename: "Add Form",
        url: '/add_form',
        partofmoduleIcon: "",
      ),
      PartOfModule(
        partOfModuleId: "2",
        partofmodulename: "View Form",
        url: '/view_form',
        partofmoduleIcon: "",
      ),
    ],
  ),
];

class Sidebar extends StatefulWidget {
  final String parentUrl;
  final String currentChildUrl;
  final List<Module> modules;

  const Sidebar({
    Key? key,
    required this.parentUrl,
    required this.currentChildUrl,
    required this.modules,
  }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String? currentModuleUrl;

  @override
  void initState() {
    super.initState();
    // Set Dashboard as default selected module
    currentModuleUrl =
        widget.modules.first.url; // Assuming first module is Dashboard
  }

  bool isModuleSelected(Module module) {
    return currentModuleUrl == module.url;
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    double containerWidth = screenWidth * 0.2; // Adjust the ratio if needed
    containerWidth = containerWidth.clamp(
        200.0, 260.0); // Ensure the width is between 160 and 260

    return Container(
      width: containerWidth,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.getepayLogo,
                        height: 30,
                        width: 30,
                        // fit: BoxFit.contain,
                      ),
                      RichText(
                        text: TextSpan(
                          text: " Getepay",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.lightTextColor,
                          ), // Default text style
                          children: [
                            TextSpan(
                              text: " App Store",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.lightPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // List of modules
            Expanded(
              child: ListView.builder(
                itemCount: widget.modules.length,
                itemBuilder: (context, index) {
                  final module = widget.modules[index];
                  final isSelected = isModuleSelected(module);

                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: isSelected
                              ? AppColors.lightPrimaryColor
                              : Colors.transparent,
                          width: 6,
                        ),
                      ),
                      color: isSelected
                          ? AppColors.lightPrimaryColor.withOpacity(0.06)
                          : null,
                    ),
                    child: ListTile(
                      leading: _buildLeadingIcon(module.iconPath),
                      title: Text(
                        module.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.sideBarTextColor,
                        ).copyWith(
                          color:
                              isSelected ? AppColors.lightPrimaryColor : null,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          currentModuleUrl = module.url;
                        });
                        context.go(module.url);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLeadingIcon(dynamic icon) {
  if (icon is IconData) {
    return Icon(icon);
  } else if (icon is String) {
    // Assuming it's an SVG asset path
    return SvgPicture.asset(
      icon,
      height: 24, // Adjust size as needed
      width: 24, // Adjust size as needed
      color: AppColors.lightPrimaryColor,
    );
  } else {
    return SizedBox(); // Return empty box if neither
  }
}
