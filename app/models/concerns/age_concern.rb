module AgeConcern
  extend ActiveSupport::Concern
  include ActionView::Helpers::DateHelper

  included do
    def convert_to_years(dob)
      words = time_ago_in_words(dob)
      return 0 unless words.split.last =~ /year/i
      matched_years = words.match(/\d+/)
      matched_years[0].to_i if matched_years
    end
  end
end
