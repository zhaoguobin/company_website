# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({:login => 'demo', :name => 'demo', :password => '123123', :password_confirmation => '123123'})

Category.create([
  {:name => '企业简介', :item_type_id => 0},
  {:name => '产品展示', :item_type_id => 2},
  {:name => '业界新闻', :item_type_id => 1},
  {:name => '联系我们', :item_type_id => 0},
  {:name => '合作伙伴', :item_type_id => 0},
])
