Rails.application.routes.draw do

    get "", to: "home#search", constraints: lambda {|req|req.params[:s].to_s.length > 0}
  root to: 'home#index'
    get "evenements",to: "events#events"
    get "agenda",to: redirect("/evenements/agenda")
    get "/evenements/agenda(/page/:page)",to:"events#index",as: :alleventsp,constraints: lambda {|req|req.params[:page]}
    get "/evenements/agenda",to:"events#index",as: :allevents
    get "/actualites(/page/:page)",to:"news#index",as: :allnewsp
    get "/actualites",to:"news#index",as: :allnews
    get "video-archive/page/:page",to: "videos#index",as: :allvideosp

    get "video-archive",to: "videos#index",as: :allvideos
    get "photo-archive",to: "photos#index",as: :allphotos
    get "photo-archive/page/:page",to: "photos#index",as: :allphotosp
  get "agenda/:title",to: "events#show",constraints: lambda {|req|Event.find_by_url(req.params[:title])},as: :event
  get "*title",to: "posts#show",constraints: lambda {|req|Post.findbypath(req.path)},as: :post
  get ":title",to: "press_releases#show",constraints: lambda {|req|PressRelease.find_by_url(req.params[:title])},as: :press_release
  get ":title",to: "news#show",constraints: lambda {|req|News.find_by_url(req.params[:title])},as: :news
    post "/wp-comments-post.php",to: "news#postcomment"
end
