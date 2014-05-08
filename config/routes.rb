PeerDocReview::Application.routes.draw do

  resources :documents, except: [:new, :edit]
  post 'sign-in', to:'users#sign_in'
  delete 'sign-out', to:'users#sign_out'


  resources :users, except:[:destroy]
  post 'session' => 'session#create'
  root "index#index"
end
