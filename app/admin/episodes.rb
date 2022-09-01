# frozen_string_literal: true

ActiveAdmin.register Episode do
  belongs_to :show, optional: false

  actions :new, :create, :index, :show, :edit, :update

  permit_params :name, :season

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
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :name
      f.input :season
    end
    f.actions
  end

  filter :name
  filter :season
  actions :all
end
