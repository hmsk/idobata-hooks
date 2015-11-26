module Idobata::Hook
  class Backlog < Base
    screen_name 'backlog'
    icon_url hook_image_url('icon.png')
    template_name { "#{type}.html.haml" }

    helper Helper

    before_render do
      skip_processing! unless type
    end

    private

    def type
      case payload.type
      when 1, 2, 3, 4, 14, 17
        'issue'
      else
        nil
      end
    end

    def space_id
      params[:space_id] || nil
    end

  end
end