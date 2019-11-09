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

