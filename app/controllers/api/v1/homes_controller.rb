class Api::V1::HomesController < Api::V1::GraphitiController
  def index
    homes = HomeResource.all(params)
    respond_with(homes)
  end

  def show
    home = HomeResource.find(params)
    respond_with(home)
  end

  def create
    home = HomeResource.build(params)

    if home.save
      render jsonapi: home, status: :created
    else
      render jsonapi_errors: home
    end
  end

  def update
    home = HomeResource.find(params)

    if home.update_attributes
      render jsonapi: home
    else
      render jsonapi_errors: home
    end
  end

  def destroy
    home = HomeResource.find(params)

    if home.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: home
    end
  end
end
