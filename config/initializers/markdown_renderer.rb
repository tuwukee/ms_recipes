module MarkdownRenderer
  def self.markdown
    @@markdown ||=
      Redcarpet::Markdown.new(
        Redcarpet::Render::HTML.new(
          escape_html: true,
          hard_wrap: true,
          safe_links_only: true,
          with_toc_data: true
        ),
        autolink: true,
        no_intra_emphasis: true,
        space_after_headers: true,
        tables: true
      )
  end

  def self.render(text)
    markdown.render(text)
  end
end
