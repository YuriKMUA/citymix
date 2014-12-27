#encoding: utf-8
module ApplicationHelper

  def full_title(page_title)
    base_title = %q(CITYmix - стильная одежда)
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
