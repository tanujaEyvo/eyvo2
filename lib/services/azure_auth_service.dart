import 'package:eyvo_inventory/app/app_prefs.dart';
import 'package:eyvo_inventory/main.dart';
import 'package:flutter/material.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';


final tenantId = SharedPrefs().tanentId;
final clientId = SharedPrefs().clientId;
final redirectURI = SharedPrefs().redirectURI;

class AzureAuthService {
  static final Config config = Config(
    tenant: tenantId,
    clientId: clientId,
    scope: "openid profile email offline_access",
    redirectUri: redirectURI,
    navigatorKey: navigatorKey,
    tokenIdentifier: "eyvo_inventory_auth_token",
    loader: const Center(child: CircularProgressIndicator()),
  );

  static final AadOAuth oauth = AadOAuth(config);

  static Future<String?> login() async {
    try {
      await oauth.login();
      final accessToken = await oauth.getAccessToken();
      return accessToken;
    } catch (e) {
      debugPrint("Azure login error: $e");
      return null;
    }
  }

  static Future<void> logout() async {
    await oauth.logout();
  }
}
