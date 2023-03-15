---
title: pankyll-pandoc README
author: Christian Külker
date: 2023-03-15
version: 0.1.3

---

# Abstract

This document briefly describes the aim and contents of **pankyll-pandoc**.
The goal of **pankyll-pandoc** is to add functionality to [pankyll] by
providing [Lua] filters, [LaTeX] and [Markdown] templates for [pandoc] and
configuration that can be used by [pankyll] to create e.g. PDFs or to count the
words of a Markdown document.

As you can see below, running [pandoc] can involve a plethora of command line
options. Even though parts of this repository are designed for and can be used
without [pankyll], like the LaTeX template, once _pankyll_ is set up, it is
usually more convenient to use _pankyll_ to generate PDFs.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-pandoc.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-pandoc.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-pandoc.svg)

![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-pandoc.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-pandoc.svg)

# Introduction

The goal of **pankyll-pandoc** is to add functionality to **Pankyll** by
providing configuration, filters and templates to **Pandoc**. The template
`toc.markdown` filters a table of contents for a given markdown file. The
`pankyll.latex` template is used to convert a Markdown page into a PDF. The
word count function is implemented by the **Pandoc** filter `word-count.lua`,
which is usually more accurate than the self parsing of Markdown files. The
`links-md-to-html.lua` filter replaces inline Markdown links with links to HTML
pages. And the `replace_verbatim_with_lstlisting.lua` dispatches two different
verbatim environments. All filters require a newer Pandoc version to work and
have been successfully tested with **Pandoc** `v2.2.1` and `v2.10.1` and
**texlive** 2017, 2020 and 2022. Pandoc `v2.18` seem not to work.

# Usage

## Filters

```bash
pandoc -t html5 -o out.html --lua-filter=links-md-to-html.lua in.md
pandoc -o out.pdf --lua-filter=replace_verbatim_with_lstlisting.lua in md
pandoc -t gfm --lua-filter=word-count.lua in.md
```

## Templates

This command creates the file `README.pdf` from the [Markdown] source
`README.md` using 2 filters and the `pankyll-pandoc` template.

```bash
pandoc -f 'markdown+implicit_header_references+blank_before_blockquote\
+fenced_code_blocks+backtick_code_blocks+fenced_code_attributes\
+line_blocks+definition_lists+simple_tables+table_captions\
+multiline_tables+pipe_tables+yaml_metadata_block+strikeout+superscript\
+subscript+shortcut_reference_links+implicit_figures+link_attributes\
+footnotes+inline_notes+emoji+autolink_bare_uris' --verbose --toc \
--number-sections --from 'markdown+implicit_header_references\
+blank_before_blockquote+fenced_code_blocks+backtick_code_blocks\
+fenced_code_attributes+line_blocks+definition_lists+simple_tables\
+table_captions+multiline_tables+pipe_tables+yaml_metadata_block\
+strikeout+superscript+subscript+shortcut_reference_links\
+implicit_figures+link_attributes+footnotes+inline_notes+emoji\
+autolink_bare_uris' --to latex --standalone --highlight-style zenburn \
-V 'lang:en-US' -V 'papersize=a4' -V 'fontsize=12pt' \
-V 'documentclass=article' -V 'mainfont=Noto Sans CJK JP' \
-V 'sansfont=Noto Sans CJK JP' -V 'monofont=WenQuanYi Micro Hei Mono' \
-V 'monofontoptions=BoldFont={Noto Sans Mono CJK JP Bold}' \
-V 'linkcolor=Violet' -V 'citecolor=Green' -V 'urlcolor=MidnightBlue' \
-V 'toccolor=Gray' -V 'pagestyle=headings' \
--template=templates/pankyll.latex --pdf-engine=xelatex \
--fail-if-warnings \
--lua-filter=filters/replace_verbatim_with_lstlisting.lua \
--lua-filter=filters/links-md-to-html.lua -o README.pdf README.md
```

For some reason the long list of backslashes (\\) does not work, remove them
and run this command in one line or use the Makefile via `rm README.pdf;make
README.pdf` It was tested with [pandoc] 2.10.1 and [texlive] 2017, 2020 and
2022.

# Known Bugs

## Pandoc v2.18

Pandoc v2.18 will fail with the `lua` error:

~~~
Error running filter filters/replace_verbatim_with_lstlisting.lua:
filters/replace_verbatim_with_lstlisting.lua:25: attempt to index a nil \
value (field 'c')
~~~


# History

| Version | Date       | Notes                                                |
| ------- | ---------- | ---------------------------------------------------- |
| 0.1.3   | 2023-03-15 | Improve writing, mv History, Copyright year, Bugs    |
| 0.1.2   | 2022-05-30 | History, -changes, introduction, rm dupl. license,   |
|         |            | +usage sec., +PDF, links, +Makefile                  |
| 0.1.1   | 2020-05-13 | Fix TOC feature                                      |
| 0.1.0   | 2020-03-22 | Initial release                                      |

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020, 2022 - 2023 by Christian Külker, see LICENSE file.

[pandoc]: https://pandoc.org/
[pankyll]: https://www.pankyll.org/
[Lua]: https://www.lua.org/
[LaTeX]: https://www.latex-project.org/
[Markdown]: https://daringfireball.net/projects/markdown/
[texlive]: https://www.tug.org/texlive/
