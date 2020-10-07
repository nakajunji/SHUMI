ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile_image_id, :introduction, :hobby
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile_image_id, :introduction, :hobby]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :introduction
      f.input :hobby
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :introduction
    column :hobby
    column '投稿数' do |user|
      user.posts.count
    end
    actions
  end

  show do |user|
    attributes_table(*user.class.columns.collect { |column| column.name.to_sym })
    panel "Posts" do
      table_for user.posts do
        column :title
        column :created_at
      end
    end
    active_admin_comments
  end

end
