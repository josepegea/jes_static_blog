# Moving the code and the public site to GitHub and GitHub pages

## Create the repo in GitHub

Nothing weird here: create an empty repo named `jes_static_blog` in GitHub

## Add the GitHub remote

Using magit: Remote -> Add -> "gh" -> https://github.com/josepegea/jes_static_blog.git

## Push the code to GitHub

Using magit: Push -> Elsewhere -> `gh/master`

## Renaming the remotes

Using magit:

- Remote -> Rename -> `origin` -> `bitbucket`
- Remote -> Rename -> `gh` -> `origin`
- Push -> Push master to (after setting default) -> `origin`

## Use GitHub Pages for publishing

Follow the instructions here: https://nanoc.ws/doc/deploying/

To note:

- The docs have the output folder in `./public` while we have it in `./site/public`

```
wall-e:output jes$ git clone . site/output
Cloning into 'site/output'...
done.
wall-e:output jes$ cd site/output/
wall-e:output jes$ git checkout --orphan gh-pages
Switched to a new branch 'gh-pages'
wall-e:output jes$ ls
Gemfile		Gemfile.lock	howto_doc	site
wall-e:output jes$ git rm -rf .
rm '.gitignore'
rm 'Gemfile'
rm 'Gemfile.lock'
rm 'howto_doc/AutoCompileWithGuard.md'
rm 'howto_doc/DeployRailsPlayground.md'
rm 'howto_doc/StartingLocalServer.md'
rm 'site/Guardfile'
rm 'site/Rules'
rm 'site/art/jes_logo.jpg'
rm 'site/art/jes_logo_lila.jpg'
rm 'site/config/deploy.yml'
rm 'site/content/en/about/contact.md'
rm 'site/content/en/about/index.md'
rm 'site/content/en/about/tech_bio.md'
rm 'site/content/en/blog/20150612-new-life-new-site.md'
rm 'site/content/en/blog/index.html'
rm 'site/content/en/feed.xml'
rm 'site/content/en/index.html'
rm 'site/content/en/other/jes-cv-it.md'
rm 'site/content/es/about/contact.md'
rm 'site/content/es/about/index.md'
rm 'site/content/es/about/tech_bio.md'
rm 'site/content/es/blog/20150612-nueva-vida-nueva-web.md'
rm 'site/content/es/blog/index.html'
rm 'site/content/es/feed.xml'
rm 'site/content/es/index.html'
rm 'site/content/es/other/jes-cv-it.md'
rm 'site/content/htaccess.txt'
rm 'site/content/images/jes_logo-200.jpg'
rm 'site/content/images/jes_logo_lila-200.jpg'
rm 'site/content/images/mail_envel-120.png'
rm 'site/content/index.md'
rm 'site/content/sitemap.xml'
rm 'site/content/stylesheet.scss'
rm 'site/layouts/bare.html'
rm 'site/layouts/default.html'
rm 'site/layouts/partials/article_item.html'
rm 'site/layouts/partials/comments_snippet.html'
rm 'site/layouts/partials/piwik_track.html'
rm 'site/layouts/partials/subscribe_snippet.html'
rm 'site/lib/basic_translation.rb'
rm 'site/lib/default.rb'
rm 'site/lib/locale_manager.rb'
rm 'site/lib/site_config.rb'
rm 'site/locales/en.yml'
rm 'site/locales/es.yml'
rm 'site/nanoc.yaml'
wall-e:output jes$ git commit -m "Create gh-pages branch" --allow-empty
[gh-pages 2f0f2a9] Create gh-pages branch
wall-e:output jes$ git remote add origin https://github.com/josepegea/jes_static_blog.git
```

## First time build after the move

Note that:

- I had to update gem for `json` as version 1.8.2 had a conflict with modern versions of Ruby.

```
wall-e:site jes$ bundle exec nanoc
bundler: command not found: nanoc
Install missing gem executables with `bundle install`
wall-e:jes_static_blog jes$ bundle install
Fetching gem metadata from https://rubygems.org/..............
Installing json 1.8.2 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
wall-e:jes_static_blog jes$ bundle update json
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using i18n 0.7.0
Fetching json 1.8.6 (was 1.8.2)
Installing json 1.8.6 (was 1.8.2) with native extensions
...
wall-e:site jes$ bundle exec nanoc
Loading site data… done
Compiling site…
      create  [0.00s]  output/images/mail_envel-120.png
      create  [0.00s]  output/images/jes_logo_lila-200.jpg
      create  [0.00s]  output/images/jes_logo-200.jpg
      create  [0.01s]  output/.htaccess
      create  [0.17s]  output/stylesheet.css
      create  [0.07s]  output/index.html
/Users/jes/.rvm/gems/ruby-2.5.3/gems/builder-3.2.2/lib/builder/xchar.rb:111: warning: constant ::Fixnum is deprecated
      create  [0.01s]  output/sitemap.xml
      create  [0.01s]  output/es/index.html
      create  [0.04s]  output/es/other/jes-cv-it/index.html
      create  [0.02s]  output/es/about/tech_bio/index.html
      create  [0.02s]  output/es/about/contact/index.html
      create  [0.03s]  output/es/about/index.html
      create  [0.02s]  output/es/blog/index.html
      create  [0.03s]  output/es/blog/20150612-nueva-vida-nueva-web/index.html
      create  [0.01s]  output/en/index.html
      create  [0.04s]  output/en/other/jes-cv-it/index.html
      create  [0.02s]  output/en/about/tech_bio/index.html
      create  [0.02s]  output/en/about/contact/index.html
      create  [0.01s]  output/en/about/index.html
      create  [0.01s]  output/en/blog/index.html
      create  [0.02s]  output/en/blog/20150612-new-life-new-site/index.html
      create  [0.01s]  output/es/feed.xml
      create  [0.01s]  output/en/feed.xml

Site compiled in 0.87s.
wall-e:site jes$ open output/index.html
wall-e:site jes$ nanoc view
[2019-11-09 12:17:43] INFO  WEBrick 1.4.2
[2019-11-09 12:17:43] INFO  ruby 2.5.3 (2018-10-18) [x86_64-darwin18]
[2019-11-09 12:17:43] INFO  WEBrick::HTTPServer#start: pid=27592 port=3000
127.0.0.1 - - [09/Nov/2019:12:17:58 +0100] "GET / HTTP/1.1" 200 1075 0.0010
127.0.0.1 - - [09/Nov/2019:12:17:58 CET] "GET / HTTP/1.1" 200 1075
```

## Configure for deploy

Edit `nanoc.yml` config to add

```
deploy:
  default:
    kind: git
    branch: gh-pages
```

## Upgrading to Nanoc 4

It seems that `deploy kind:git` is not available in Nanoc v3

So we need to upgrade to Nanoc 4

Following instructions here: https://nanoc.ws/doc/nanoc-4-upgrade-guide/

- Update nanoc version in Gemfile `gem 'nanoc', '~> 4.0'`
- Delete Gemfile.lock

Run `bundle install`

```
wall-e:jes_static_blog jes$ bundle install
Fetching gem metadata from https://rubygems.org/.............
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies...
Using concurrent-ruby 1.1.5
Fetching i18n 1.7.0
Installing i18n 1.7.0
Fetching minitest 5.13.0
Installing minitest 5.13.0
Using thread_safe 0.3.6
Using tzinfo 1.2.5
Fetching zeitwerk 2.2.1
Installing zeitwerk 2.2.1
Fetching activesupport 6.0.1
Installing activesupport 6.0.1
Fetching public_suffix 4.0.1
Installing public_suffix 4.0.1
Fetching addressable 2.7.0
Installing addressable 2.7.0
Using rack 2.0.7
Fetching adsf 1.4.2
Installing adsf 1.4.2
Using execjs 2.7.0
Fetching autoprefixer-rails 9.7.1
Installing autoprefixer-rails 9.7.1
Fetching ffi 1.11.1
Installing ffi 1.11.1 with native extensions
Fetching sassc 2.2.1
Installing sassc 2.2.1 with native extensions
Fetching bootstrap-sass 3.4.1
Installing bootstrap-sass 3.4.1
Using builder 3.2.3
Using bundler 1.16.6
Fetching chunky_png 1.3.11
Installing chunky_png 1.3.11
Using coderay 1.1.2
Using colored 1.2
Fetching multi_json 1.14.1
Installing multi_json 1.14.1
Fetching sass 3.4.25
Installing sass 3.4.25
Using compass-core 1.0.3
Using compass-import-once 1.0.5
Using rb-fsevent 0.10.3
Using rb-inotify 0.10.0
Using compass 1.0.3
Using cri 2.15.9
Fetching ddmetrics 1.0.1
Installing ddmetrics 1.0.1
Fetching ref 2.0.0
Installing ref 2.0.0
Fetching ddmemoize 1.0.0
Installing ddmemoize 1.0.0
Fetching ddplugin 1.0.2
Installing ddplugin 1.0.2
Using diff-lcs 1.3
Fetching equatable 0.6.1
Installing equatable 0.6.1
Using formatador 0.2.5
Fetching listen 3.2.0
Installing listen 3.2.0
Fetching lumberjack 1.0.13
Installing lumberjack 1.0.13
Fetching nenv 0.3.0
Installing nenv 0.3.0
Using shellany 0.0.1
Fetching notiffany 0.1.3
Installing notiffany 0.1.3
Using method_source 0.9.2
Using pry 0.12.2
Using thor 0.20.3
Fetching guard 2.16.1
Installing guard 2.16.1
Fetching guard-compat 1.2.1
Installing guard-compat 1.2.1
Fetching hamster 3.0.0
Installing hamster 3.0.0
Fetching json_schema 0.20.8
Installing json_schema 0.20.8
Fetching slow_enumerator_tools 1.1.0
Installing slow_enumerator_tools 1.1.0
Fetching tomlrb 1.2.8
Installing tomlrb 1.2.8
Fetching tty-platform 0.2.1
Installing tty-platform 0.2.1
Fetching nanoc-core 4.11.13
Installing nanoc-core 4.11.13
Fetching nanoc-cli 4.11.13
Installing nanoc-cli 4.11.13
Fetching parallel 1.18.0
Installing parallel 1.18.0
Fetching tty-color 0.5.0
Installing tty-color 0.5.0
Fetching pastel 0.7.3
Installing pastel 0.7.3
Fetching tty-command 0.9.0
Installing tty-command 0.9.0
Fetching tty-which 0.4.1
Installing tty-which 0.4.1
Fetching nanoc 4.11.13
Installing nanoc 4.11.13
Fetching guard-nanoc 2.1.6
Installing guard-nanoc 2.1.6
Fetching kramdown 2.1.0
Installing kramdown 2.1.0
Fetching rb-readline 0.5.5
Installing rb-readline 0.5.5
Bundle complete! 9 Gemfile dependencies, 62 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
Post-install message from i18n:

HEADS UP! i18n 1.1 changed fallbacks to exclude default locale.
But that may break your application.

Please check your Rails app for 'config.i18n.fallbacks = true'.
If you're using I18n (>= 1.1.0) and Rails (< 5.2.2), this should be
'config.i18n.fallbacks = [I18n.default_locale]'.
If not, fallbacks will be broken in your app by I18n 1.1.x.

For more info see:
https://github.com/svenfuchs/i18n/releases/tag/v1.1.0
```

- Fix configuration, according to instructions

```diff
site/nanoc.yml
@@ -29,6 +29,9 @@ prune:
   # .git, .svn etc.
   exclude: [ '.git', '.hg', '.svn', 'CVS' ]
 
+# Migrating from nanoc v4 to v4
+string_pattern_type: legacy
+
 # The data sources where nanoc loads its data from. This is an array of
 # hashes; each array element represents a single data source. By default,
 # there is only a single data source that reads data from the “content/” and
@@ -38,6 +41,7 @@ data_sources:
     # The type is the identifier of the data source. By default, this will be
     # `filesystem_unified`.
     type: filesystem_unified
+    identifier_type: legacy
 
     # The path where items should be mounted (comparable to mount points in
     # Unix-like systems). This is “/” by default, meaning that items will have
```

- And add a couple of fixes to the code

```diff
site/lib/basic_translation.rb
@@ -4,7 +4,7 @@
 
 def language_code_of(item)
   # "/en/foo/" becomes "en"
-  (item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
+  (item.identifier.to_s.match(/^\/([a-z]{2})\//) || [])[1]
 end
 
 def translations_of(item)
@@ -55,7 +55,7 @@ end
 def localized_layout(ident, lang)
   # First, we look for the localized layout
   name = File.join('/', lang, ident, '/')
-  if @site.layouts.find {|l| l.identifier == name}
+  if @layouts.find {|l| l.identifier == name}
     return name
   else
     # No point in checking if the non-localized exists.
```

After that, running `bundle exec nanoc builds` works again.

### Adding pry to Gemfile

In order to debug the issues, I added `pry` to the Gemfile, in a special group.

To use it, you have to first run `bundle install --with-debug`

And add `require 'pry'` to any file where you want to use `binding pry`

