const bool isProduction = bool.fromEnvironment('dart.vm.product');

const _defaults = {
  'SUPPORTED_LOCALES': ['ru', 'en', 'es'],
  'FALLBACK_LOCALE': 'en',
};


const productConfig = {
  'HOST': '',
  'API_BASE_URL': '',
};


const devConfig = {
  'HOST': '',
  'API_BASE_URL': '',
};


Map _config = (isProduction) ? productConfig : devConfig;

Map config = {
  ..._config,
  ..._defaults,
};
