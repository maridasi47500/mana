class ApplicationController < ActionController::Base
before_action :setarray

def setarray
@allimages=Image.chooseten
@allpressreleases=PressRelease.lastten
@allvideos=Video.lastfive
end
end
