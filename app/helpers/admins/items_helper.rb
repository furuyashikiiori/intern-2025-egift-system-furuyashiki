module Admins
  module ItemsHelper
    # 使用例:
    #   <%= admin_item_form_with(@item_form) do |form| %>
    #     ...
    #   <% end %>
    def admin_item_form_with(item_form, **options, &block)
      url    = item_form.persisted? ? admins_item_path(item_form.item) : admins_items_path
      method = item_form.persisted? ? :patch : :post

      default_options = {
        model:  item_form,
        url:    url,
        method: method,
        local:  true,
        html:   { multipart: true }
      }

      form_with(**default_options.merge(options), &block)
    end
  end
end
