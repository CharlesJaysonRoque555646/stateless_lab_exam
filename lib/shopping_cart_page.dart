import 'package:flutter/material.dart';

const _ink = Color(0xFF321019);
const _muted = Color(0xFF655057);
const _burgundy = Color(0xFF800020);
const _deepBurgundy = Color(0xFF600019);
const _page = Color(0xFFF8F3F4);
const _border = Color(0xFFE7D6DC);
const _paleBurgundy = Color(0xFFF1DAE2);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _page,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        foregroundColor: _ink,
        toolbarHeight: 52,
        centerTitle: false,
        leadingWidth: 50,
        titleSpacing: 8,
        leading: IconButton(
          tooltip: 'Back',
          icon: const Icon(Icons.arrow_back_rounded, size: 22),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              tooltip: 'Cart',
              onPressed: () => debugPrint('Cart clicked'),
              icon: const SizedBox(
                width: 34,
                height: 34,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.shopping_bag_outlined, size: 28),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: _burgundy,
                        foregroundColor: Colors.white,
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _Introduction(),
                  const SizedBox(height: 12),
                  const _DeliveryCard(),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Order Items',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        '3 items',
                        style: TextStyle(color: _muted, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  const CartItemCard(
                    productName: 'Wireless Mouse',
                    price: 'PHP 450.00',
                    quantity: 1,
                    icon: Icons.mouse_outlined,
                  ),
                  const SizedBox(height: 8),
                  const CartItemCard(
                    productName: 'USB-C Hub',
                    price: 'PHP 850.00',
                    quantity: 1,
                    icon: Icons.usb_rounded,
                  ),
                  const SizedBox(height: 8),
                  const CartItemCard(
                    productName: 'Laptop Stand',
                    price: 'PHP 700.00',
                    quantity: 1,
                    icon: Icons.laptop_mac_outlined,
                  ),
                  const SizedBox(height: 12),
                  const _DiscountBanner(),
                  const SizedBox(height: 10),
                  const _PaymentSummary(),
                  const SizedBox(height: 10),
                  FilledButton.icon(
                    onPressed: () =>
                        debugPrint('Place order clicked! Total: PHP 1850.00'),
                    icon: const Icon(Icons.lock_rounded, size: 19),
                    label: const Text('Place Order'),
                    style: FilledButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: _burgundy,
                      minimumSize: const Size(0, 44),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Introduction extends StatelessWidget {
  const _Introduction();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFF4E3E8),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: _burgundy,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            fontSize: 27,
            height: 1.14,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(color: _muted, fontSize: 13),
        ),
      ],
    );
  }
}

class _DeliveryCard extends StatelessWidget {
  const _DeliveryCard();

  @override
  Widget build(BuildContext context) {
    return _CartPanel(
      padding: const EdgeInsets.fromLTRB(12, 4, 5, 4),
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded, color: _burgundy, size: 23),
          const SizedBox(width: 12),
          const SizedBox(
            height: 30,
            child: VerticalDivider(width: 1, color: _border),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Charles Jayson R Roque',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(color: _muted, fontSize: 12),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  final String productName;
  final String price;
  final int quantity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return _CartPanel(
      padding: const EdgeInsets.fromLTRB(11, 8, 7, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 63,
            height: 63,
            decoration: BoxDecoration(
              color: _paleBurgundy,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(icon, color: _deepBurgundy, size: 35),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: _burgundy,
                    fontSize: 14,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    _QuantityButton(
                      icon: Icons.remove_rounded,
                      tooltip: 'Decrease quantity: $productName',
                      onPressed: () =>
                          debugPrint('Decrease quantity: $productName'),
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        minWidth: 38,
                        minHeight: 25,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: _border),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    _QuantityButton(
                      icon: Icons.add_rounded,
                      tooltip: 'Increase quantity: $productName',
                      onPressed: () =>
                          debugPrint('Increase quantity: $productName'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            tooltip: 'Remove item: $productName',
            onPressed: () => debugPrint('Remove item: $productName'),
            icon: const Icon(Icons.delete_outline_rounded, size: 20),
            style: IconButton.styleFrom(
              foregroundColor: _muted,
              minimumSize: const Size(32, 32),
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      style: IconButton.styleFrom(
        minimumSize: const Size(32, 25),
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: _burgundy,
        side: const BorderSide(color: _burgundy),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFF0DCE3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Icon(Icons.sell_outlined, color: _burgundy, size: 23),
          SizedBox(width: 12),
          SizedBox(
            height: 30,
            child: VerticalDivider(width: 1, color: Color(0xFFDBB3C2)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: _deepBurgundy,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: _muted, fontSize: 12),
                ),
              ],
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.check_circle_rounded, color: _burgundy, size: 24),
        ],
      ),
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary();

  @override
  Widget build(BuildContext context) {
    return const _CartPanel(
      padding: EdgeInsets.fromLTRB(12, 8, 12, 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
          SizedBox(height: 4),
          _SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          _SummaryRow(label: 'Discount (10%)', amount: '− PHP 200.00'),
          _SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          Divider(color: _border, height: 14),
          _SummaryRow(label: 'Total', amount: 'PHP 1,850.00', isTotal: true),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  final String label;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: _ink,
        fontSize: isTotal ? 17 : 13,
        fontWeight: isTotal ? FontWeight.w800 : FontWeight.w500,
        height: 1.4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Text(label)),
          const SizedBox(width: 8),
          Flexible(child: Text(amount, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}

class _CartPanel extends StatelessWidget {
  const _CartPanel({required this.padding, required this.child});

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: _border),
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(padding: padding, child: child),
    );
  }
}
