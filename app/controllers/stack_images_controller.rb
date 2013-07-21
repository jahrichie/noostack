class StackImagesController < ApplicationController
  # GET /stack_images
  # GET /stack_images.json
  def index
    @stack_images = StackImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stack_images }
    end
  end

  # GET /stack_images/1
  # GET /stack_images/1.json
  def show
    @stack_image = StackImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stack_image }
    end
  end

  # GET /stack_images/new
  # GET /stack_images/new.json
  def new
    @stack_image = StackImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stack_image }
    end
  end

  # GET /stack_images/1/edit
  def edit
    @stack_image = StackImage.find(params[:id])
  end

  # POST /stack_images
  # POST /stack_images.json
  def create
    @stack_image = StackImage.new(params[:stack_image])

    respond_to do |format|
      if @stack_image.save
        format.html { redirect_to @stack_image, notice: 'Stack image was successfully created.' }
        format.json { render json: @stack_image, status: :created, location: @stack_image }
      else
        format.html { render action: "new" }
        format.json { render json: @stack_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stack_images/1
  # PUT /stack_images/1.json
  def update
    @stack_image = StackImage.find(params[:id])

    respond_to do |format|
      if @stack_image.update_attributes(params[:stack_image])
        format.html { redirect_to @stack_image, notice: 'Stack image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stack_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stack_images/1
  # DELETE /stack_images/1.json
  def destroy
    @stack_image = StackImage.find(params[:id])
    @stack_image.destroy

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end
end
