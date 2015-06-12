# Auto compiling the site

## How to compile the site

	frozone:jes_static_blog jes$ cd site
	frozone:site jes$ nanoc
	Loading site data… done
	Compiling site…

	Site compiled in 0.09s.
	frozone:site jes$ cd ..
	
	
## Autocompiling the site when something changes

See https://github.com/guard/guard-nanoc

### First time setup

Make sure that Gemfile includes the guard gems

	gem 'guard-nanoc'
	gem 'rb-readline'

And, of course, execute `bundle install`

Last, create the Guard file

	frozone:site jes$ bundle exec guard init nanoc
	11:01:50 - INFO - Writing new Guardfile to /Users/jes/Content/jes_static_blog/site/Guardfile
	11:01:50 - INFO - nanoc guard added to Guardfile, feel free to edit it
	frozone:site jes$ 
	
### Activating guard for the session

	frozone:site jes$ bundle exec guard

	11:02:24 - INFO - Compilation succeeded.
	11:02:24 - INFO - Guard is now watching at '/Users/jes/Content/jes_static_blog/site'
	[1] guard(main)> 
	
From there on, whenever a change is detected in one of the source files, a site compilation is triggered.

	
	

