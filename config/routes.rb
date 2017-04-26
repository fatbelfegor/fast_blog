Rails.application.routes.draw do
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'

  root to: "posts#index"
  resources :posts

  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact
end
