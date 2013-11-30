# coding: UTF-8

もし /^アプリを新規作成$/ do
  puts <<-EOF
<pre>
<b>
$ dad new backbone_js_sample
$ cd backbone_js_sample
$ rails g controller welcome --no-assets --no-helper
$ rm public/index.html
</b>
</pre>
  EOF
end

もし /^トップページを作成$/ do
  show 'app/views/welcome/index.html.erb', :as => 'new'
end

もし /^ルーティングを修正$/ do
  git_diff 'config/routes.rb', :between => 'ffaee8d12d6d70d8a2f3a8d56673efbc8f3a6dfa', :and => '994d0e34b2c69403be4c354f2952a2684a9d990f'
end

もし /^backbone.js をプロジェクトに配置$/ do
  puts <<-EOF
<pre>
<b>
$ wget http://backbonejs.org/backbone.js -O vendor/assets/javascripts/backbone.js
$ wget http://underscorejs.org/underscore.js -O vendor/assets/javascripts/underscore.js
</b>
</pre>
  EOF
  
  git_diff 'app/assets/javascripts/application.js', :and => '994d0e34b2c69403be4c354f2952a2684a9d990f'
end

もし /^トップページにアクセス$/ do
  assert_visit '/'
end

もし /^オブジェクトがイベントを発行できるように拡張$/ do
  git_diff 'app/views/welcome/event.html.erb', :as => 'new', :between => '5edda525b15aaa43e99de0433b0eb658d0cf67c9', :and => 'e1f5c952993b84c1a02f8b891a5380d4be70c6a6'
end

もし /^オブジェクトにイベントを定義$/ do
  git_diff 'app/views/welcome/event.html.erb', :as => 'edit', :between => '1bc850515fcb7885d2cd3d6cf3136ed8f5dc15ed', :and => '5edda525b15aaa43e99de0433b0eb658d0cf67c9'
end

もし /^イベントを発行する関数を作成$/ do
  git_diff 'app/views/welcome/event.html.erb', :as => 'edit', :between => '3bc0ad8c1c03fbff1cfc30a167a8e5f8d9189dca', :and => '1bc850515fcb7885d2cd3d6cf3136ed8f5dc15ed'
end

もし /^HTMLを用意$/ do
  git_diff 'app/views/welcome/event.html.erb', :as => 'edit', :between => '61219307b74b1d6beb9a7266f17cee30e1406fb8', :and => '3bc0ad8c1c03fbff1cfc30a167a8e5f8d9189dca'
end

もし /^画面を表示$/ do
  assert_visit '/', :page => 'event'
end

もし /^挨拶が表示される$/ do
  assert_url '/', :page => 'event'
end
