ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :title, :body, :post_image_id, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :body, :post_image_id, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
      f.input :tag_list
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :user
    column :title
    column :body
    column :tag_list
    column :created_at
    column :updated_at
    actions
  end

end
