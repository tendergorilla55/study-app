# frozen_string_literal: true

json.question @question, :title, :content, :user, :created_at
json.answers do
  json.array! @answers, :text, :created_at, :user
end
