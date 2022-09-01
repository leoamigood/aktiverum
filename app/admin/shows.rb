# frozen_string_literal: true

ActiveAdmin.register Show do
  menu priority: 1
  actions :new, :create, :index, :show, :edit, :update

  permit_params :name

  index do
    selectable_column
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
    end
    f.actions
  end

  sidebar 'Shows Details', only: %i[show edit] do
    ul do
      li link_to 'Episodes', admin_show_episodes_path(resource)
    end
  end

  filter :name
  actions :all
end
