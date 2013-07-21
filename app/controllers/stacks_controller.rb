require 'net/http'
require 'json'

class StacksController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :new]

  def by_user
   if params[:user].is_number? #find by users id or screen name
      @stack = Stack.find(params[:user])
      @stacks_by_user = Stack.find_all_by_user_id(params[:user])
   else
      @stack = Stack.find_by_user_id(User.find_by_username("params[:user]"))
      @stacks_by_user = Stack.find_all_by_user_id(User.find_by_username(params[:user]))
   end  
  end

  def index
    @stacks = Stack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stacks }
    end
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    @stack = Stack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack }
    end
  end

  # GET /stacks/new
  # GET /stacks/new.json
  def new
    @stack = Stack.new 
    2.times {@stack.ingredients.build}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stack }
    end
  end

  def get_images
     _name           = params[:name] ? params[:name] : "failure"
    _url            = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{_name.gsub(' ','%20')}"
    _response       = Net::HTTP.get_response(URI.parse(_url))
    _response_hash  = JSON.parse _response.body
    structure       =  _response_hash.deep_symbolize_keys 
    @stack_imgs      = structure[:responseData][:results].map { |r| r["url"]}

    render json: {
      data: {
        images: @stack_imgs
      }
    }

  end


  # GET /stacks/1/edit
  def edit
    @stack = Stack.find(params[:id])
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(params[:stack])

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render json: @stack, status: :created, location: @stack }
      else
        format.html { render action: "new" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stacks/1
  # PUT /stacks/1.json
  def update
    @stack = Stack.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end
end
