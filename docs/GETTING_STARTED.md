## How start up rails app in develop mode

```bash
git clone git@github.com:Yegorov/tiny-blog.git
cd tiny-blog
bundle install
yarn install

# create user and db in postgresql
bin/rails db:create db:migrate db:seed
# or if db exist
bin/rails db:drop db:create db:migrate db:seed


# start app
bin/rails s
```
