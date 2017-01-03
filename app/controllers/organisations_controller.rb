class OrganisationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter { authorize Organisation }
  respond_to :html

  def index
    @organisations = policy_scope(Organisation)
  end

  def new
    @organisation = Organisation.new
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to organisations_path,
        notice: "Successfully added organisation #{@organisation.name}"
    else
      render :new
    end
  end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update(organisation_params)
      redirect_to organisations_path,
        notice: "Successfully updated organisation #{@organisation.name}"
    else
      render :edit
    end
  end

  private

  def organisation_params
    params.require(:organisation).permit(
      :slug,
      :name,
      :content_id,
      :abbreviation,
      :organisation_type,
      :parent_id
    )
  end
end
