Rails.application.routes.draw do
  root 'index#input'
  get 'index/output'
end