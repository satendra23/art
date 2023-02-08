class ArtControlController < ApplicationController
    def read
        c=Article.all
        render json: c


    end

end
