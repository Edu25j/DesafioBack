function fn() {
  var env = karate.env || 'dev';

  var config = {
    baseUrl: ''
  };

  if (env === 'dev') {
    config.baseUrl = 'https://serverest.dev';
  } else if (env === 'qa') {
    config.baseUrl = 'https://serverest.qa';
  }

  karate.log('Ambiente:', env);
  karate.log('Base URL:', config.baseUrl);

  return config;
}