import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Clipboard için
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicHomeDirectoryShareMenuShowModal extends StatelessWidget {
  const PublicHomeDirectoryShareMenuShowModal({super.key, required this.link});

  final String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bağlantıyı Paylaş',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildShareIcon(context, Icons.copy, 'Kopyala', () {
                Clipboard.setData(ClipboardData(text: link));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bağlantı kopyalandı!')),
                );
              }),
              _buildShareIcon(context, Icons.share, 'Genel', () {
                Share.share(link);
              }),
              _buildShareIcon(context, Icons.message, 'SMS', () {
                launchUrl(Uri.parse('sms:?body=$link'));
              }),
              _buildShareIcon(context, Icons.email, 'E-Posta', () {
                launchUrl(Uri.parse('mailto:?subject=Paylaşım&body=$link'));
              }),
              _buildShareIcon(context, Icons.cloud_outlined, 'WhatsApp', () {
                launchUrl(Uri.parse('https://wa.me/?text=$link'));
              }),
              _buildShareIcon(context, Icons.camera, 'Instagram', () {
                launchUrl(Uri.parse('https://www.instagram.com/?url=$link'));
              }),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
  }

  Widget _buildShareIcon(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 30),
          onPressed: onTap,
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
