# First deployment to RailsPlayground

jes - 23/june/2015

Ok, after wrestling with Nanoc, CSS, Mailchimp, Piwik, Atom and more, we've managed to publish the site to RPG. Bravo!

Details follow...

## Push the code to Bitbucket

After creating a Bitbucket repository, we've pushed the code there:

	frozone:jes_static_blog jes$ git remote add origin https://josep_egea@bitbucket.org/josep_egea/jes_static_blog.git
	frozone:jes_static_blog jes$ git push -u origin --all
	Password for 'https://josep_egea@bitbucket.org': 
	Counting objects: 356, done.
	Delta compression using up to 2 threads.
	Compressing objects: 100% (341/341), done.
	Writing objects: 100% (356/356), 3.84 MiB | 101.00 KiB/s, done.
	Total 356 (delta 163), reused 0 (delta 0)
	To https://josep_egea@bitbucket.org/josep_egea/jes_static_blog.git
	 * [new branch]      master -> master
	Branch master set up to track remote branch master from origin.
	frozone:jes_static_blog jes$ 
	
## Get the code in RPG

Now, we've got to get the site in RPG's server

	frozone:~ jes$ ssh josepege@josepegea.com
	Last login: Sat Jun 20 14:16:55 2015 from 87.218.231.222
	josepege@josepegea.com [~]# ls
	./             .cpanel/    .htpasswds/     .spamassassinboxenable  data/       public_ftp/
	../            .cphorde/   .lastlogin      .spamassassinenable     etc/        public_html@
	.bash_history  .dns        .my.cnf         .ssh/                   ext_src/    public_html_orig/
	.bash_logout   .ftpquota   .passenger/     .subversion/            first_app@  softaculous_backups/
	.bash_profile  .gem/       .psql_history   .trash/                 logs/       src/
	.bashrc        .gemrc      .razor/         .viminfo                mail/       tmp/
	.composer/     .gitconfig  .softaculous/   access-logs@            perl5/      www@
	.contactemail  .gnome2/    .spamassassin/  bin/                    php_sites/
	josepege@josepegea.com [~]# cd src
	josepege@josepegea.com [~/src]# ls
	./  ../  copias/  first_app/  yayarap/
	josepege@josepegea.com [~/src]# git clone https://josep_egea@bitbucket.org/josep_egea/jes_static_blog.git
	Cloning into 'jes_static_blog'...
	Password for 'https://josep_egea@bitbucket.org': 
	remote: Counting objects: 387, done.
	remote: Compressing objects: 100% (209/209), done.
	remote: Total 387 (delta 183), reused 342 (delta 163)
	Receiving objects: 100% (387/387), 3.84 MiB | 1.99 MiB/s, done.
	Resolving deltas: 100% (183/183), done.
	josepege@josepegea.com [~/src]# ls
	./  ../  copias/  first_app/  jes_static_blog/  yayarap/

## Install the Gems

Now, there's a problem here. RVM is not available in RPG, so when we make "bundle install" it tries to install some gems to the root dirs, something we don't have permissions to.

The diagnostic is as follows:

	josepege@josepegea.com [~/src]# cd jes_static_blog/
	josepege@josepegea.com [~/src/jes_static_blog]# bundle install
	Fetching gem metadata from https://rubygems.org/.........
	Fetching additional metadata from https://rubygems.org/..
	Using i18n (0.7.0)
	Using json (1.8.2)
	sudo: unable to mkdir /var/db/sudo/josepege: Read-only file system

	We trust you have received the usual lecture from the local System
	Administrator. It usually boils down to these three things:

	    #1) Respect the privacy of others.
	    #2) Think before you type.
	    #3) With great power comes great responsibility.



	Your user account isn't allowed to install to the system Rubygems.
	You can cancel this installation and run:

	    bundle install --path vendor/bundle

	to install the gems into ./vendor/bundle/, or you can enter your password
	and install the bundled gems to Rubygems using sudo.

	Password: 

	SystemExit: exit
	An error occurred while installing minitest (5.6.1), and Bundler cannot continue.
	Make sure that `gem install minitest -v '5.6.1'` succeeds before bundling.


As it shows, it automatically tries to run 'sudo'. As a plan B, it offers to install with the option `bundle install --path vendor/bundle` which copies everything in the vendor folder.

Let's do it (although it's not the endo of the story)

	josepege@josepegea.com [~/src/jes_static_blog]# bundle install --path vendor/bundle
	Fetching gem metadata from https://rubygems.org/.........
	Fetching additional metadata from https://rubygems.org/..
	Installing i18n (0.7.0)
	Installing json (1.8.2)
	Installing minitest (5.6.1)
	Installing thread_safe (0.3.5)
	Installing tzinfo (1.2.2)
	Installing activesupport (4.2.1)
	Installing rack (1.6.1)
	Installing adsf (1.2.0)
	Installing execjs (2.5.2)
	Installing autoprefixer-rails (5.1.11)
	Installing sass (3.4.13)
	Installing bootstrap-sass (3.3.4.1)
	Installing builder (3.2.2)
	Installing hitimes (1.2.2)
	Installing timers (4.0.1)
	Installing celluloid (0.16.0)
	Installing chunky_png (1.3.4)
	Installing coderay (1.1.0)
	Installing colored (1.2)
	Installing multi_json (1.11.0)
	Installing compass-core (1.0.3)
	Installing compass-import-once (1.0.5)
	Installing rb-fsevent (0.9.4)
	Installing ffi (1.9.8)
	Installing rb-inotify (0.9.5)
	Installing compass (1.0.3)
	Installing cri (2.7.0)
	Installing formatador (0.2.5)
	Installing listen (2.10.0)
	Installing lumberjack (1.0.9)
	Installing nenv (0.2.0)
	Installing shellany (0.0.1)
	Installing notiffany (0.0.6)
	Installing method_source (0.8.2)
	Installing slop (3.6.0)
	Installing pry (0.10.1)
	Installing thor (0.19.1)
	Installing guard (2.12.5)
	Installing nanoc (3.8.0)
	Installing guard-nanoc (1.0.3)
	Installing kramdown (1.7.0)
	Installing rb-readline (0.5.2)
	Using bundler (1.5.0)
	Your bundle is complete!
	It was installed into ./vendor/bundle
	Post-install message from compass:
	    Compass is charityware. If you love it, please donate on our behalf at http://umdf.org/compass Thanks!
	josepege@josepegea.com [~/src/jes_static_blog]# ls
	./  ../  .bundle/  .git/  .gitignore  Gemfile  Gemfile.lock  howto_doc/  site/  vendor/

Now, vendor/ contains all the gems.

The problem comes from the fact that Ruby executables (nanoc, sass, etc) live in that folder, too, which is not in our path, so we won't be able to reach them when building the site.

Checking up Bundler docs, we find a better option (`--binstubs`) that creates a handy bin folder with all the ruby executables for the installed gems.

	josepege@josepegea.com [~/src/jes_static_blog]# bundle install --path vendor/bundle --binstubs
	Using i18n (0.7.0)
	Using json (1.8.2)
	Using minitest (5.6.1)
	Using thread_safe (0.3.5)
	Using tzinfo (1.2.2)
	Using activesupport (4.2.1)
	Using rack (1.6.1)
	Using adsf (1.2.0)
	Using execjs (2.5.2)
	Using autoprefixer-rails (5.1.11)
	Using sass (3.4.13)
	Using bootstrap-sass (3.3.4.1)
	Using builder (3.2.2)
	Using hitimes (1.2.2)
	Using timers (4.0.1)
	Using celluloid (0.16.0)
	Using chunky_png (1.3.4)
	Using coderay (1.1.0)
	Using colored (1.2)
	Using multi_json (1.11.0)
	Using compass-core (1.0.3)
	Using compass-import-once (1.0.5)
	Using rb-fsevent (0.9.4)
	Using ffi (1.9.8)
	Using rb-inotify (0.9.5)
	Using compass (1.0.3)
	Using cri (2.7.0)
	Using formatador (0.2.5)
	Using listen (2.10.0)
	Using lumberjack (1.0.9)
	Using nenv (0.2.0)
	Using shellany (0.0.1)
	Using notiffany (0.0.6)
	Using method_source (0.8.2)
	Using slop (3.6.0)
	Using pry (0.10.1)
	Using thor (0.19.1)
	Using guard (2.12.5)
	Using nanoc (3.8.0)
	Using guard-nanoc (1.0.3)
	Using kramdown (1.7.0)
	Using rb-readline (0.5.2)
	Using bundler (1.5.0)
	Your bundle is complete!
	It was installed into ./vendor/bundle
	josepege@josepegea.com [~/src/jes_static_blog]# ls
	./  ../  .bundle/  .git/  .gitignore  Gemfile  Gemfile.lock  bin/  howto_doc/  site/  vendor/
	josepege@josepegea.com [~/src/jes_static_blog]# 


Now, we can enter `site` and execute `../bin/nanoc` and it works

	josepege@josepegea.com [~/src/jes_static_blog]# cd site
	josepege@josepegea.com [~/src/jes_static_blog/site]# ../bin/nanoc
	Loading site data… done
	Compiling site…
	      create  [0.08s]  output/es/about/index.html
	      create  [0.01s]  output/es/about/contact/index.html
	      create  [0.01s]  output/es/about/tech_bio/index.html
	      create  [0.01s]  output/es/blog/index.html
	      create  [0.02s]  output/es/blog/20150612-nueva-vida-nueva-web/index.html
	      create  [0.01s]  output/es/index.html
	      create  [0.01s]  output/index.html
	      create  [0.22s]  output/stylesheet.css
	      create  [0.00s]  output/images/jes_logo-200.jpg
	      create  [0.00s]  output/images/mail_envel-120.png
	      create  [0.00s]  output/images/jes_logo_lila-200.jpg
	      create  [0.02s]  output/en/about/index.html
	      create  [0.01s]  output/en/about/contact/index.html
	      create  [0.02s]  output/en/about/tech_bio/index.html
	      create  [0.02s]  output/en/blog/20150612-new-life-new-site/index.html
	      create  [0.01s]  output/en/blog/index.html
	      create  [0.01s]  output/en/index.html
	      create  [0.00s]  output/sitemap.xml
	      create  [0.01s]  output/es/feed.xml
	      create  [0.00s]  output/en/feed.xml

	Site compiled in 0.73s.
	josepege@josepegea.com [~/src/jes_static_blog/site]# 
	
Great! Now the site is ready in the `output` folder.

**Note**: When we first did that, the build failed because the file `basic_translation.rb` didn't have the UTF8 encoding header. After adding it, pushing the changes to Bitbucket and pulling them from there, it worked.

## Connect the public site

Now we only have to make sure that Apache finds the site when asked for `josepegea.com`. The default site lives in 'public_html' in the home folder, so we just link from there to the `output` folder.

	josepege@josepegea.com [~]#ln -s src/jes_static_blog/site/output public_html
	josepege@josepegea.com [~]#ls -l
	total 188
	drwx--x--x 29 josepege josepege  4096 Jun 23 16:08 ./
	drwxr-xr-x  3 root     root      4096 May 15 16:49 ../
	-rw-------  1 josepege josepege 16147 Jun 20 15:31 .bash_history
	-rw-r--r--  1 josepege josepege    18 Feb 22  2013 .bash_logout
	-rw-r--r--  1 josepege josepege   176 Feb 22  2013 .bash_profile
	-rw-r--r--  1 josepege josepege   124 Feb 22  2013 .bashrc
	drwxrwxr-x  3 josepege josepege  4096 Jun 23 15:51 .bundler/
	drwxrwxr-x  3 josepege josepege  4096 Mar 12 14:18 .composer/
	-rw-------  1 josepege josepege    28 May  5  2013 .contactemail
	drwx------  5 josepege josepege  4096 Jun 20 14:32 .cpanel/
	drwx------  4 josepege josepege  4096 Jun 18 02:30 .cphorde/
	-rw-rw-r--  1 josepege josepege    13 Jun 23 15:48 .dns
	-rw-------  1 josepege josepege    17 Jun 23 02:26 .ftpquota
	drwxrwxr-x  4 josepege josepege  4096 Jul  9  2013 .gem/
	-rw-r--r--  1 josepege josepege   126 May  5  2013 .gemrc
	-rw-rw-r--  1 josepege josepege    53 May 25  2013 .gitconfig
	drwx------  2 josepege josepege  4096 Aug 11  2013 .gnome2/
	drwxr-x---  2 josepege nobody    4096 May  5  2013 .htpasswds/
	-rw-------  1 josepege josepege    14 Jun 20 13:32 .lastlogin
	-rw-------  1 josepege josepege    63 Jul 22  2014 .my.cnf
	drwxr-xr-x  3 josepege josepege  4096 Oct 30  2014 .passenger/
	-rw-------  1 josepege josepege  6387 Mar 12 15:22 .psql_history
	drwxr-xr-x  2 josepege josepege  4096 Feb 20 18:45 .razor/
	drwx--x--x  5 josepege josepege  4096 Aug 12  2013 .softaculous/
	drwx------  2 josepege josepege  4096 Jun 23 14:15 .spamassassin/
	-rw-r--r--  1 josepege josepege     0 Aug  7  2014 .spamassassinboxenable
	-rw-r--r--  1 josepege josepege     0 Aug  7  2014 .spamassassinenable
	drwx------  2 josepege josepege  4096 May 22  2013 .ssh/
	drwxrwxr-x  3 josepege josepege  4096 Jun 23  2013 .subversion/
	drwx------  2 josepege josepege  4096 Jul 11  2013 .trash/
	-rw-------  1 josepege josepege  8022 Apr 21 20:04 .viminfo
	lrwxrwxrwx  1 josepege josepege    34 May  5  2013 access-logs -> /usr/local/apache/domlogs/josepege/
	drwxrwxr-x  2 josepege josepege  4096 May 25  2013 bin/
	drwxrwxr-x  7 josepege josepege  4096 Apr 28 13:00 data/
	drwxr-x---  4 josepege mail      4096 Aug 11  2013 etc/
	drwxrwxr-x  5 josepege josepege  4096 Apr 28 12:28 ext_src/
	lrwxrwxrwx  1 josepege josepege    13 May  8  2013 first_app -> src/first_app/
	drwx------  2 josepege josepege  4096 Jun 20 16:17 logs/
	drwxr-x--x 11 josepege josepege  4096 Jan 26 11:48 mail/
	drwxrwxr-x  2 josepege josepege  4096 May  6  2013 perl5/
	drwxrwxr-x  6 josepege josepege  4096 Jun 20 13:40 php_sites/
	drwxr-xr-x  3 josepege josepege  4096 May  5  2013 public_ftp/
	lrwxrwxrwx  1 josepege josepege    31 Jun 23 16:08 public_html -> src/jes_static_blog/site/output/
	drwxr-x---  3 josepege nobody    4096 May  5  2013 public_html_orig/
	drwx--x--x  3 josepege josepege  4096 May 15 16:49 softaculous_backups/
	drwxrwxr-x  6 josepege josepege  4096 Jun 23 15:50 src/
	drwxr-xr-x  9 josepege josepege  4096 Mar 12 14:57 tmp/
	lrwxrwxrwx  1 josepege josepege    11 May  5  2013 www -> public_html/

## And it works!

Now, loading http://www.josepegea.com works, loading our new site!

## Turn stats on

But we must not forget that Piwik stats are turned off during development, and the code we just pulled hasn't been changed.

We need to turn them on:

	josepege@josepegea.com [~]# cd src        
	josepege@josepegea.com [~/src]# cd jes_static_blog/site/
	josepege@josepegea.com [~/src/jes_static_blog/site]# cd config/
	josepege@josepegea.com [~/src/jes_static_blog/site/config]# ls
	./  ../  deploy.yml
	josepege@josepegea.com [~/src/jes_static_blog/site/config]# vi deploy.yml 
	
		track_stats: true	# This enables stats
		piwik_site: '2'
	
	josepege@josepegea.com [~/src/jes_static_blog/site/config]# cd ..
	josepege@josepegea.com [~/src/jes_static_blog/site]# rm -rf output 
	josepege@josepegea.com [~/src/jes_static_blog/site]# ../bin/nanoc
	Loading site data… done
	Compiling site…
	      create  [0.07s]  output/es/about/index.html
	      create  [0.01s]  output/es/about/contact/index.html
	      create  [0.01s]  output/es/about/tech_bio/index.html
	      create  [0.01s]  output/es/blog/index.html
	      create  [0.02s]  output/es/blog/20150612-nueva-vida-nueva-web/index.html
	      create  [0.01s]  output/es/index.html
	      create  [0.01s]  output/index.html
	      create  [0.16s]  output/stylesheet.css
	      create  [0.00s]  output/images/jes_logo-200.jpg
	      create  [0.00s]  output/images/mail_envel-120.png
	      create  [0.00s]  output/images/jes_logo_lila-200.jpg
	      create  [0.02s]  output/en/about/index.html
	      create  [0.01s]  output/en/about/contact/index.html
	      create  [0.01s]  output/en/about/tech_bio/index.html
	      create  [0.02s]  output/en/blog/20150612-new-life-new-site/index.html
	      create  [0.01s]  output/en/blog/index.html
	      create  [0.01s]  output/en/index.html
	      create  [0.00s]  output/sitemap.xml
	      create  [0.01s]  output/es/feed.xml
	      create  [0.00s]  output/en/feed.xml

	Site compiled in 0.68s.
	josepege@josepegea.com [~/src/jes_static_blog/site]# 

Fine! Now our site has everything!

Let it be the starting of a new, bright time!! :-)

