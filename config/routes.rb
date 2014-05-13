PeerDocReview::Application.routes.draw do

  resources :reviews, except: [:new, :edit]
  resources :documents, except: [:new, :edit]
  post 'sign-in', to:'users#sign_in'
  delete 'sign-out', to:'users#sign_out'


  resources :users, except:[:destroy] do
    collection do
      get :me, to: 'users#me'
    end
  end
  post 'session' => 'session#create'
  root "index#index"
end
