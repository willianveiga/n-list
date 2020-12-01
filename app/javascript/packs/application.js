import '@fortawesome/fontawesome-free/js/all';
import 'cocoon-js';

require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();
require('jquery');
require('jquery-ui');

const images = require.context('../images', true);
