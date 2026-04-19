import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_gradients.dart';
import '../../../../app/theme/app_radii.dart';
import '../../../../app/theme/app_shadows.dart';
import '../../../../app/theme/app_spacing.dart';

class DashboardAndroidPage extends StatelessWidget {
  const DashboardAndroidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const _DashboardTopBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xxl,
              ),
              children: const [
                _SummaryCard(),
                SizedBox(height: AppSpacing.lg),
                _PrimaryActionsRow(),
                SizedBox(height: AppSpacing.xl),
                _DashboardSection(
                  title: 'হিসাব খাতা',
                  items: [
                    _DashboardMenuItemData(
                      label: 'কেনার খাতা',
                      icon: Icons.shopping_cart_rounded,
                      iconBackground: Color(0xFFE8F6EF),
                      iconColor: AppColors.primary,
                      route: AppRoutes.purchaseHistory,
                    ),
                    _DashboardMenuItemData(
                      label: 'বিক্রয় খাতা',
                      icon: Icons.receipt_long_rounded,
                      iconBackground: Color(0xFFEAF1FF),
                      iconColor: Color(0xFF4169C8),
                      route: AppRoutes.salesHistory,
                    ),
                    _DashboardMenuItemData(
                      label: 'বাকির খাতা',
                      icon: Icons.account_balance_wallet_rounded,
                      iconBackground: Color(0xFFFFF0E6),
                      iconColor: Color(0xFFCE6D1D),
                      route: AppRoutes.duesLedger,
                    ),
                    _DashboardMenuItemData(
                      label: 'খরচের খাতা',
                      icon: Icons.payments_rounded,
                      iconBackground: Color(0xFFFFEBEB),
                      iconColor: Color(0xFFD54D4D),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xl),
                _DashboardSection(
                  title: 'আপনার প্রতিষ্ঠান',
                  items: [
                    _DashboardMenuItemData(
                      label: 'নগদ ক্রয়',
                      icon: Icons.badge_rounded,
                      iconBackground: Color(0xFFEAF7F2),
                      iconColor: AppColors.primaryContainer,
                      route: AppRoutes.cashPurchase,
                    ),
                    _DashboardMenuItemData(
                      label: 'পণ্য তালিকা',
                      icon: Icons.list_alt_rounded,
                      iconBackground: Color(0xFFEAF7F2),
                      iconColor: AppColors.primaryContainer,
                    ),
                    _DashboardMenuItemData(
                      label: 'স্টক ব্যবস্থাপনা',
                      icon: Icons.inventory_2_rounded,
                      iconBackground: Color(0xFFEAF7F2),
                      iconColor: AppColors.primaryContainer,
                    ),
                    _DashboardMenuItemData(
                      label: 'রিপোর্ট',
                      icon: Icons.bar_chart_rounded,
                      iconBackground: Color(0xFFEAF7F2),
                      iconColor: AppColors.primaryContainer,
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.xl),
                _DashboardSection(
                  title: 'অন্যান্য ট্রানজেকশন',
                  items: [
                    _DashboardMenuItemData(
                      label: 'মালিক নিলো/দিলো',
                      icon: Icons.monetization_on_rounded,
                      iconBackground: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.textSecondary,
                    ),
                    _DashboardMenuItemData(
                      label: 'বাকি লেনদেন',
                      icon: Icons.apps_rounded,
                      iconBackground: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.textSecondary,
                    ),
                    _DashboardMenuItemData(
                      label: 'অন্যান্য আয়',
                      icon: Icons.campaign_rounded,
                      iconBackground: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.textSecondary,
                    ),
                    _DashboardMenuItemData(
                      label: 'পণ্য ফেরত',
                      icon: Icons.refresh_rounded,
                      iconBackground: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.textSecondary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardTopBar extends StatelessWidget {
  const _DashboardTopBar();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: AppGradients.primaryButton,
        boxShadow: AppShadows.soft,
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 68,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.18),
                    ),
                  ),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    'ইউসামানিটারি কোং',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  color: const Color(0xFF61E0B1),
                  icon: const Icon(Icons.notifications_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard();

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w700,
        );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _SummaryHeadline(
                  label: 'ক্যাশ বক্সে আছে',
                  value: '৳ ৮,০০,০০০',
                  valueColor: const Color(0xFFC63D3D),
                  alignment: CrossAxisAlignment.start,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _SummaryHeadline(
                  label: 'মালিক নিলো/দিলো',
                  value: '৳ -১,০০,০০০',
                  valueColor: AppColors.primaryContainer,
                  alignment: CrossAxisAlignment.end,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.36,
            children: [
              _MetricTile(
                label: 'মোট বিক্রিত পণ্য মূল্য',
                value: '৳ ১১,০০,০০০',
                accentColor: AppColors.secondary,
                titleStyle: titleStyle,
              ),
              _MetricTile(
                label: 'মোট বিক্রিত পণ্য সংখ্যা',
                value: '১১',
                accentColor: AppColors.primaryContainer,
                titleStyle: titleStyle,
              ),
              _MetricTile(
                label: 'বাকি দিয়েছি',
                value: '৳ ১,০০,০০০',
                accentColor: AppColors.tertiary,
                titleStyle: titleStyle,
              ),
              _MetricTile(
                label: 'আজকের খরচ',
                value: '৳ ১,০০,০০০',
                accentColor: const Color(0xFF20B889),
                titleStyle: titleStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryHeadline extends StatelessWidget {
  const _SummaryHeadline({
    required this.label,
    required this.value,
    required this.valueColor,
    required this.alignment,
    this.textAlign = TextAlign.left,
  });

  final String label;
  final String value;
  final Color valueColor;
  final CrossAxisAlignment alignment;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: valueColor,
              ),
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
    required this.accentColor,
    required this.titleStyle,
  });

  final String label;
  final String value;
  final Color accentColor;
  final TextStyle? titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(99),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(label, style: titleStyle),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryActionsRow extends StatelessWidget {
  const _PrimaryActionsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _PrimaryActionButton(
            label: 'খরচ',
            icon: Icons.shopping_bag_rounded,
            onPressed: () => context.push(AppRoutes.expenses),
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _PrimaryActionButton(
            label: 'পণ্য বিক্রয়',
            icon: Icons.sell_rounded,
            onPressed: () => context.push(AppRoutes.sales),
          ),
        ),
      ],
    );
  }
}

class _PrimaryActionButton extends StatelessWidget {
  const _PrimaryActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppGradients.primaryButton,
        borderRadius: BorderRadius.circular(AppRadii.md),
        boxShadow: AppShadows.button,
      ),
      child: SizedBox(
        height: 76,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.onPrimary,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
          ),
          icon: Icon(icon, size: 22),
          label: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ),
    );
  }
}

class _DashboardSection extends StatelessWidget {
  const _DashboardSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<_DashboardMenuItemData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        GridView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: AppSpacing.sm,
            mainAxisSpacing: AppSpacing.sm,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _DashboardMenuItem(item: item);
          },
        ),
      ],
    );
  }
}

class _DashboardMenuItem extends StatelessWidget {
  const _DashboardMenuItem({
    required this.item,
  });

  final _DashboardMenuItemData item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.route == null ? null : () => context.push(item.route!),
      borderRadius: BorderRadius.circular(AppRadii.lg),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppRadii.lg),
          boxShadow: AppShadows.soft,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: item.iconBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                item.icon,
                color: item.iconColor,
                size: 24,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Expanded(
              child: Center(
                child: Text(
                  item.label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardMenuItemData {
  const _DashboardMenuItemData({
    required this.label,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
    this.route,
  });

  final String label;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String? route;
}
