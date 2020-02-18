module DefaultPageContentConcern
  extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Other side of her | blog & portfolio"
    @seo_keywords = "Ayesha Wan portfolio blog tech"
  end
end
