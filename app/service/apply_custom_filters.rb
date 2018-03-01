module ApplyCustomFilters
  def apply_custom_filters(collection, filters:)
    filters.reduce(collection) do |result, (key, value)|
      result =
        if permitted_filters.include?(key.to_sym)
          send("#{key}_filter", result, value: value)
        else
          result
        end
    end
  end
end
