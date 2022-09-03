# frozen_string_literal: true

ActiveAdmin.register User do
  menu priority: 2

  actions :all

  permit_params :username, :email, :first_name, :last_name, :authentication_token

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :username
      row :first_name
      row :last_name
      row :email
      row :authentication_token
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.semantic_errors

    f.inputs do
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :authentication_token
    end
    f.actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
end
