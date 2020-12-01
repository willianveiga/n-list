# NList 📝📝📝📝📝
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

1. Rename `.env.development.local-sample` to `.env.development.local`.
2. Set `DATABASE_URL` with your PostgreSQL database address and credentials.
3. Access [Google Developers Console](https://console.developers.google.com) and create a new project.
4. Create a new [OAuth Credential](https://console.developers.google.com/apis/credentials) and configure `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET`.
5. Execute `bundle install`.
6. Execute `rails db:migrate`.
7. Execute `rails server`.
8. Access `http://localhost:3000`.

## Testing
NList has an acceptance test suite. To run the tests execute the following steps:

1. Rename `.env.test.local-sample` to `.env.test.local`.
2. Set `DATABASE_URL` with your PostgreSQL database address and credentials.
3. Execute `bundle install`.
4. Execute `rails db:migrate RAILS_ENV=test`.
5. Execute `rspec`.

## License
[GPLv3](https://github.com/willianveiga/n-list/blob/main/LICENSE)

## Credits
NList is brought you by [Willian Gustavo Veiga](https://github.com/willianveiga).
