class RoomingListsController < ApplicationController
  def index
    rooming_lists = RoomingListResource.all(params)
    respond_with(rooming_lists)
  end

  def show
    rooming_list = RoomingListResource.find(params)
    respond_with(rooming_list)
  end

  def create
    rooming_list = RoomingListResource.build(params)

    if rooming_list.save
      render jsonapi: rooming_list, status: 201
    else
      render jsonapi_errors: rooming_list
    end
  end

  def update
    rooming_list = RoomingListResource.find(params)

    if rooming_list.update_attributes
      render jsonapi: rooming_list
    else
      render jsonapi_errors: rooming_list
    end
  end

  def destroy
    rooming_list = RoomingListResource.find(params)

    if rooming_list.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: rooming_list
    end
  end
end
