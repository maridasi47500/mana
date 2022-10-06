class MediathequeController < ApplicationController
  def photo
    @photos=Image.bypage(params[:page])
  end

  def video
    @videos=Video.bypage(params[:page])

  end
end
