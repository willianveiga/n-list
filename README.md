# NList 📝📝📝
NList is a simple [Ruby on Rails](https://rubyonrails.org/) to-do list WEB application.

With NList you can:

- Maintain as many to-do lists as you want.
- Drag and drop tasks to reorder your to-do lists.
- Clone to-do lists and its tasks.
- Sign in with your Google account.

## Demo
[NList Demo](https://n-list-demo.herokuapp.com/)

## Executing
To run NList locally, execute the following steps:

1. Access [Google Developers Console](https://console.developers.google.com) and create a new project.
2. Create a new [OAuth Credential](https://console.developers.google.com/apis/credentials). Setup `Authorized redirect URIs` with the value `http://localhost:3000/users/auth/google_oauth2/callback`.
3. Rename `.env.development.local-sample` to `.env.development.local`.
4. Configure `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` with the values provided by your OAuth Credential (`Client ID` and `Client secret` respectivelly).
5. Set `DATABASE_URL` with your PostgreSQL database address and credentials.
6. Execute `bundle install`.
7. Execute `rails db:migrate`.
8. Execute `rails server`.
9. Access `http://localhost:3000`.

## Testing
To run the tests execute the following steps:

1. Rename `.env.test.local-sample` to `.env.test.local`.
2. Set `DATABASE_URL` with your PostgreSQL database address and credentials.
3. Execute `bundle install`.
4. Execute `rails db:migrate RAILS_ENV=test`.
5. Execute `rspec`.

## License
[GPLv3](https://github.com/willianveiga/n-list/blob/main/LICENSE)

## Credits
NList is brought you by [Willian Gustavo Veiga](https://github.com/willianveiga).
