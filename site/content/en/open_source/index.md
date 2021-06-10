---
title: Open source by Josep Egea
kind: open_source
canonical_identifier: '/open_source'
language: en
---

# Open Source

I love to create and contribute to Open Source projects.

These are some of them.

- [TkComponent](#tk_component)
- [TermuxRubyApi](#termux_ruby_api)
- [Patch for Scenic MySQL adapter](#scenic)
- [Patch for ActiveSupport::Duration](#duration)

In addition, you can find all my open source code in GitHub

<%= hang_left_icon('github') %>
<https://github.com/josepegea>


<a name="tk_component"></a>

## TkComponent

Ruby gems designed to help the creation of **Desktop GUI's in Ruby** using
Tk.

![GIF demo](https://i.ibb.co/bNmLGbc/tk-inspect-teaser.gif)

**TkComponent** provides a more modern and component-oriented layer to
create GUI's on top of regular Ruby Tk.

**TkInspect** builds on top of TkComponent to provide a visual
environment for Ruby code, similar to what Smalltalk provides.

**TkInspectRails** adds helpers to use TkInspect with Ruby on Rails
apps.
<%= hang_left_icon('github') %>
<https://github.com/josepegea/tk_component>
<br/>
<https://github.com/josepegea/tk_inspect>
<br/>
<https://github.com/josepegea/tk_inspect_rails>

<%= hang_left_icon('video') %>
**Talk about TkComponent**: <https://vimeo.com/506750901>

<a name="termux_ruby_api"></a>

## TermuxRubyApi

A Ruby Gem for interacting with Android API from within Termux.
<%= hang_left_icon('github') %>
<https://github.com/josepegea/termux_ruby_api>

<%= hang_left_icon('video') %>
**Talk about TermuxRubyApi**: <https://vimeo.com/482309000>

<a name="scenic"></a>

## Patch for Scenic MySql

`scenic` and `scenic-mysql_adapter` are gems that make it easier to
support SQL views with `ActiveRecord`.

With versions of Rails < 5.0, there was an error when generating an
`schema.rb` that caused views to be duplicated.

I created a patch and submitted a PR to fix the issue that was merged
into master.

<%= hang_left_icon('github') %>
**PR**: <https://github.com/EmpaticoOrg/scenic-mysql_adapter/pull/5>

<a name="duration"></a>

## Patch for ActiveSupport::Duration

When pretty-printing `ActiveSupport::Duration` objects out of
additions, the results are not normalized (i.e. "3 minutes and 70
seconds").

I created a patch to add a `normalize` method and submitted a PR to
the Rails repo, but it wasn't merged.

<%= hang_left_icon('github') %>
**PR**: <https://github.com/rails/rails/pull/35197>
