
### Setup
`git clone https://github.com/cheljoh/rails_engine.git`

`cd rails_engine`

`bundle`

`rake db:{drop,create,migrate}`

Import data from CSV into database by running: `rake import:data`. This may take a while!

Run `rspec` to make sure all tests are passing

### Usage

Start server by running command `rails s`

Many API endpoints are exposed to access various data. For example:
`GET /api/v1/merchants.json` returns all merchants in the database.
For more information and a list of all endpoints, please refer to the spec: https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md 
