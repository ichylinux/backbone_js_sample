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
end

もし /^トップページにアクセス$/ do
  assert_visit '/'
end
