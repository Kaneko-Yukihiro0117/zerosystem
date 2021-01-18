# frozen_string_literal: true

Kaminari.configure do |config|
   config.default_per_page = 4
  # config.max_per_page = nil
  # config.window = 4
  # config.outer_window = 0
   config.left = 4
   config.right = 1
  # config.page_method_name = :comment
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
