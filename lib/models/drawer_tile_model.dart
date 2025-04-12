import 'package:flutter/material.dart';

enum ActionType {
  accountManager,
  pOD,
  myBankAccount,
  mpin,
  myEarnings,
  myReferrals,
  changeLanguage,
  joinTelegram,
  rateUs,
  aboutApp,
  tdsDeduction,
  privacyPolicy,
  termsConditions,
  logout,
  support,
  coupon,
  joinAsDeliveryMan,
  openStore
}

class DrawerTileModel {
  String label;
  String svgIcon;
  bool onlyIcon;
  IconData icon;
  ActionType? actionType;
  Function()? onTap;

  DrawerTileModel(
      {required this.label,
      this.svgIcon = "",
      this.onTap,
      this.onlyIcon = true,
      required this.icon,
      required this.actionType});
}

List<DrawerTileModel> drawerTiles = [
  DrawerTileModel(
    label: "Personal Manager",
    svgIcon: "",
    actionType: ActionType.accountManager,
    icon: Icons.person_2_outlined,
  ),
  DrawerTileModel(
    label: "Print on demand (POD)",
    svgIcon: "",
    actionType: ActionType.pOD,
    icon: Icons.design_services,
  ),
  DrawerTileModel(
    label: "Linked Bank Accounts ",
    svgIcon: "",
    // actionType: null,
    actionType: ActionType.myBankAccount,
    icon: Icons.account_balance_outlined,
  ),
  DrawerTileModel(
    label: "MPIN",
    svgIcon: "",
    actionType: null,
    icon: Icons.password_rounded,
  ),
  DrawerTileModel(
    label: "My Earnings",
    svgIcon: "",
    // actionType: null,
    actionType: ActionType.myEarnings,
    icon: Icons.money,
  ),
  DrawerTileModel(
    label: "My Referrals",
    svgIcon: "",
    actionType: ActionType.myReferrals,
    icon: Icons.share_sharp,
  ),
  DrawerTileModel(
    label: "Change Language",
    svgIcon: "",
    actionType: null,
    icon: Icons.language_outlined,
  ),
  DrawerTileModel(
    label: "Join Telegram",
    svgIcon: "",
    actionType: null,
    icon: Icons.telegram,
  ),
  DrawerTileModel(
    label: "Coupon",
    svgIcon: "",
    actionType: ActionType.coupon,
    icon: Icons.discount,
  ),
  DrawerTileModel(
    label: "Join as a Delivery Man",
    svgIcon: "",
    actionType: ActionType.joinAsDeliveryMan,
    icon: Icons.delivery_dining,
  ),
  DrawerTileModel(
    label: "Open Store",
    svgIcon: "",
    actionType: ActionType.openStore,
    icon: Icons.store,
  ),
  DrawerTileModel(
    label: "Rate Us",
    svgIcon: "",
    actionType: null,
    icon: Icons.star_rate_outlined,
  ),
  DrawerTileModel(
    label: "About Sambhav App",
    svgIcon: "",
    actionType: ActionType.aboutApp,
    icon: Icons.info_outline,
  ),
  DrawerTileModel(
    label: "TDS Deduction Info",
    svgIcon: "",
    actionType: ActionType.tdsDeduction,
    icon: Icons.sticky_note_2_outlined,
  ),
  DrawerTileModel(
    label: "Privacy & Policy",
    svgIcon: "",
    actionType: ActionType.privacyPolicy,
    icon: Icons.policy,
  ),
  DrawerTileModel(
    label: "Support",
    svgIcon: "",
    actionType: ActionType.support,
    icon: Icons.support_agent_outlined,
  ),
  DrawerTileModel(
    label: "Terms & Conditions",
    svgIcon: "",
    actionType: ActionType.termsConditions,
    icon: Icons.document_scanner,
  ),
  DrawerTileModel(
    label: "Logout",
    svgIcon: "",
    actionType: ActionType.logout,
    icon: Icons.logout,
  ),
];
