class AttachmentsController < ApplicationController
  def index
    attachments = AttachmentResource.all(params)
    respond_with(attachments)
  end

  def show
    attachment = AttachmentResource.find(params)
    respond_with(attachment)
  end

  def create
    attachment = AttachmentResource.build(params)

    if attachment.save
      render jsonapi: attachment, status: 201
    else
      render jsonapi_errors: attachment
    end
  end

  def update
    attachment = AttachmentResource.find(params)

    if attachment.update_attributes
      render jsonapi: attachment
    else
      render jsonapi_errors: attachment
    end
  end

  def destroy
    attachment = AttachmentResource.find(params)

    if attachment.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: attachment
    end
  end

  def attachment_params
    params.require(:attachment).permit(:event_user_id, :file)
  end
end
