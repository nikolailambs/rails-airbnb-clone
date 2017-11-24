class ReviewsController < ApplicationController
  def create
    @office = Office.find(params[:office_id])
    @review = Review.new(review_params)

    @review.user = current_user
    @review.office = @office

     if @review.save!
      respond_to do |format|
        format.html { redirect_to office_path(@office) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'offices/show' }
        format.js  # <-- idem
      end
    end

  end

  def review_params
    params.require(:review).permit(:content, :office_id, :user_id)
  end
end
