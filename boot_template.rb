git :init
git add:    "."
git commit: "-m 'Initial commit: Clean application'"

puts
say_status "Gemfile", "修改gem源为ruby.taobao.org", :yellow
puts        '-'*80, ''; sleep 0.25

gsub_file 'Gemfile', %r{^source .*}, <<-CODE
source 'https://ruby.taobao.org'
CODE

puts
say_status "Gemfile", "加入tm-framework模块", :yellow
puts        '-'*80, ''; sleep 0.25

inject_into_file 'Gemfile', after: %r{^source .*} do
  <<-CODE


if ENV['DEV'].to_s == '1'
  gem 'bootcat', path: '../tm-framework/bootcat'
  gem 'backend', path: '../tm-framework/backend'
  gem 'account', path: '../tm-framework/account'
  gem 'account-weixin', path: 'tm-framework/account-weixin'
  gem 'catalog', path: '../tm-framework/catalog'
  gem 'api', path: '../tm-framework/api'
else
  gem 'bootcat', git: 'git@gitlab.tanmer.com:tm-framework/bootcat.git'
  gem 'backend', git: 'git@gitlab.tanmer.com:tm-framework/backend.git'
  gem 'account', git: 'git@gitlab.tanmer.com:tm-framework/account.git'
  gem 'account-weixin', git: 'git@gitlab.tanmer.com:tm-framework/account-weixin.git'
  gem 'catalog', git: 'git@gitlab.tanmer.com:tm-framework/catalog.git'
  gem 'api', git: 'git@gitlab.tanmer.com:tm-framework/api.git'
end
  CODE
end

puts
say_status "Gemfile", "加入常用的Gem", :yellow
puts        '-'*80, ''; sleep 0.25

comment_lines 'Gemfile', /gem ["']rails["']/
# comment_lines 'Gemfile', /gem ["']spring["']/

gem 'i18n_yaml_generator', '0.0.2', github: 'xiaohui-zhangxh/i18n-yaml-generator'
gem 'breadcrumbs_on_rails'
# gem 'newrelic_rpm'
gem 'high_voltage', '~> 3.0.0'

gem 'pry', group: 'development'
gem 'capistrano', '3.5', group: 'development'
gem 'capistrano-rvm', group: 'development'
gem 'capistrano-rails', group: 'development'
gem 'capistrano-passenger', group: 'development'
# gem 'capistrano-sidekiq', group: 'development'

run "bundle install"

git add:    "."
git commit: "-m '加入必要的Gem'"  

puts
say_status "", "安装tm-framework模块", :yellow
puts        '-'*80, ''; sleep 0.25

run "rake bootcat:install"
run "rake account:install"
run "rake catalog:install:migrations"
run "rake account_weixin:install:migrations"

git add:    "."
git commit: "-m '加入tm-framework模块的安装文件'"  

puts
say_status  "Database", "添加初始数据...", :yellow
puts        '-'*80, ''; sleep 0.25

run 'rake db:create'
run 'rake db:migrate'

generate :controller, "Welcome index"

append_to_file "app/views/welcome/index.html.erb", %q{
  <% if user_signed_in? %>
    <%= link_to current_user.email, account.destroy_user_session_path, method: :delete %>
  <% else %>
    <%= link_to '用户登录', account.new_user_session_path %>
  <% end %>

  <%= link_to '管理', backend_engine.root_path %>
}

route %q{
  Backend::Engine.routes.draw do

    scope module: :admin do
      # require 'sidekiq/web'
      # mount Sidekiq::Web => '/sidekiq'
    end
  end
  Backend.mount_project Rails

  Rails.application.routes.draw do

    root to: 'welcome#index'

    mount Account::Engine => '/'
    mount Catalog::Engine => '/'
  end
}


remove_file "db/seeds.rb"
create_file 'db/seeds.rb', %q{

role_admin = Account::Role.create_with(name: '管理员').find_or_create_by!(key: Account::Role::ADMINISTRATOR)
role_user = Account::Role.create_with(name: '成员').find_or_create_by!(key: 'user')

users = [
  ['admin@tanmer.com', 'admin888', role_admin],
  ['user@tanmer.com', 'user888', role_user]
]

users.each do |u|
  user = Account::User.find_or_initialize_by(email: u[0])

  if user.new_record?
    user.password = u[1]
    user.save!
  end

  user.add_role! u[2].key

  puts "创建#{u[2].name}"
  puts "  用户名：#{u[0]}"
  puts "  密码： #{u[1]}"
end

}

run 'rake db:seed'
git add: '.'
git commit: "-m 'Added the database seeding script'"

run "rails s"