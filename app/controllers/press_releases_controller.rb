class PressReleasesController < ApplicationController
  def show
    @post=PressRelease.find_by_url(params[:title])
  end
end
