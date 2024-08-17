module Csvable
  extend ActiveSupport::Concern

  class_methods do
    def to_csv(records)
      headers = csv_headers

      CSV.generate(headers: true) do |csv|
        csv << headers
        records.each do |record|
          csv << csv_row(record)
        end
      end
    end

    private

    def csv_headers
      raise NotImplementedError, "You must implement csv_headers method in your model"
    end

    def csv_row(record)
      raise NotImplementedError, "You must implement csv_row method in your model"
    end
  end
end
