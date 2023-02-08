class DemoController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token
    def create
        c=Article.create(title: params[:title], a_auth: params[:a_auth], a_date: params[:a_date], a_content: params[:a_content], a_cat: params[:a_cat])
        render  json:c
    end

    def read
        c=Article.all
        render json:c
    end
    def readone
        x=Article.first
        render json:x
    end

    def findbyid
        xfind=Article.find(params[:id])
        render json: xfind
    end

    def findbycat
        xfind=Article.where(a_cat: params[:id])
        if xfind.length==0
            render html: "no item found"
        else
            render json: xfind
        end
        
    end

    def find
        # by title
        const=params[:cat]
        # render json: const
        if(Article.where(title: params[:cat]).length!=0)
            x=Article.where(title: params[:cat])
            render json: x
        elsif (Article.where(a_cat: params[:cat]).length)!=0
            x=Article.where(a_cat: params[:cat])
            render json: x
        elsif (Article.where(a_auth: params[:cat]).length!=0)
            x=Article.where(a_auth: params[:cat])
            render json: x
        elsif (params[:a_content])
            c=Article.where("a_content like ?","%#{params[:cat]}%")
            render json: c            
        else
            c=Article.where(:a_date => params[:first_date]..params[:last_date])
            render json: c        
        end        
    end

    def findbyauth
        xfind=Article.where(a_auth: params[:id])
        render json: xfind
    end
    def update
        x=Article.find_by_id(params[:id])
        if (x==nil)
            render html:"Id does not exist"
        else
        x.update(title: params[:title], a_auth: params[:a_auth], a_date: params[:a_date], a_content: params[:a_content], a_cat: params[:a_cat])
        render json:x
        end
    end

    def update2
        x=Article.find_by_id(params[:id])
        if (x==nil)
            render html:"Id does not exist"
        else
            
        end
    end

    def deletebyid
       x= Article.find_by_id(params[:id])
       x.destroy
       render html:"Deleted"
    end
end    
    

