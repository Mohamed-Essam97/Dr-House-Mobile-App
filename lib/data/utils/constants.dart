// const String kBaseUrl = 'https://test-api.iometer.live';
// const String kBaseUrl = 'https://stage-api.iometer.live';
// const String kBaseUrl = 'https://quest-community.feat.iometer.live';
// const String kBaseUrl = 'https://quest-feed.feat.iometer.live';
// const String kBaseUrl = 'https://private-request.feat.iometer.live';
const String kBaseUrl = String.fromEnvironment('API_URL');
// const String kBaseUrl = 'https://api-v2.iometer.live';
const debugMode = bool.fromEnvironment('DEBUG_MODE');

const String KAccountName = String.fromEnvironment('ACCOUNT_NAME');
