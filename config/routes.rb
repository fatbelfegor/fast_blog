Rails.application.routes.draw do
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
  
  root to: "blog/posts#index"

  namespace :admins do
    resources :posts
  end

  scope module: 'blog' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'posts' => "posts#index", as: :posts
    get 'posts/:id' => "posts#show", as: :post
  end
end
