Kurs::Application.routes.draw do
  
  

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users

  match 'auto/news' => 'auto/cars#news'
  
  namespace :auto do
    resources :makes
    resources :models
    resources :cars do
      resources :pictures
      resources :options
      resources :reviews
    end
    resources :categories
  end


  match 'movies/latest' => 'movies#latest'
  match 'movies/top_rated' => 'movies#top_rated'
  match 'movies/coming' => 'movies#coming'
  match 'movies/top_commented' => 'movies#top_commented'
  match 'movies/votes' => 'movies#votes'
  match 'movies/comments' => 'movies#index'
  match 'movies/search' => "movies#search"

  resources :movies, :only => [:index, :show] do
    resources :comments
  end

  match 'auto' => 'auto/cars#index'
  match 'auto/news' => 'auto/cars#news'
  match 'auto/new_cars' => 'auto/cars#new_cars'
  match 'auto/used_cars' => 'auto/cars#used_cars'

  resources :news, :only => [:index, :show] do
    resources :comments
  end

  resources :products, :only => [:index, :show]

  resources :categories, :only => [:index, :show]
  

  root :to => 'pages#home'

  match 'our_news' => 'pages#news'
  match 'our_services' => 'pages#services'
  match 'our_products' => 'pages#products'
  match 'contacts' => 'pages#contacts'
  
end
#== Route Map
# Generated on 25 Sep 2011 20:32
#
#                 auto_makes GET        /auto/makes(.:format)                {:action=>"index", :controller=>"auto/makes"}
#                            POST       /auto/makes(.:format)                {:action=>"create", :controller=>"auto/makes"}
#              new_auto_make GET        /auto/makes/new(.:format)            {:action=>"new", :controller=>"auto/makes"}
#             edit_auto_make GET        /auto/makes/:id/edit(.:format)       {:action=>"edit", :controller=>"auto/makes"}
#                  auto_make GET        /auto/makes/:id(.:format)            {:action=>"show", :controller=>"auto/makes"}
#                            PUT        /auto/makes/:id(.:format)            {:action=>"update", :controller=>"auto/makes"}
#                            DELETE     /auto/makes/:id(.:format)            {:action=>"destroy", :controller=>"auto/makes"}
#                auto_models GET        /auto/models(.:format)               {:action=>"index", :controller=>"auto/models"}
#                            POST       /auto/models(.:format)               {:action=>"create", :controller=>"auto/models"}
#             new_auto_model GET        /auto/models/new(.:format)           {:action=>"new", :controller=>"auto/models"}
#            edit_auto_model GET        /auto/models/:id/edit(.:format)      {:action=>"edit", :controller=>"auto/models"}
#                 auto_model GET        /auto/models/:id(.:format)           {:action=>"show", :controller=>"auto/models"}
#                            PUT        /auto/models/:id(.:format)           {:action=>"update", :controller=>"auto/models"}
#                            DELETE     /auto/models/:id(.:format)           {:action=>"destroy", :controller=>"auto/models"}
#                  auto_cars GET        /auto/cars(.:format)                 {:action=>"index", :controller=>"auto/cars"}
#                            POST       /auto/cars(.:format)                 {:action=>"create", :controller=>"auto/cars"}
#               new_auto_car GET        /auto/cars/new(.:format)             {:action=>"new", :controller=>"auto/cars"}
#              edit_auto_car GET        /auto/cars/:id/edit(.:format)        {:action=>"edit", :controller=>"auto/cars"}
#                   auto_car GET        /auto/cars/:id(.:format)             {:action=>"show", :controller=>"auto/cars"}
#                            PUT        /auto/cars/:id(.:format)             {:action=>"update", :controller=>"auto/cars"}
#                            DELETE     /auto/cars/:id(.:format)             {:action=>"destroy", :controller=>"auto/cars"}
#               auto_options GET        /auto/options(.:format)              {:action=>"index", :controller=>"auto/options"}
#                            POST       /auto/options(.:format)              {:action=>"create", :controller=>"auto/options"}
#            new_auto_option GET        /auto/options/new(.:format)          {:action=>"new", :controller=>"auto/options"}
#           edit_auto_option GET        /auto/options/:id/edit(.:format)     {:action=>"edit", :controller=>"auto/options"}
#                auto_option GET        /auto/options/:id(.:format)          {:action=>"show", :controller=>"auto/options"}
#                            PUT        /auto/options/:id(.:format)          {:action=>"update", :controller=>"auto/options"}
#                            DELETE     /auto/options/:id(.:format)          {:action=>"destroy", :controller=>"auto/options"}
#            auto_categories GET        /auto/categories(.:format)           {:action=>"index", :controller=>"auto/categories"}
#                            POST       /auto/categories(.:format)           {:action=>"create", :controller=>"auto/categories"}
#          new_auto_category GET        /auto/categories/new(.:format)       {:action=>"new", :controller=>"auto/categories"}
#         edit_auto_category GET        /auto/categories/:id/edit(.:format)  {:action=>"edit", :controller=>"auto/categories"}
#              auto_category GET        /auto/categories/:id(.:format)       {:action=>"show", :controller=>"auto/categories"}
#                            PUT        /auto/categories/:id(.:format)       {:action=>"update", :controller=>"auto/categories"}
#                            DELETE     /auto/categories/:id(.:format)       {:action=>"destroy", :controller=>"auto/categories"}
#                       auto            /auto(.:format)                      {:action=>"auto", :controller=>"pages"}
#             auto_cars_news            /auto/cars/news(.:format)            {:controller=>"auto/cars", :action=>"news"}
#            admin_dashboard            /admin(.:format)                     {:action=>"index", :controller=>"admin/dashboard"}
#             admin_comments GET        /admin/comments(.:format)            {:action=>"index", :controller=>"admin/comments"}
#                            POST       /admin/comments(.:format)            {:action=>"create", :controller=>"admin/comments"}
#          new_admin_comment GET        /admin/comments/new(.:format)        {:action=>"new", :controller=>"admin/comments"}
#         edit_admin_comment GET        /admin/comments/:id/edit(.:format)   {:action=>"edit", :controller=>"admin/comments"}
#              admin_comment GET        /admin/comments/:id(.:format)        {:action=>"show", :controller=>"admin/comments"}
#                            PUT        /admin/comments/:id(.:format)        {:action=>"update", :controller=>"admin/comments"}
#                            DELETE     /admin/comments/:id(.:format)        {:action=>"destroy", :controller=>"admin/comments"}
#             admin_products GET        /admin/products(.:format)            {:action=>"index", :controller=>"admin/products"}
#                            POST       /admin/products(.:format)            {:action=>"create", :controller=>"admin/products"}
#          new_admin_product GET        /admin/products/new(.:format)        {:action=>"new", :controller=>"admin/products"}
#         edit_admin_product GET        /admin/products/:id/edit(.:format)   {:action=>"edit", :controller=>"admin/products"}
#              admin_product GET        /admin/products/:id(.:format)        {:action=>"show", :controller=>"admin/products"}
#                            PUT        /admin/products/:id(.:format)        {:action=>"update", :controller=>"admin/products"}
#                            DELETE     /admin/products/:id(.:format)        {:action=>"destroy", :controller=>"admin/products"}
#           admin_categories GET        /admin/categories(.:format)          {:action=>"index", :controller=>"admin/categories"}
#                            POST       /admin/categories(.:format)          {:action=>"create", :controller=>"admin/categories"}
#         new_admin_category GET        /admin/categories/new(.:format)      {:action=>"new", :controller=>"admin/categories"}
#        edit_admin_category GET        /admin/categories/:id/edit(.:format) {:action=>"edit", :controller=>"admin/categories"}
#             admin_category GET        /admin/categories/:id(.:format)      {:action=>"show", :controller=>"admin/categories"}
#                            PUT        /admin/categories/:id(.:format)      {:action=>"update", :controller=>"admin/categories"}
#                            DELETE     /admin/categories/:id(.:format)      {:action=>"destroy", :controller=>"admin/categories"}
#           admin_news_index GET        /admin/news(.:format)                {:action=>"index", :controller=>"admin/news"}
#                            POST       /admin/news(.:format)                {:action=>"create", :controller=>"admin/news"}
#             new_admin_news GET        /admin/news/new(.:format)            {:action=>"new", :controller=>"admin/news"}
#            edit_admin_news GET        /admin/news/:id/edit(.:format)       {:action=>"edit", :controller=>"admin/news"}
#                 admin_news GET        /admin/news/:id(.:format)            {:action=>"show", :controller=>"admin/news"}
#                            PUT        /admin/news/:id(.:format)            {:action=>"update", :controller=>"admin/news"}
#                            DELETE     /admin/news/:id(.:format)            {:action=>"destroy", :controller=>"admin/news"}
#     new_admin_user_session GET        /admin/login(.:format)               {:action=>"new", :controller=>"active_admin/devise/sessions"}
#         admin_user_session POST       /admin/login(.:format)               {:action=>"create", :controller=>"active_admin/devise/sessions"}
# destroy_admin_user_session DELETE|GET /admin/logout(.:format)              {:action=>"destroy", :controller=>"active_admin/devise/sessions"}
#        admin_user_password POST       /admin/password(.:format)            {:action=>"create", :controller=>"active_admin/devise/passwords"}
#    new_admin_user_password GET        /admin/password/new(.:format)        {:action=>"new", :controller=>"active_admin/devise/passwords"}
#   edit_admin_user_password GET        /admin/password/edit(.:format)       {:action=>"edit", :controller=>"active_admin/devise/passwords"}
#                            PUT        /admin/password(.:format)            {:action=>"update", :controller=>"active_admin/devise/passwords"}
#                 news_index GET        /news(.:format)                      {:action=>"index", :controller=>"news"}
#                       news GET        /news/:id(.:format)                  {:action=>"show", :controller=>"news"}
#           new_user_session GET        /users/sign_in(.:format)             {:action=>"new", :controller=>"devise/sessions"}
#               user_session POST       /users/sign_in(.:format)             {:action=>"create", :controller=>"devise/sessions"}
#       destroy_user_session DELETE     /users/sign_out(.:format)            {:action=>"destroy", :controller=>"devise/sessions"}
#              user_password POST       /users/password(.:format)            {:action=>"create", :controller=>"devise/passwords"}
#          new_user_password GET        /users/password/new(.:format)        {:action=>"new", :controller=>"devise/passwords"}
#         edit_user_password GET        /users/password/edit(.:format)       {:action=>"edit", :controller=>"devise/passwords"}
#                            PUT        /users/password(.:format)            {:action=>"update", :controller=>"devise/passwords"}
#   cancel_user_registration GET        /users/cancel(.:format)              {:action=>"cancel", :controller=>"devise/registrations"}
#          user_registration POST       /users(.:format)                     {:action=>"create", :controller=>"devise/registrations"}
#      new_user_registration GET        /users/sign_up(.:format)             {:action=>"new", :controller=>"devise/registrations"}
#     edit_user_registration GET        /users/edit(.:format)                {:action=>"edit", :controller=>"devise/registrations"}
#                            PUT        /users(.:format)                     {:action=>"update", :controller=>"devise/registrations"}
#                            DELETE     /users(.:format)                     {:action=>"destroy", :controller=>"devise/registrations"}
#                   products GET        /products(.:format)                  {:action=>"index", :controller=>"products"}
#                    product GET        /products/:id(.:format)              {:action=>"show", :controller=>"products"}
#                 categories GET        /categories(.:format)                {:action=>"index", :controller=>"categories"}
#                   category GET        /categories/:id(.:format)            {:action=>"show", :controller=>"categories"}
#                       root            /                                    {:controller=>"pages", :action=>"home"}
