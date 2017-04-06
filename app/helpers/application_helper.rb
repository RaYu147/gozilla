module ApplicationHelper

include HtmlBuilder
def document_title
  if @title.present?
    "#{@title} - Godzilla"
  else
    'Godzilla'
  end
end
end
