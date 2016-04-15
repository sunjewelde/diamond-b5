ActiveAdmin.register_page "Dashboard" do
  
  # section "Latest Diamonds" do
  #   table_for Diamond.order("date").limit(10) do
  #     column :certificate_id do |diamond|
  #       link_to diamond.certificate_id, admin_diamonds_path(diamond)
  #     end
  #     column :date
  #     column "Calut", :weight
  #     column "Color", :color
  #     column "Crality", :clar
  #     column "Price", :end_price
  #   end
  #   strong {link_to "View All Diamonds", admin_diamonds_path}
  # end

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end