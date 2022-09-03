# frozen_string_literal: true

ActiveAdmin.register Episode do
  belongs_to :show, optional: false

  actions :all

  permit_params :name, :season, :video

  index do
    selectable_column
    column :name
    column :season
    actions
  end

  show do
    attributes_table do
      row :name
      row :season
      row :videos do
        div do
          video_tag url_for(resource.video)
        end
      end
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
      f.input :season
      f.input :video, as: :file, input_html: { multiple: false }
    end
    f.actions
  end

  filter :name
  filter :season
  actions :all
end
