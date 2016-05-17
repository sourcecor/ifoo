# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin::Menu.create({id:10,                   caption:'會員管理',     action:'#',                             position:'side', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:11,   parent_id:10,   caption:'會員查詢',     action:'admin_user_finds_path',   seq:0,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:20,                   caption:'訂單管理',     action:'#',                             position:'side', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:21,   parent_id:20,   caption:'訂單查詢',     action:'admin_order_finds_path',  seq:0,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:30,                   caption:'商品管理',     action:'#',                             position:'side', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:31,   parent_id:30,   caption:'類別維護',     action:'admin_categories_path',   seq:0,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:32,   parent_id:30,   caption:'產品維護',     action:'admin_products_path',     seq:1,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:33,   parent_id:30,   caption:'庫存維護',     action:'admin_sub_products_path', seq:2,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:40,                   caption:'統計管理',     action:'#',                             position:'side', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:41,   parent_id:40,   caption:'會員入會統計', action:'admin_user_actives_path',  seq:0,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:42,   parent_id:40,   caption:'訂單統計',     action:'admin_order_actives_path',seq:1,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:43,   parent_id:40,   caption:'訂單狀況統計', action:'admin_order_stats_path',  seq:2,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:44,   parent_id:40,   caption:'出貨結案對帳', action:'admin_order_closes_path',  seq:3,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:50,                   caption:'權限管理',     action:'#',                             position:'side', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:51,   parent_id:50,   caption:'群組維護',     action:'admin_groups_path',       seq:0,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});
Admin::Menu.create({id:52,   parent_id:50,   caption:'選單維護',     action:'admin_menus_path',        seq:1,position:'item', created_at:'2016-03-10 12:00:00', updated_at:'2016-03-10 12:00:00'});

#Admin::Group.create({id:1,caption:'平台管理者',created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});

Admin::GroupMenu.create({group_id: 1, menu_id:10,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:11,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:20,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:21,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:30,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:31,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:32,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:33,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:40,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:41,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:42,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:43,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:44,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:50,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:51,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});
Admin::GroupMenu.create({group_id: 1, menu_id:52,created_at:'2016-03-10 12:00:00',updated_at:'2016-03-10 12:00:00'});

#Admin::User.create({id:1,email:'phileiny@gmail.com',encrypted_password:'$2a$10$rPBKWIF4ZRHVUoKPMhVXi.BswTnxg8C6eZhEXz763CJngn8bQBw3S',sign_in_count:0,created_at:'2016-03-20 12:00:00',updated_at:'2016-03-20 12:00:00',username:'張瑞涵'})
#Admin::GroupUser.create({group_id:1,user_id:1,created_at:'2016-03-20 12:00:00',updated_at:'2016-03-20 12:00:00'})
