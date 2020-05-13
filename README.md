---
title:  pankyll-pandoc/README.md
author: Christian Külker
date:   2020-05-13

---

# Abstract

This document describes briefly the aim and content for pankyll-pandoc. The
goal of pankyll-pandoc is to add functionality to pandoc by providing filters
templates and configuration that can be leveraged by pankyll.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-pandoc.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-pandoc.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-pandoc.svg)
![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-pandoc.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-pandoc.svg)

# Changes

| Version | Date       | Author           | Notes                             |
| ------- | ---------- | ---------------- | --------------------------------- |
| 0.1.1   | 2020-05-13 | Christian Külker | Fix TOC feature                   |
| 0.1.0   | 2020-03-22 | Christian Külker | Initial release                   |

# Introduction

The aim of **pankyll-pandoc** is to add features to **Pankyll** by providing
configuration, filters and templates to **Pandoc**. The `toc.markdown` template
filters out a table of content for a given Markdown file. The `pankyll.latex`
template is used to convert a Markdown page to a PDF. The word count feature is
realized via the **Pandoc** filter `word-count.lua` that calculates usually
more precise than self parsing of Markdown files. The `links-md-to-html.lua`
filter replaces inline Markdown links with links to HTML pages. And the
`replace_verbatim_with_lstlisting.lua` dispatches two different verbatim
environments. All filters need a newer **Pandoc** version to work with and have
bin tested with **Pandoc** v2.2.1.

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020 by Christian Kuelker

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 3, or (at your option) any later
    version.

    This program is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc., 59
    Temple Place, Suite 330, Boston, MA 02111-1307 USA

# DISCLAIMER OF WARRANTY

    THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE
    LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
    OTHER PARTIES PROVIDE THE PROGRAM “AS IS” WITHOUT WARRANTY OF ANY KIND,
    EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
    ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.
    SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY
    SERVICING, REPAIR OR CORRECTION.


# LIMITATION OF LIABILITY

    IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
    ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS THE
    PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
    GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
    USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
    DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
    PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
    EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
    SUCH DAMAGES.

