class CommentsController < ApplicationController
	 before_filter :ensure_login, only: [:create, :new, :edit,:update,:destroy]
  # GET /carts
  # GET /carts.json
  def index
      @commentable = find_commentable
  @comments = @commentable.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
      @comment = Comment.find(params[:id])
      
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @comment }
    	end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /carts/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
   @commentable = find_commentable
  @comment = @commentable.comments.build(params[:comment]) do |c|
    c.user = current_user
  end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @comment = Comment.find(params[:id])
    # session[:cart_id] = nil
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Your cart is empty now' }
      format.json { head :no_content }
    end
  end

  	def find_commentable
 		params.each do |name, value|
    		if name =~ /(.+)_id$/
      			return $1.classify.constantize.find(value)
    		end
  		end
  		nil
	end


end
