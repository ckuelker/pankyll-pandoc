# +---------------------------------------------------------------------------+
# | Makefile                                                                  |
# |                                                                           |
# | Create a the README.pdf document                                          |
# |                                                                           |
# | Version: 0.1.0                                                            |
# |                                                                           |
# | Changes:                                                                  |
# |                                                                           |
# | 0.1.0 2022-05-30 Christian Külker <c@c8i.org>                             |
# |     - Initial release                                                     |
# |                                                                           |
# +---------------------------------------------------------------------------+
%.pdf: %.md
	@echo $(DEBUG_PRINT)
	echo "$@ $<"
	pandoc -f 'gfm+implicit_header_references+blank_before_blockquote+fenced_code_blocks+backtick_code_blocks+fenced_code_attributes+line_blocks+definition_lists+simple_tables+table_captions+multiline_tables+pipe_tables+yaml_metadata_block+strikeout+superscript+subscript+shortcut_reference_links+implicit_figures+link_attributes+footnotes+inline_notes+emoji+autolink_bare_uris' --verbose --toc --number-sections --from 'markdown+implicit_header_references+blank_before_blockquote+fenced_code_blocks+backtick_code_blocks+fenced_code_attributes+line_blocks+definition_lists+simple_tables+table_captions+multiline_tables+pipe_tables+yaml_metadata_block+strikeout+superscript+subscript+shortcut_reference_links+implicit_figures+link_attributes+footnotes+inline_notes+emoji+autolink_bare_uris' --to latex --standalone --highlight-style zenburn -V 'lang:en-US' -V 'papersize=a4' -V 'fontsize=12pt' -V 'documentclass=article' -V 'mainfont=Noto Sans CJK JP' -V 'sansfont=Noto Sans CJK JP' -V 'monofont=WenQuanYi Micro Hei Mono' -V 'monofontoptions=BoldFont={Noto Sans Mono CJK JP Bold}' -V 'linkcolor=Violet' -V 'citecolor=Green' -V 'urlcolor=MidnightBlue' -V 'toccolor=Gray' -V 'pagestyle=headings' --template=templates/pankyll.latex --pdf-engine=xelatex --fail-if-warnings --lua-filter=filters/replace_verbatim_with_lstlisting.lua --lua-filter=filters/links-md-to-html.lua -o $@ $<
README.pdf:
