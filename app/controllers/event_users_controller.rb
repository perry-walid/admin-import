class EventUsersController < ApplicationController
  def index
    event_users = EventUserResource.all(params)
    respond_with(event_users)
  end

  def show
    event_user = EventUserResource.find(params)
    respond_with(event_user)
  end

  def create
    event_user = EventUserResource.build(params)

    if event_user.save
      render jsonapi: event_user, status: 201
    else
      render jsonapi_errors: event_user
    end
  end

  def update
    event_user = EventUserResource.find(params)

    if event_user.update_attributes
      render jsonapi: event_user
    else
      render jsonapi_errors: event_user
    end
  end

  def destroy
    event_user = EventUserResource.find(params)

    if event_user.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: event_user
    end
  end
end
