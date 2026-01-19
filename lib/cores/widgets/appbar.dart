import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import '../constants/app_fonts.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const AppAppBar({
    super.key,
    required this.title,
    this.showBack = true,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      forceMaterialTransparency: true,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      leading: showBack
          ? Padding(
              padding: const EdgeInsets.only(left: 12),
              child: _BackButton(isDark: isDark),
            )
          : null,
      title: Text(
        title,
        style: AppFonts.body.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),
      actions: actions,
    );
  }
}

class _BackButton extends StatelessWidget {
  final bool isDark;

  const _BackButton({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => Navigator.of(context).maybePop(),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
          ],
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 18,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
