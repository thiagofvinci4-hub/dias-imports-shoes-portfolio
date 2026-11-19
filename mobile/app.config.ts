import type { ExpoConfig } from 'expo/config';

const config: ExpoConfig = {
  name: 'Dias Imports Shoes',
  slug: 'dias-imports-shoes',
  version: '1.0.0',
  orientation: 'portrait',
  scheme: 'diasimports',
  userInterfaceStyle: 'dark',
  icon: './assets/icon.png',
  ios: {
    supportsTablet: true,
    bundleIdentifier: 'br.com.diasimportsshoes.app',
    config: { usesNonExemptEncryption: false },
  },
  android: {
    package: 'br.com.diasimportsshoes.app',
    adaptiveIcon: { foregroundImage: './assets/adaptive-icon.png', backgroundColor: '#050505' },
  },
  web: { bundler: 'metro' },
  plugins: [
    'expo-router',
    ['expo-splash-screen', { image: './assets/icon.png', imageWidth: 220, resizeMode: 'contain', backgroundColor: '#050505', dark: { backgroundColor: '#050505' } }],
    ['expo-secure-store', { configureAndroidBackup: true }],
    ['expo-notifications', { color: '#D4AF37' }],
  ],
  experiments: { typedRoutes: true },
  extra: {
    apiUrl: process.env.EXPO_PUBLIC_API_URL || 'https://seu-servidor.example/dias-imports',
    eas: { projectId: process.env.EXPO_PUBLIC_EAS_PROJECT_ID || '' },
  },
};

export default config;
